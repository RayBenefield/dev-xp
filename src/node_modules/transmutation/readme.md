<p align="center">
    <a href="https://github.com/RayBenefield/transmutation">
        <img src="https://screenshotlayer.com/images/assets/placeholder.png" alt="Transmutation"/>
    </a>
    <br />
    <sub><em>Placeholder until a logo is designed</em></sub>
</p>

# Transmutation

[![npm](https://img.shields.io/npm/v/transmutation.svg)](https://www.npmjs.com/package/transmutation)
[![npm](https://img.shields.io/npm/dm/transmutation.svg)](https://www.npmjs.com/package/transmutation)
[![Travis](https://img.shields.io/travis/RayBenefield/transmutation.svg)](https://travis-ci.org/RayBenefield/transmutation)
<br/>
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/RayBenefield/ama)
[![Conventional Changelog](https://img.shields.io/badge/changelog-conventional-brightgreen.svg)](https://conventionalcommits.org/)
<br/>
[![GitHub license](https://img.shields.io/github/license/RayBenefield/transmutation.svg)](https://github.com/RayBenefield/transmutation/blob/master/LICENSE)
[![Known Vulnerabilities](https://snyk.io/test/github/raybenefield/transmutation/badge.svg)](https://snyk.io/test/github/raybenefield/transmutation)

Enhanced promises for immutable data processing, inspired by RxJS and Lodash.

## NOTICE: Active Development

**Transmutation** is still in its early stages of development. Feel free to
watch this project as it grows and use the
[**issues**](https://github.com/RayBenefield/transmutation/issues) section to
put in any questions or ideas you may have.

*Nothing in this project promises to be stable until we reach `v0.1.0`.*

---

### Work Log

**Transmutation** is developed with an agile methodology that I'm currently
developing called **Dex**. This methodology revolves around doing 25 minute work
sessions (inspired by the [**Pomodoro
Technique**](https://lifehacker.com/productivity-101-a-primer-to-the-pomodoro-technique-1598992730))
and then logging what was done in that session with a work log entry.

**You can find all of the work log entries here:** [`./worklog.md`](./worklog.md)

---


## Inception

**Transmutation** originally came out of my regular usage of `RxJS` for API
development. I loved the utilities given among `map`, `filter`, `mergeMap`, and
all of the handling of async processing. Being able to declaritively manage
dozens of different types of calls to external resources proved to be extremely
valuable in development. As I did more and more creation of APIs, I noticed a
steady pattern emerging. Instead of just pushing one input into a part of the
stream and coming out with a different output, I realized that I would have to
refactor less if I just extended the input with the output at each portion of
the stream. Mainly because I constantly found myself having to go back and
introduce new dependencies at certain parts, and having to do a bunch of
refactoring to make sure it got to certain parts of the stream.

From this I started to form a theory of **data snowballing**. More than just
immutability and avoiding state changes in my code, if I never got rid of the
ability to access any data I have collected, I never have to create a coupling
of a later portion of the process back up to an earlier portion. Every bit of
data is instead collected on the way down and can NEVER be removed until you are
done with the request. At first it felt like it would create a lot of data
management, but ultimately it proved to improve my code to the point where
making future modifications were actually very easy. As long as a request has a
"single responsibility" and it does a limited amount, it should never run into
problems. In theory... as time goes on I'll probably discover some falacies in
this plan.

Along the way I learned more things that would prove useful in this thought
process and formulated **Transmutation** to capture these capabilities. After
using it in several projects now, I'm fairly convinced this is a solid approach
to doing logic. Check out the [\#Usage](#usage) section below for examples.


## Install

**Pick one** - *Listed in order of recommendation*

```bash
yarn add transmutation
npm i -S transmutation
npm install --save transmutation
```


## Usage

The documentation below covers basic concepts in **Transmutation** including its
`promise` like interface, basic extending, deep manipulation, conditionals, and
external service interaction.

**For more detailed readable usage documentation:** [./docs/usage.md](./docs/usage.md)

**For all tested use cases:** [./src/node_modules/__tests__/\*](./src/node_modules/__tests__)

---

### Transmutation Promise

**Transmutation** works like a stream or chained promises. Every chained
function call builds on the previous. The output of the one goes in as input for
the next. The stream begins by passing data into the default export `transmute`
function, and the stream ends by ending with `.then()`. Like `promises`, then
will accept the output of the stream and anything can be done with it.

```js
import transmute from 'transmutation';

transmute({ first: 'data' })
    .then(value => console.log(value));

// Prints
{ first: 'data' }
```

---

### Basic Extending

Once data has been `transmuted`, it can now be transformed with various
operators. The core operator is `extend`. Data in keys in a `transmutation`
cannot be modified or overwritten. New keys may be added, new items may be
pushed to arrays, and new children can be added, but once it has been added it
can never be removed in a later part of the pipeline. The final `then()` will
always be a full "snowball" of all data gathered through the stream.

```js
import transmute from 'transmutation';

transmute({ first: 'data' })
    // Next line adds a new 'second' key to the base object
    .extend({ second: { data: 'new' } })
    // Next line adds a new child to the 'second' key, since it wouldn't remove any data
    .extend({ second: { child: 'a new child' } })
    // Next line will not modify the 'first' key since it is a string
    .extend({ first: { child: 'a child' } })
    .then(value => console.log(value));

// Prints
{ first: 'data', second: { child: 'a new child', data: 'new' } }
```

---


### Deep Manipulation

Because data can never be removed in a `transmutation`, there is great value in
working with nested objects. Eventually nested objects get to be very difficult
to work with, so **Transmutation** takes the JSON path based approach used in
`lodash` and other libraries to make working with them easier. Most operators in
**Transmutation** support path based manipulation.

```js
import transmute from 'transmutation';

transmute({ first: 'data' })
    .extend({ second: { data: 'new' } })
    // Next line does the exact same thing as the previous line
    .extend('second.data', 'new')
    .then(value => console.log(value));

// Prints
{ first: 'data', second: { data: 'new' } }
```

---


### External Data

Part of the value out of `RxJS` was doing async processing with external
services both in the form of adding new data to work with and committing side
effects like saving to a database. Basic extending goes beyond just basic data,
it will take in a promise as well, allowing you to easily add external data to
your `transmutation` stream.

```js
import transmute from 'transmutation';
import request from 'request-promise-native';

transmute({})
    .extend('firstUserName', request('https://jsonplaceholder.typicode.com/users')
        .then(JSON.parse)
        .then(users => users[0])
        .then(user => user.name)
    )
    .then(value => console.log(value));

// Prints
{ firstUserName: 'Leanne Graham' }
```

And of course, if there is something you need from the "snowball" most operators
allow for functions to be passed where the argument given is the snowball at
that current state. So if you start with the user ID, then you can use that.

```js
import transmute from 'transmutation';
import request from 'request-promise-native';

transmute({ userId: 1 })
    .extend('userName', data => request(`https://jsonplaceholder.typicode.com/users/${data.userId}`)
        .then(JSON.parse)
        .then(user => user.name)
    )
    .then(value => console.log(value));

// Prints
{ userName: 'Leanne Graham', userId: 1 }
```

---


### Side Effects

And of course we are able to send data outwards. The key with side effects is
that typically we just want to send a portion of the data out to a system, but
have that part of the pipeline return the same data it was given without any
modification. In **Transmutation** we do that with the `do()` operator. It will
execute the promise without modifying the base "snowball" of data and when it is
done the stream will continue.

```js
import transmute from 'transmutation';
import request from 'request-promise-native';

transmute({ name: 'Ray Benefield' })
    .do(user => request.put({
        uri: 'https://jsonplaceholder.typicode.com/users/1',
        json: true,
        body: user,
    }))
    .then(value => console.log(value));

// Prints
{ name: 'Ray Benefield' }
```

---


## Team

|[![Ray Benefield](http://gravatar.com/avatar/e931b13306ea1022549766266727f789?s=144)](https://github.com/RayBenefield) |
|:---:|
|[Ray Benefield](https://raybenefield.com) |
|[Chief Architect](https://en.wikipedia.org/wiki/Software_architect) |


## License

MIT © [Ray Benefield](https://raybenefield.com)
