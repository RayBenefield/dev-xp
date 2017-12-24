# Kape

So I've been inspired by [**Tape**](https://github.com/substack/tape) as a great
solution for testing. It is super minimalistic and super fast. But I need
something more. First I needed to write my tests in modern JS... so I used
`babel-tape-runner`. Then I needed to write in a more BDD style terminology. So
I setup [**Tape BDD**](https://www.npmjs.com/package/tape-bdd). And then I
needed to work with promises so I setup [**Blue
Tape**](https://www.npmjs.com/package/blue-tape). And NOW I need to work with
snapshots, so I attempted to setup
[**Snapshotter**](https://www.npmjs.com/package/snapshotter). And now I've got
so many details tied together that it is quite a mess. I need something new.


## My Needs

So here is what I would like in a test runner based on what I have setup now:

 - BDD style terminology
 - Written in modern Javascript with Babel
 - Promise support by default
 - Snapshot based testing

There are a few more things I'd like. First of all... I'd REALLY like to have a
data driven framework. I've attempted this before with
[**RxT**](https://github.com/RayBenefield/RxT). It worked out fairly well, I
used observables and what not with [**RxJS
5**](https://github.com/ReactiveX/rxjs). It worked well, but I didn't handle
certain things well and I've outgrown [**RxJS
5**](https://github.com/ReactiveX/rxjs) at this point. I think I can do things
simpler. Something I did realize is that it may be SUPER valuable to use
Snapshot testing EVERYWHERE. Like seriously... something people like to do is
manually make sure something works. So when it does... why not just snapshot its
outputs with various inputs. Pure functions are just a lookup table, so why not
just let the lookup table act as your test? If you want to actively assert
certiain things awesome, but always snapshot the results. So all this adds:

 - Data Driven Testing (test lots of multiple inputs)
 - Snapshot outputs from inputs by default

Now the current closest testing framework to what I want is
[**Ava**](https://github.com/avajs/ava/). I tried getting
[**Ava**](https://github.com/avajs/ava/) to work with my babel setup and my
[**Alle**](https://github.com/boennemann/alle) setup and it just wasn't smooth
and zero config at all. So I need something that works exactly as
[**KI/KD**](https://github.com/RayBenefield/kikd) expects it to.


## What a test would look like

So what should a test look like:

```js
import { describe, result } from 'kape';
import myFunction from 'my-function';

const options = { renderer: () => {} };

describe('My Function with options', myFunction({ options }), it => {
    it('should add a "new" key to the output', given =>
        given([
            () => {},
            'roar',
            { test: 'roar' },
        ])
            .then(result.shouldHave('new'));
    )
});
```

The above test will run 3 different tests against a configured (or not
configured) function. That second argument for `describe` is the equivalent of
a `setup` or a `context` or a `beforeEach`. The `given` defines an array of
inputs that should be tested. The `then` is an active assertion of what you want
to verify. `result` is just a batch of assertions that return a function
accepting the output and running an assertion against the output. It is setup
that way to allow for pluggable assertions and a more readable syntax. And
finally every `given` input will save its output as a snapshot by default. So
even though you are just asserting for the `new` property, you are still
shielded from function changes that might happen.
