# Work Log

## #79

Locked down the master branch again and closed that issue and spent some time
exploring which badges to add to the readme, so I think it is good now. That is
all done. Just doing some small cleaning up here and there before I tackle some
work on [**KI/KD**](https://github.com/RayBenefield/kikd). That is next on my
list now. Because I can't move forward without some real publishing system for
all of the packages.


## #76, #77, #78

Spent another 3 sessions exploring the `Alle` monorepo system and I got
everything working and figured out. Even explored how linting and stuff would
affect everything. Now ever operator is properly in its place and the project is
completely split up. Which is awesome!!! Next is to start figuring out how to
handle publishing the multiple projects as I have to adjust the `rollup` system
to build all of the projects... or at least the ones that need to change. Lots
to consider. I think my next batch of time is going to be focused on
[**KI/KD**](https://github.com/RayBenefield/kikd) instead of
[**Transmutation**](https://github.com/RayBenefield/transmutation). But I've
been expecting that. Now that I have an example of the `Alle` monorepo project
structure I can move forward with
[**KI/KD**](https://github.com/RayBenefield/kikd). Breakfast time and today the
**Monster Hunter World Beta** is out for 3 days... so my weekend will be very
distracted lol...


## #73, #74, #75

Spent a lot of time trying to solve the test system and figuring out why babel
was not working properly. I settled on setting up the test script to cd into the
`node_modules` folder before running the tests. Apparently `babel-register`
ignores compiling things inside of `node_modules` explicitly. So I had to dive
into the directory before running the tests which ends out working fine. I've
got the initial split up of the repository going, now I just need to split it up
even more into my ideal situation. And then later I can start figuring out how
to handle multi-project publishing. Cuz right now even though I'm splitting up
all of the projects, and they include each other, they are still not being
published at all. So that will be its own kind of fun.


## #72

So I've taken like a week break while I work on another project (again) to focus
on taking all of the quality tricks that I've learned over this past month with
**Transmutation** and turn it into a standard toolset. Yesterday however I
discovered a potentially awesome technique for setting up a monorepo really
easily and I started testing it on **Transmutation**. I've got it mostly figured
out including the rollup config stuff and a couple other things. All I've got
left is trying to figure out how to get my tests to properly run. They are
running into a babel configuration error somewhere, probably because the
packages are now nested deeply in another folder. My brain is hurting. I always
hate babel configuration errors. They are the only real problem that I run into
now on a regular basis.


## #71

I'm quite proud of what I've accomplished this early morning. I was able to
finish up the build system and shrink down the module size, make it consumable
for browsers, and more. It was super awesome. This last session I spent trying
to replace lodash's `get`/`set`/`has` with something simpler and I added
**Sindre's** `dot-prop` package and it actually reduced my gzip file size down
to 7.7 KB, about 1.5 KB smaller than it was. I'll end up switching to `dot-wild`
soon which will kick back up the size, but the functionality gained by being
able to do wildcards and stuff will be SOOO awesome. So it will be worth it when
I tackle it. I also played around with `unpkg.com` to make sure
**Transmutation** was easily usable in the browser. The package for browsers
actually cuts out the customizable portions of **Transmutation** for now. It
also doesn't export `isolate`. I plan to add in both `isolate` and `circle` into
the browser global exports, but for now it is good where it is.

It's been a good day and this weekend I'm going to finish up the changelog and
really polish the readme and docs before I start jumping into building out the
initial `circle` functionality. If I can make `circle` a replacement for stream
libraries like `RxJS` and `xstream` while keeping the same interface and
immutable principles of `transmute` I'll have something very successful on my
hands. **Functional Reactive Programming (FRP)** in its current state is filled with lots
of mathematical words and complexity that isn't great for your general JS
audience. I'm hoping `transmute`, `circle`, and `isolate` helps to improve the
**Developer Experience (DX)** to get people more into FRP. It is a powerful paradigm,
but not enough people are using it and I think it is because of the painful DX.
Hopefully I can make **Transmutation** a solid package that is small, efficient,
and easy to use all at the same time. And it will open the doors to many more
things in the future. Looking forward to tackling those big ideas after handling
**Transmutation**.


## #68, #69, #70

So I got REALLY sucked into and obsessive over shrinking down the bundle size.
So I started experimenting with breaking things apart and cutting out as many
lodash dependencies as possible. I got down to pretty much just 5 pieces of
lodash and I think I can remove `has`/`get`/`set` using either `dot-wild` or
`dot-prop`. I might quickly try to replace it with `dot-prop` and see if that
cuts it down any. There is still some extra duplicate code due to  the `each`
operators that will get removed with a proper `circle` implementation. But I'll
survive for now. Going to try to wrap this up and test it properly. I still need
to adjust the full build system to include the package.json, license, and
readme like the old build system. AWAY!!!


## #65, #66, #67

Did a triple session trying to get rollup setup so I can treeshake and get
everything sized down. I think I set it up just right and things will be awesome
from here. Took me a while to figure out some babel transpiling things and
stuff. I can cut a lot of details out I think and simplify things a bit, but we
shall see. Lots to play around with for optimization.


## #64

Spent my session working on putting in a patch/pull request to the
`conventional-changelog-cli` package to properly handle a custom configuration
using a promise. Wasn't too bad as it was a one line change and just had to add
a test for it.


## #59, #60, #61, #62, #63

Got SUPER sucked into creating the template system. Once I started to figure
things out I couldn't stop myself. I've got a basic changelog writer that will
work for now. Unlike the **Angular** changelog I have a setup that will not only
add *Features*, *Bugs Fixes*, *Performance*, and what not, but also add
important developer details like *Documentation*, *Tests*, *Refactors*, and *DX
Improvements*. Took a bit to find a system that worked, and realized that I
could tap into the notes system that the changelog writer has. Which works out
perfectly. I may have to setup a different way to handle Breaking Changes
though... so there is that. But I think I have an idea on what to do. We shall
see.


## #58

Started looking at what it is going to take to create a Changelog writer for
**Transmutation** and it isn't exactly the simplest project. I think I'm going
to need to setup babel-register to use ES6 and then go from there. I tried
importing the **Angular** writer right off the bat, but that didn't work out
exactly. I discovered that the CLI tool for writing changelogs has a bug in it
where it doesn't load a config properly if it returns a prommise in the same way
it handles presets. So I'll probably put in a bug fix for that tomorrow. For
now, I'm going to do one more session of just screwing around a bit with the
changelog writer and if need be I'll fork and fix it on there until I can get a
pull request merged.


## #57

This was a VERY painful session, but was needed. I went through my entire commit
history and changed everything to be imperative present tense. I think I am now
ready to start tackling the changelog system. I'm excited!!! This is why I
decided to start doing all of this commit based requirements in the first place
and now I will be rewarded for my work!


## #56

Woot I actually got a lot done this session. I setup scope enumerations for
`commitlint` which is super nice. I rebased all of the commit messages for
worklog entries to not point to issues with a hashtag anymore and also move the
skip ci tag to the footer. And I also setup Travis Slack Notifications along
with Github Slack Notifications... super nice and super easy. ;)


## #55

Just logging my double session here.


## #54

Worked a double session in order to properly rebase all of the tags in the
history of the repo to the proper commit and now it seems like everything is
working out perfectly. It took me a while to really dive in properly and fix
everything. But I'm happy that it is finally done.


## #53

Travis was not patching things properly as it was commit ammending and it kept
losing its proper tagging which is painfully sad. So now it is properly patched
and working which is awesome and it is now using postversion instead of a run
script for each version type. Which is much cleaner anyway and this should make
the changelog implementation much better as well.


## #52

I spent a lot of this time trying to fix the patching commit message for adding
skip ci to the header. Now I need to go through the history and rebase all the
messages, but I think I'm good for the most part. Just historical fixing. I've
also noticed that tags aren't being properly created in Travis so I have to look
deeper into that. I'm so confused!!! But I'm getting closer. Going to the movies
for now, I'll fix this tonight or in the morning hopefully. So close I think all
that is left for cleaning up is setting up the changelog system and a few more
just minor clean up stuff and then a CONTRIBUTING document.


## #51

Went through and fixed some of the skip ci messages and moved them all to the
footer. Didn't really get much done. I need to go through and rebase the old
commits in master. I'm hoping this is the last time I'm touching master. I also
setup a rewrite script for rebasing to move tags. Not sure if it is working, but
we shall see.


## #50

Went through and setup `commitizen` which will use inquirer to construct a
commit which is awesome. And not only that I found an adapter for `commitizen`
that uses my `commitlint` config, which is more awesome as now it counts the
number of characters remaining as well as checks for enums properly and what
not. WOOT! Kind of awesome. Next is to setup the changelog which will be super
nice.


## #46, 47, 48, 49

Went through and rebased all of the commits in the `master` branch to match the
current commit conventions. And also reset all the tags to point to the right
commits properly. So everything should be good to go. The next thing on my todo
list is probably to handle the changelog creation now and to create changelogs
for all of the previous releases. Should be fun.



## #45

Added githook setup for checking commit message convention. Also tied it into
Travis for CI checking. I'm also in the middle of updating the log script to
handle worklogs properly. Hopefully it is working properly. It checks out master
then goes back to the branch and rebases onto the new master.


## #44

Got `husky` setup in place of `git-hooks` and that was super easy. I'm currently
going through and setting up commit standards to setup as a git hook. Taking my
break for now. I also have to figure out whether I can add some special **DEX**
processing for changelog generation in the future.


## #43

Explored the commit convention tools that exist. I was going to setup commit
linting and realized that I probably want to switch to using `husky` first for
my git hooks so I'm going to switch to that first next session instead and with
that I should be able to setup linting easily.


## #42

Spent a bit of time exploring some more conventions for improving the repo's
contribution workflow. I want to add JS inspect for checking for duplicate code
and also add commit guidelines in general. I honestly have no idea how I'm going
to enforce **DEX** development at all, but I don't think I'll get any
contributions any time soon, so I'll think on that. I want to eventually move
**Transmutation** into being one of the first projects managed by a **DEX**
platform because I would like to see **Transmutation** compensate people for
contributing to the project because I believe it could be as powerful as
**RxJS**, but more approachable. I want to compensate for **DEX** sessions done.
But really I need a **DEX** platform to really push that forward. We'll see
though, lots to consider. The biggest problem right now doing it manually
without a platform is the numbering system, since work will be done
asynchronously and also logs are checked into the repo instead of managed by a
platform. So I need to make sure I figure that out in the future. For now...
I'll just do everything manually myself. Oh and I need to figure out Changelog
generation as well on top of commit standards. Lots to do to improve this repo
and get a good handle on open source standardization moving forward which will
be useful for other projects I work on.


## #30, #31, #32, #33, #34, #35, #36, #37, #38, #39, #40, #41

Soooo... I just spent 12 damn sessions setting up Travis CI to work as I want it
to. So now Travis CI will run tests and linting on pull request, then on merge
of the pull request it will create a patch, commit the change to master, and
then deploy the new patch to NPM. So I have full continuous integration and
deployment now setup. :) This won't be so easy when I setup multiple packages
and set it up as a mono repo, but this is a solid start. It took a LOT of time
to setup the patching system to work just right and I am SOOO happy it is done
now. And the plan is that I will manually do a minor or major revision. When I
need to do that, then I'll see how that works out.


## #29

I setup a bunch more issues with more ideas of things that need to be done. In
addition I created an NPM organization, a Github organization, and registered
the `transmutation.io` domain. I'm looking forward to sharing this sorcery that
I've been playing with a lot. I also figured since I'm building a site for
**Transmutation** I might as well start using **Fyre** to build it. And hell,
this is a good reason to start setting up **Dex** as well. All of my projects
will come together!!! It is exciting. Oh and I can display **Hermes** on it
since **Hermes** is really the first open source project to attempt to fully
utilize **Transmutation**. There is a lot of cool things happening!!! Loads of
fun.


## #28

Just the log entry for the second of a double session.


## #27

Just logged a double session preparing for more work in the future for
**Transmutation**. I'm excited to formalize this more as I move forward with my
development skills. **Transmutation** has the potential to complete remove the
need for curly braces for a function body... lol. It is a lot of fun actually.
And I'm looking forward to some of the fun ideas I have like meta operators,
circles, and traps. Hopefully I'll get to a point where I feel comfortable with
a `v0.1.0` release and start advertising its possibilities. We shall see. First
is really proper error handling and bubbling.


## #26

Setup the iterator system to handle iterable side effects and then implemented
it into the project that needed it and it worked like a charm. Very happy that
went quickly too. And I published a new version woot!!!


## #25

Had to add an iterator system for fields for a project. Started with an iterable extension
system and I will be adding an iterable side effect system next.


## #24

I added a usage document as well as documentation around starting to design a
logo. I still have a lot of specific documentation on usage for
**Transmutation**, but ultimately I think that I have a solid start that is good
enough for a portfolio showing. And also... this marks 10 hours of work into
this project. WOOT!!! Not bad for 10 hours. Very happy with the results. There
are still lots of features that I want, but I'll get there over time. Very happy
with the results at this point and I look forward to the next major package that
will work for this, which is **Divination**. **Divination**'s goal will be to
make **Transmutations** very easy to test. It will take inspiration from my old
package **RxT** which was a declarative testing framework for **RxJS**. And now
that I'm not using rx, I now need a testing framework for **Transmutation**. :)
Should be awesome.


## #23

The documentation is taking a lot longer than I expected, but it is definitely
worth it. I've finally covered interacting with external services. I think that
is the most I'll do for the readme documentation and I'll probably start taking
time to cover the detailed usage document tomorrow to at least get started on
it. And probably put it under the docs folder. So I'll wrap up my documentation
efforts with one more session before long break time with Jess. :) <3


## #22

Added more detailed documentation over basic concepts in **Transmutation**
including basic extending and deep manipulation. Next I'll be covering details
on working with external services including taking in new data and committing
side effects.


## #21

Added documentation on how **Transmutation** came to be. It covers how I started
with heavy use of observable streams through `RxJS` and then morphed into this
philosophy of immutable data snowballing. I also added the initial portion of
the Usage documentation. Still more to cover in terms of basic usage and then
I'll start documenting each operator and unique usage in the specific usage
documentation.


## #20

Finally started doing some documentation on **Transmutation**. I've got the initial
readme done and structure. I'm going to start working on Usage documentation
next, starting with basic usage on the readme and then detailed operator usage
on a separate document. Right now the focus is on polishing the package to make
it as presentable as possible for my portfolio. Breakfast time!


## #19

Started work on setting up a default case for the switch operator and that took
less than a couple of minutes and was super easy and decided the next thing that
I really wanted to do was setup an empty transmutation that could accept a value
later on. This will be important in the future as I move towards testing
transmutations with a new framework which is awesome. I need to start looking
into doing documentation for transmutation as well as there are a lot of cool
things you can do. Super happy about the pipeline stuff. I've been thinking
about naming them **Transmutation Formulas** or **Transmutation Recipes**...
since they are directions to a transmutation without having the actual starting
data yet. Now that I have this feature though I can abstract out the business
logic that I have in other packages now and then run tests over the logic with
various amounts of different datas... woot! New package release... perhaps in
the near future I'll actually do a true `0.1.0` release when I feel like it is
truly useable by outsiders. But I'll need documentation and proper error
handling before ever doing that.


## #18

Worked on the isolate function that makes it easy to isolate pieces of objects.
It supports a single path or multiple paths in the form of an array. It is
curried so it can be passed to things like the extend operator to do fun awesome
things.


## #17

Finished up the delayed do operator work, also added support for arrays for the
ifNo operator. And I also had time to refactor out the operators into their own
file using the wildcard plugin for babel. Lots done. Now I'm going to
potentially look into an isolate function next. Time for my break. Thing is I'm
on a plane so I'll just have to sit here for a bit.


## #16

I had to revert the last commit that I had dealing with trying to bubble up
errors, it just wasn't working out properly. I finished up adding array support
for the if operator... I guess I need to add it to the ifNo operator as well.
Well I also started work on properly waiting for the Do operator's side effect
to finish since I have a lot of side effect stuff that needs to be done in other
projects.


## #15

So I thought I solved things, but I definitely didn't. As soon as I started
adding back the other tests they all started breaking because the catch tests
were throwing errors haphazardly so now I have to figure out a solid way to
prevent that. Error handling is SUPER stressful... AHHH!!!


## #14

So I realized while using **Transmutation** that I have a problem with how errors
are handled. When I start nesting transmutations then I start swallowing errors
which is not what I want to do. I want to be able to error anywhere deep in the
chain and it needs to bubble up. In order to do that I have to figure out where
and when and how errors are being handled deeply and find a way to bubble
everything up. And this is already proving to be fairly difficult. So I hope I
don't get "trapped" in this forever. Once I figure out how to bubble errors I
will definitely then put some work into this "trap" operator concept where I'm
able to catch an error and convert it into an object instead so it can still be
handled neatly (like sending back an HTTP response). I'm kind of anxious about
this all, because error handling with promises are a very unknown bit of
territory for me so I have a lot of learning to do. Hopefully things go smoothly
tonight and I at least solve the bubbling problem. Wish me luck...


## #13

Added a new switch operator which was super simple, then got stuck on what to
work on next. So I built up my todo list first which was just transferring some
ideas I had from **Google Keep**. Then I realized that I forgot to add one of my
old operator ideas which was putting the value `under` a path. Which can totally
become useful moving forward. I did discover that if I use a conditional
operator like `if`, `ifNo`, and `switch` that I can only tie a single transducer
instead of a chain to the conditional. I think I know how to do a chain, but it
may take some thought first. Regardless, I threw on a whole bunch of operators
today and I'm quite proud of that. I'll push up my latest version and then I
might start applying it around places tomorrow. We shall see. I can probably
refactor some more things in **Rampant.AI** now.


## #12

Totally had a good run this go around as I knew exactly what to do. So first I
finished up the log operator and added some skipped tests to test out the
console logging actually. And then when I finished that I jumped straight into
the `if` and `ifNo` operators. Took me no time at all since I was able to extend
the default transmuter with the operators and use them to just make transducers
which is awesome and was SUPER easy. Way easier than I thought. I think I know
how to do meta operators that affect the whole transducer list as well... like
adding a logging statement between every transducer to inspect the stream. SUPER
useful if I can pull it off. I was super shocked at how easy `if` and `ifNo`
were. And very happy about it should make things a lot more declarative. The
next operator that I really want to tackle though is definitely a `switch`
operator since it is one of the key things that creates verbosity in **RxJS** for me
since you have merge two streams and filter both because if you don't output
from a stream it just never outputs. It is crazy painful. So hopefully that will
go smoothly.


## #11

I started working on more operators that would be useful. I started with the do
operator to handle side effects (which there are quite a few of in **Rampant.AI**).
That went fairly quickly... you can even scope the value of the callback
argument which will be super handy. On top of that I'm working on a log operator
so it is easier for me to throw log statements where I want. It accepts a logger
for testing purposes, but defaults to console.log. It should be useful when I
get through it. I want it to be able to log with a label in addition to being
able to scope the value. This by itself won't save any code in **Rampant.AI** but it
will still be useful. I'll get back to it after this break.


## #10

Found a teensy bitsy bug that I can't figure out how to quite fix yet. I assume
it has to do with the fact that I'm doing a reduce. But hopefully I'll figure it
out in the future. Until then I spent some simple time refactoring a bit and
adding a couple of tests. I really need to move on to actual functionality now.
lol... stop focusing on the perfect and start adding some awesome.


## #9

So the refactor for my **Rampant.AI** platform went smoothly. It took roughly 5
pomodoros (25 minute sessions) and a real time of about 3 hours. I refactored
away from **RxJS** and to **Transmutation** and promises where **Transmutation**
didn't have the feature set needed quite yet. The code base went from 320 lines
of code to 247 lines of code which is a 22.8125% decrease in code. Which is
HUGE. And it is much cleaner and easier to read. I can almost drop **lodash**
from that as a dependency as well and keep all my **lodash** functionality in
**Transmutation**. This session I spent time refactoring and enabled multiple
path extending. I'm going to work on features that will make **Rampant.AI**
cleaner. Probably starting with a side effect function as well as potentially an
`if` function and some logging helper functions. Which I've always wanted. Lots
of fun stuff that can be done. This is just the beginning of **Transmutation**.


## #8

I think it is useable now. I added the ability to send in a function in addition
to a primitive or a promise and if that function returns a primitive or a
promise or a transmutation, it just works. :) I think the next step is to test
it with Rampant.AI. I think I can substitute most of the code with it now...
very cleanly actually. AHHH!!! IT MIGHT BE THE MOMENT!!!


## #7

WOOT!!! I think I fixed it just as I wanted to. I've changed the merge rules
logic to make more sense of it. I put it in this commit message:

```
When extending an existing key the goal is to keep all data as close to
the same as possible... never losing data, but also never changing the
type of data. So if a string is being extended with a number, the
next function that is going to use that property could now break because
it is a different type. However if an array is being extend with a
number, then the next function is already expecting an array so
appending the number to the array should not break it by normal
javascript standards... since we don't enforce a single type in each
array. The reverse is not also true though... extending a number with an
array should return the number since the next function to use it will be
expecting a number.

Based on that set of thoughts. I've changed all of the merging rules and
it looks like it should work with deep extensions as well. Which is a
very good sign.
```

So I think the extend operator is solid right now using path and a promise or
primitive value property, which is awesome. The next thing to probably do is
look into how a use case that matches the Rampant.AI platform looks. If I want
to extend the base object with the result of a promise call, but use part of
that base object (not all of it) for that promise call... how do I do that
easily? Basically I need to be able to cleanly scope the base object to use for
that promise call. I'll have to determine what that API will look like next
session. For now though... I think I'm solid to push the next patch version of
**Transmutation**. YAY!!!


## #6

So I got the promise system to properly work and then what I realized is that
deep defaulting doesn't work properly since deepDefaults doesn't have the merge
behaviour that I'm looking for. For example if both objects have a key of test,
then one has a string and the other has an object, I want the string and object
to be merged as an array below the test key. Which is what my default behaviour
does at a high level, but not at a deep level so I have to figure out the best
way to get that working as expected. This could take me a bit of research.


## #5

I was blanking for a bit trying to add in paths and stuff for the extend
operator and then something just clicked which was SUPER nice. When I did that I
think I made things just work nicely. I have to look into edge cases now like
when I try to set a new key past a non-object value, but I think I covered most
cases with what I just did. I should really check promises next session to
ensure that I cover the main reason that I want this because I want to extend a
result from a promise into a backbone snowball object of data. So I'll try to
make sure that works next session if I get to it.


## #4

Finished up all the strange simple cases and now I'm working on simple object
extensions while keeping immutability. I got basic cases done and now I'm
factoring in paths which will be its own bit of fun. I also realized that it is
possible I'm not handling promises properly so I'll need to ensure that isn't a
problem as well. We shall see. Taking a bit of a brain break and then I'll jump
back into it. This is the most important operator when it is done. The core of
the library really. Of course the conditional extensions and branching and
parallel calls and stuff are important, but this is the bread and butter.


## #3

Finally found a bit of time to get one session in. Working on all the strange
edge cases for the extend operator before actually working on the object portion
that it was made to do. I think I can consolidate all of those if statements,
but perhaps I'm wrong. Anyway, before I check it in I need to go rename all of
the tests so they match the scenario they are doing. But there are 31 total
tests now and next session I'll clean that up and start working on the actual
reason the library exists, doing awesome extend stuff to grow an object without
mutating anything in the object.


## #2

Second round moving forward. Just making sure I catch as many edge cases as I
can with the early stage of the Extend operator. I have to remind myself
regularly the target DSL. So if I extend "5" with an array of "6" and "7", then
I tack that 5 to the beginning of the array. I also refactored out the operators
system so adding new operators will be easy. It is something I did in the
prototype and wanted to port over. I also made it so anyone can easily extend
Transmutation with their own operators. I'll demonstrate that in testing in the
future. I should add that as a todo item after this. So far so good and it is
nice to be in a system where I have testing setup again. And I forgot how fast
and clean it is working with tape. So much nicer and feels much leaner.


## #1

WOOT!!! This is my first session working on **Transmutation** which is awesome!
So a bit of background, I've been using RxJS and Lodash for a while now to do
some stream data processing with fun operators. I've gotten more acquianted to
the sort of functional style (I know it isn't pure functional, but whatever).
What I realized was that there were a lot of patterns that I did that ended up
being extremely verbose and clunky with RxJS. Extending the current object
wasn't as easy as it really should be. Deep accessing properties and objects
were a pain, etc. I used lodash as much as possible to easy the pain, it got
better and I am still very succinct in general for data processing, but I think
it can be better. So I started working on a quick script to play with and
discovered that I can strip away Observables which are a very heavy project and
instead work around Promises exclusively and natively. Why? Mainly cuz I work
with one asynchronous event at a time. The thing is Promises aren't powerful
like streams are. So I started looking into creating a simple API. And it worked
beautifully. So now I'm working on formalizing those little experiments into an
actual tested module.

There will be a lot of powerful things that will be able to be done with this
package. The fact that it treats values and promises as one in the same, will
handle parallelization easily, extending easily, etc. is great. But there is
more. I'm building off of a theory that I had that goes something like this:

```
You can't be self empowered to complete a task unless you have everything you
need to complete that task up front. Otherwise you are "coupled" and dependent
on something else and introduce context switching, waiting, and other
complications. If you have everything to begin with before you do things, then
you have full control over what you are doing.
```

This philosophy basically equates to the fact that you shouldn't be doing side
effects that change the world around you until you have every piece of data you
need. In addition to that, in tandem to that property I wanted to make sure that
every step at the end has access to every piece of data every prior step had
access to. This builds in a concept of immutability as you build up this data.
There should be a transition point where you collect data without modifying or
deleting data at all until you have everything you need. THEN and ONLY THEN can
you start committing side effects and trimming/removing data. This concept has
made a lot of work easier for me when working in the API space. So based on
these rules, I can build a library that is built to enforce this concept.
Preventing removal/modification of data already piled up until it is time to
work on side effects. That is what Transmutation is going to do. Not just be
succinct and powerful, but also enforce a powerful concept to make development
and maintenance easier. Following this paradigm future proofs enhancements as
every addition has access to every piece of data before it. A lot of
enhancements break systems because they have to be connected to data that was
collected somewhere else. Well this concept stops that.

Anyways, that is my initial introduction into this library. I'll write something
formal up top in the readme, but I'm looking to go quickly through this so I can
get back to my main project that started all of this. A project where I've been
trying to build an entire platform under 300 lines of code for the MVP. And this
will enable me to do just that while staying understandable. Onwards to a
break!!!
