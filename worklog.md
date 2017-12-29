# Worklog

## #87, #88, #89, #90

Finishing up the last bits of pretty printing the checked packages results. I
ended up adding more details to the results as well and now they are nice and
pretty. Looks great so you can see what packages have what and what packages are
missing what. Side effect to all of this is that I had to update the tests for
both `check-packages` and `find-packages` to use
[**Kape**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kape).
Actually just checked the build and realized that it failed... and I know why
too. Since I hash based on the inputs, the inputs are different on Travis due to
the change in "root". Well that is dumb. I'll have to think on that, because I
would like to be able to keep the results the same while still keeping the hash
of inputs. Hmmm... I'll think on that. For now I'll just disable the tests on
Travis. Gonna go get coffee for now.


## #85, #86

Did several bits of cleaning up. Refactored out the commands into their own
packages. Started cleaning up the styling system in general and then started
working on creating a pretty style for `check-packages`. Coming along alright.
:) Time for Python work now... 10 hours of it... AHHHH!!!


## #82, #83, #84

So this morning was a TON of dog fooding. I started to really use
[**Kape**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kape)
for the first time with the `executor` portion of
[**KLI**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kli).
And it was very informatitive. It let me know that I definitely need a `when()`
operator for
[**Kape**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kape)
as well as a `then()` operator. I also need to really try to put some focus on
setting up multiple `describes` in a single test file properly so I can test
various configurations of a SUT. But the cool thing is that my build test suite
is now running both
[**Kape**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kape)
and [**Tape**](https://github.com/substack/tape) tests... hehehe... that's
funny. This set of sessions was VERY helpful indeed. Lots to refactor and do in
general, but I think I'm at a solid point where I can just pick and choose.


## #79, #80, #81

I DID IT!!!! I got a prompting system that updates and adds new snapshots
properly. Took a bunch of work with `readline`, but I actually pulled it off
today. Makes me super happy so theoretically I have a useable testing system
now. It only handles snapshots and no assertions, but it is a HUGE start. Super
pumped for having started my own testing framework. Super excited about this...
seriously. LOTS of refactoring that needs to be done. But good stuff overall and
it works the way I want it to. I still need a multi-test runner and an assertion
system, but should be good.


## #75, #76, #77, #78

So I'm in this vicious exploration cycle right now just exploring. The part I'm
on is setting up a prompting system to update snapshots. I was originally using
[**Inquirer**](https://www.npmjs.com/package/inquirer), but now I'm going
straight down to `readline` instead. So it is taking some exploration of ways to
handle things in order to nail something down. But I'm getting closer at least.
Perhaps in the next few sessions I'll get something going.


## #71, #72, #73, #74

LOTS of work done for `kape`. I got screenshot comparing working and loading of
previous screenshots. I changed the identification of screenshots to a hash of
the inputs. I also started working on the
[**Inquirer**](https://www.npmjs.com/package/inquirer) portion of it where we
update the given screenshots. That should be the last major part before it is
useable. SUPER exciting!!! So hopefully I'll have something finished tomorrow!!!


## #70

I did several refactors for readability, and now I've also got some pretty
printing in place. I need to figure out next how to determine a passing test vs
a failing test. Shouldn't be too bad now that I'm looking at things. I'm excited
for how things are progressing. I think with all these promises and
[**Transmutation**](https://github.com/RayBenefield/transmutation) I'll also be
able to do this more efficiently since I'll have an async stream of work going
at the same time in parallel, which is awesome. I hope things just keep sailing
forward. :) Time for Python. :( Merry Christmas folks!!! See you tomorrow.


## #69

Alright so I am now saving snapshot files... which is awesome. Next is to load
them and verify the snapshot vs the resulting snapshot. But I also need to print
the results of the tests... so yeah. Perhaps I start by thinking about how to
report results and then how to change those results with failures. I have one
more session to go before I have to do my paying job... on Christmas... yeah it
is painful.


## #67, #68

I've switch the framework to use
[**Transmutation**](https://github.com/RayBenefield/transmutation) internally
because I'm going to need to be able to handle simultaneous asynchronous writing
of snapshot files... especially since by default EVERY test will have
screenshots. I'm excited, next is to write the screenshots. That shouldn't be
too bad. The next part though is to load the previous screenshots if they exist
and then compare them to the one we are testing for.


## #65, #66

Holy shit... I've really started getting this testing framework into place. It
really isn't taking long. Since my simplest defaults are just create a snapshot
and then fail on snapshot, then I'm having no problems at all as I don't need to
worry about assertions really. I just need to run a function and the save/check
the snapshot. I'm a decent way through, I'm already dogfooding the framework. It
has a `run` function that actually generates the test results and then the
default export will just run that `run` function, and right now it spits out
some `console.log` lines to verify the output that I'm just running with
[**Nodemon**](https://github.com/remy/nodemon) to iterate quickly. I just
started generating a snapshot file based on the format that
[**Jest**](https://facebook.github.io/jest/) uses. Now I need to start saving
that file and then loading it and asserting against it. Probably like 4 sessions
until I get all that done. I want to be conservative since I'm essentially
writing my own testing framework here. It is exciting... seriously.


## #64

So I fell asleep after last session thinking about how to really get what I
want. I've gone far into the rabbit hole that is
[**Tape**](https://github.com/substack/tape). I've decided... I want a new
testing framework as well. Something that works with everything I need. I
know... ANOTHER project. But it is all part of
[**KI/KD**](https://github.com/RayBenefield/kikd). All part of this ideal
Developer Experience that I'm trying to shoot for. I'll try to start
implementing it next session and see how things go.


## #63

Last session, yesterday, I was going to jump into more work and got distracted
instead. What ended up happening instead was that I decided to learn how to make
a chrome extension and that was fun. I created one that could compare the github
contributions between two users and set the badge value to the difference (green
for above, and red for below). I call it `Github VS` for now... lol. But
anyways, this morning I started yet again and decided to look into snapshots for
my tests since I would like to have snapshotting for the executor tests to
verify that style is being applied. The tool that I checked out was
[**Snapshotter**](https://www.npmjs.com/package/snapshotter). Problem was that
`enzyme` was backed into the implementation. So instead I forked it and modified
it to just take in an object and played around to make it work. I've got
something working, but I'm going to finish it up next session. Need a break and
to think on things. I kind of want to make my own snapshotter implementation for
`tape`. But I'll think on it.


## #62

Did a bunch of cleaning up of the repository. Updated a test that wasn't
switched over to `@kikd/tape`, cleaned up the `.gitattributes` (even though they
don't look like they are working), and added [**NPM Scripts
Info**](https://www.npmjs.com/package/npm-scripts-info) to the run scripts to
make each of them more clear. Lots of little things. I think I want to take some
time to work on the `kd new` command that creates a new package because I feel
like I could really gain some good value from it. So that might be what I do
next... if not then I'll do the template for the `kd check` command. I probably
won't have much time this morning, but let's see what I can get done.


## #61

Put out another release. This one sets up the formatter system for the
`executor`. It uses [**Render Kid**](https://www.npmjs.com/package/renderkid) to
handle the formatting. I tried to add tests, but realized that the output was
not so simple. So I need to start looking into snapshot testing with
[**Tape**](https://github.com/substack/tape). So that is probably next on my
list to play with. I currently have two skipped tests until I have that in
place. We shall see how that works in the future. Time for work.


## #60

So I put out a couple of releases in one session (25 mins) which is awesome as
I'm getting faster with this setup. I've refactored out my custom
[**Tape**](https://github.com/substack/tape) setup. I prefer [**Tape
BDD**](https://www.npmjs.com/package/tape-bdd) and I needed promise
functionality so I also like [**Blue
Tape**](https://www.npmjs.com/package/blue-tape). And since I'm using [**Blue
Tape**](https://www.npmjs.com/package/blue-tape) I also need [**Loud
Rejection**](https://www.npmjs.com/package/loud-rejection) setup. So I
refactored all that into `@kikd/tape`. I also implemented the custom renderer
per command which was SUPER easy and updated `kd check` to use the
`JSONRenderer` for now and also removed the renderer from `kd build`. One more
session before work.


## #58, #59

Refactored out the `executor` functionality now as `kli` is going to get a tad
more complicated when I start adding more to the rendering system. So I want to
make sure that it is easy to do and refactored out with tests. There are more
tests that really should be in there, but now is a good start. Just keep pushing
faster and faster as we go forward. I still need to refactor other portions of
[**KI/KD**](https://github.com/RayBenefield/kikd), but I'll survive. For now I
need to stop as we are going to pick up my future stepson for him to spend
winter break with us. My development speed is going to slow over these holidays,
since I'll be spending time with him and off the computer over the holidays.
Still lots to do, but things are really coming together slowly. One day I'll
probably split off the `kli` project into its own repo, but for now I'll keep it
here. It might actually be valuable for me to have an automated process to split
a monorepo into multiple monorepos so that will be my test case. AWAY!!!!


## #56, #57

Refactored out the searcher functionality and coincidentally added a new feature
to be able to use a string or an array for `aliases` which is awesome. It is
nice being able to easily created a new package using the
[**Alle**](https://github.com/boennemann/alle) repo structure. And once
[**KI/KD**](https://github.com/RayBenefield/kikd) is setup then I'll be able to
really start publishing new packages really quickly and keep all my functions
small and awesome. I think ultimately I have a very powerful system. More
refactoring?


## #53, #54, #55

Instead of moving forward with the checker command I spent time refactoring the
tests into a unit test structure instead. Which took a bit long because I also
had to update the tools to ignore the test folders properly. Also in order for
this to work properly I had to improve the ignore system for `find-packages` so
I updated to using [**Minimatch**](https://www.npmjs.com/package/minimatch),
which made the system MUCH stronger as a whole. So then I updated the CLI to
exclude the fixtures folder now which is good to have for sure.... OH HEY!!! IT
IS SNOWING!!! :) Time for some more real work. Back to Python :(. AWAY!!!
Tomorrow I will tackle the checker... probably after I update the rendering
system a bit more for
[**KLI**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kli).


## #52

Last night I was playing with [**Node Tap**](http://www.node-tap.org/) and I got
it working. Overnight I made the decision not to use [**Node
Tap**](http://www.node-tap.org/). Ultimately it was MUCH slower, without
parallel processing it was a 7 sec test run vs a <1 sec test run with
[**Tape**](https://github.com/substack/tape). Even with parallel processing it
only brought it down to 2 secs at the lowest. It also felt more clunky and wrong
since to get BDD terminology I had to include mocha globals which felt wrong...
and using `should` resulted in weird feelings too. So I decided... just no. This
session however I started out adding a rendering system to
[**KLI**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kli).
I think it will ultimately be worth it. I'm going to use that rendering system
for the `kd check` command soon. Just gotta add a feature or two here. I might
adjust the tests as well. We'll see next session.


## #50, #51

Looking into switching to `node-tap`... I figured out how to do it and it
natively supports promises and coverage and a few other things so hopefully
things will work out well. I had some difficulties with `should` at first, but
it all worked out. I may have to look into extending `should` with some new
operators or something so it reads better.


## #49

So I got through adding `bin` checks. I haven't gotten to the project level
checks, but I did add the `kd check` command and closed out that issue to merge
in and test with just JSON output. I've added several issues to work on the
pretty printing and the other features that `kd check` will need to be valuable
so we can work towards replacing the `prebuild` hook using `kd build`. I just
had an idea to add a rendering system to `kli` as well because that JSON output
is valuable for other things.


## #48

Back into the work for the checking of packages. I've added checking for a
readme now and packages are not publishable without a readme now. Next will be
to add checking for `bin` files. And then once I'm checking for `bin` files I
can add the checking to a part of doing builds and also as its own command. But
I also need to check the root directory for a `LICENSE` file that can be taken
as well. So I'll look into that as well. I don't want to publish something
without its `LICENSE`, but a `LICENSE` is not a project level file, but a repo
level file.


## #47

I started the morning with an idea on how to push configuration for
[**KLI**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kli)
and ended up just writing a full document on the idea in general. Basically the
idea is to push dependency injection into the CLI level that also encrouages
configuration at the library level. This configuration not only includes values,
but also the actual functions themself. Looking at something like
[**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)
shows how valuable it is to be able to override functions in a library in
addition to values. And more and more tools are accepting the form of
`<library>.config.js` because requiring it will include behavior configuration,
not just value configutation which is SUPER powerful in software engineering.
Time to get back to work on the checker system though.


## #46

I realized the `fixtures` folder for tests was getting out of hand, so I had to
introduce some new organization to it. So now it is sorted by fixtures that
represent an entire repo and fixtures that represent a single module. So I guess
I'll tackle the other functionality I wanted tomorrow. Time for some real work.


## #45

I started working on actual publishable modules now. I now accept a main file
that is defined or not (must have an `index.js` if it is not defined). I
actually need to go through and fail tests that don't have a `LICENSE` or a
`readme` now. So next is to fail on those and then after that I can start
accepting `bin` files so I can pass `kikd` since it is just a `cli` tool right
now.


## #44

Started the preliminary checks for the `kd check` command. Things are going ok
for now, nothing too much to report. I think in a session or two I should have
something working cleanly functionality wise.


## #43

So when I started working on the `kd check` script I was SUPER distracted. So
yesterday morning I realized that I was duplicating work that I had already done
in `find-packages` so I decided to add in `JS inspect` in order to catch
duplicate code. I should be sure to not dupicate anything I'm doing and while
that is obvious sometimes it is easy to miss when you are trying to get a task
done. So now that that is in place I can get to the real checker script.


## #42

I spent a little bit setting up Prettier on Vim finally. It is really nice to
have on save. I quickly setup `KLI` to handle aliases in addition to names.
Wasn't hard at all. So I started work on the `check-packages` function, which
will be needed to verify whether or not each package has the minimum
characteristics to publish.  This check will start by looking for a `readme`, a
`package.json`, and either a `bin` entry with respective file, a `main` entry
with respective file, or an `index.js` file. With all of this I should be able
to publish a package. Then I'll adjust the build process to not publish any
packages that don't pass that check.

On a side note, I'm also preparing to propose to **Jess**. Today is her birthday
and I've setup heart post it notes arranged in the shape of hearts across the
walls going down the stairs and into the hallway towards my office. It is a long
letter to her. I have a camera setup to know when she is on the stairs and my
computer and her phone (which I have) is watching and I will sneak into the
bathroom when I see her (with her phone in my hand so I can watch). When she
gets to the last batch of post its in the hall in front of the bathroom, the
last one that is folded will tell her to turn around for me to propose. :) SUPER
EXCITED!!! I hope everything works out as planned. I'm trying to both get work
done and watch the camera at the same time... not an easy task mind you. She
will only be expecting that the hearts are related to her birthday, the proposal
will definitely catch her unexpectedly.


## #41

So I got `KLI` working!!! So now I can run `kd l` or `kd ls` to run the `ls`
command or I can run `kd b`, `kd bu`, `kd bui`, etc. to run the build command
and as I add more commands things should go fine. :) Totally pumped about that.
But now I have to start getting into actual multi-project issues. Next is to
finish the build command by copying the `readme` and the `license` file to the
`dist` folder. That is the next step and then merging the base repo
`package.json` and merging with the project `package.json`. Should be fun.


## #40

Started work on `KLI`. Just writing a bunch of simple tests to get it going and
then I'm going to try to replace the commands in
[**KI/KD**](https://github.com/RayBenefield/kikd). I'm hoping things go
smoothly, but we shall see.


## #39

So I planned out a document for `KLI` and now I'm going to jump in and just try
to start building it and see how things go. I planned around in a sandbox long
enough that it should work fine. We shall see.


## #38

So I refactored the CLI to use
[**Transmutation**](https://github.com/RayBenefield/transmutation) now and it
cleaned up the main API very well and I was able to get rid of the second
`findProjectRoot` call which is nice. And it also made it really easy to add in
the base config to use to determine external dependencies. Which is super nice.
I need to still add tests for that, but I've got the functionality there at
least which is nice. I also need to handle the `node` built-ins better somehow.
For some reason [**Rollup**](https://rollupjs .org/) is still warning based on
them and I am not sure why. I'll file an issue on that after making an example
repo with the problem. Break time.


## #37

So yesterday I was going to finish up the build system and then I got food
poisoning and was out for the rest of the night. This morning I'm exhausted but
I was able to finish up the build command and I'm super happy about that. I also
was doing research last night while dying on how to make the CLI experience
better and discovered a new package that I need to build that I will build as
part of the [**KI/KD**](https://github.com/RayBenefield/kikd) actually. It
should make the CLI much easier to use as it will be smart enough to determine
what command you are trying to run. Should be a fun little thing.


## #36

So I quickly tweaked the build command to work adhoc with a bunch of hardcoded
things and I got it to work properly!!! I'm super pumped, but now I need to go
through and properly support details. Like I needed to handle ignoring paths
from the `find-packages` script. So I added that. I need to keep going through
and tweaking things until I get something that really works. I think by default
I need to ignore the `__tests__` folder. Since this is
[**KI/KD**](https://github.com/RayBenefield/kikd) then I'm fine with being
opinionated period. More work to be done!!! But I should totally have the build
command working tonight!


## #35

I feel like I'm SUPER close to having this work. I'm going to have to tie in the
root of the packages in order to properly run
[**Rollup**](https://rollupjs.org/) in the right destination folder. Hopefully
the next session I'll have it working just right. I'm SUPER excited to have this
work cuz this is the first real work that
[**KI/KD**](https://github.com/RayBenefield/kikd) will actually do. So I'm
fairly pumped about that. I REALLY hope this works. I hate that I have to work
right now... cuz I'm like right there at the finish line. Oh well... time for
**Python**.


## #33, #34

Started work on the build package system. Got in the first couple tests and some
filtering here and there. I think what I'm going to have this system do is build
the configs that are needed for [**Rollup**](https://rollupjs.org/) since it is
a side effect and I want to test to make sure the configs come back properly
then use that to run through [**Rollup**](https://rollupjs.org/). Should work
hopefully lol. We shall see.


## #32

I fixed up the build and also added the portion that finds the project root
based on the `.git` folder. So I spent some time figuring out what are the next
steps and really the next step is to start building the modules without doing
any publishing or versioning quite yet. I'd like to replace the build step with
[**KI/KD**](https://github.com/RayBenefield/kikd) itself to start eating dog
fooding. This will lead me to rely on it in the future. And right now the only
deployable is the `cli.js` so I'm going to write up a build system that only
handles a `bin` entry in the `package.json`. So it shouldn't be too bad.
Hopefully... it is time to get very familiar with
[**Rollup**](https://rollupjs.org/).


## #31

Spent a bit of scattered time exploring how to setup rollup for a CLI script.
Had to figure out some details around making the output executable and adding a
shebang for the output, but I got it all figured out. Then I merged it and
master isn't building because I tried to use `Object.values` in like Node 6 or
something. So I'll fix that in the morning. But rollup should be working now
just fine and I can move forward. I still don't find the project root properly
so I'm going to do that next, but I've got a solid start at least.


## #28, #29, #30

Got a simple `kd ls` command working with pretty printing. Now I realize that I
have to build the package completely differently than what I was building which
really sucks, but I'll figure it out. Since I have a CLI tool, it is quite
different than
[**Transmutation**](https://github.com/RayBenefield/transmutation). So I'm going
to have to put this off until later sadly. I think I'm close though at least. I
got things sort of working.


## #25, #26, #27

Went through and did a bunch of random things to make
[**Prettier**](https://prettier.io/) and [**ES Lint**](https://eslint.org/) work
neatly together with hooks and vim and stuff. But it is finally done and merged
in. I'm feeling the strain of early morning (been working since like 3am. Gonna
take my morning nap before I start work now. Until tomorrow when I tackle the
CLI script.


## #24

So the [**Prettier**](https://prettier.io/) setup was WAY easier than I
expected. I currently have it applied with the desired settings and have it
working with [**ES Lint**](https://eslint.org/). Now I have to adjust my build
pipeline to handle it properly including commit hooks and travis. And I have to
apply it to Vim. The combination shouldn't take longer than one session, but
I'll probably end up doing two for some reason. lol... 


## #23

Cleaned up the last of the `find-packages` functionality. Added the `dir` to the
final output to be used in future scripts. Next is to use that package to create
the `kd ls` command. I should have enough info on it now and I just need to work
out the CLI details like pretty printing/formatting etc. Should be neatly done.
I think first I want to setup `prettier` so I can stop playing with code
formatting. Gotta set it up plus eslint plus Vim so that might take a few
sessions.


## #22

Added another test to ensure that we grab deeply nested projects in the
`src/node_modules` folder. So now I'm working on figuring out the best way to
present a clean interface for the command line tool and will just start doing
some fancy looking things. Just to have some fun. Perhaps I can have this
cleaned up quickly.


## #19, #20, #21

Alright so I finally found something that works... it was painful. I kept
running into problems because `tape` does not know how to handle promises and
errors that happen in them. So I tried installing `ava`, but it could handle
transpiling the `node_modules` folder properly as source files and I couldn't
figure out how to get it to work. So then I tried `jest` and nothing at all,
like it wouldn't even try to find my tests in the `node_modules` folder even if
I tried to set it up properly and change the ignore paths. Absolutely painful.
So then I went to try `blue-tape` to handle promises, but it wouldn't properly
batch things in groups like I like for bdd and hence the output was really
gross. So I figured out that you can change the `tape` instance in `tape-bdd` by
passing a third parameter... once I passed in `blue-tape` it just worked
magically. I'm SOOO happy I figured things out properly finally. So now promise
testing is easily a thing and I added the globbing system to find all packages
that are at least defined with a name field. I need to start explicitly pulling
out fields that I care about now and what not, but this is a solid start. I'm
just happy that I fixed my testing framework.

Something I'm heavily noticing throughout the ecosystem is that the
[**Alle**](https://github.com/boennemann/alle) pattern is very powerful, however
the tools in the ecosystem go crazy when you have `node_modules` in your path
and there is a LOT of frustration that can be had depending on the tool you want
to use. I'm lucky that I found a solution for `tape` as that is the most minimum
of testing frameworks and I prefer it with the `tape-bdd` nomenclature. So
forward I shall move!!!


## #16, #17, #18

Got stuck on mocking out the filesystem properly and now I'm stuck on testing
promises in Tape. Just a bunch of frustrating-ness that I'll come back to
tomorrow. I need a break for now. ARGH!!!


## #15

I'm actually in the weeds finally and have mocking of the filesystem working and
will just keep pushing through. Going to hunt down all of the projects that are
indeed in the proper directory structure. Just filling out a bunch of tests
right now and going through the TDD process. Probably one or two more sessions
left in me for the day before **Monster Hunter World Beta**!!!!


## #13, #14

Finally started doing the setup for some real coding. I converted
[**KI/KD**](https://github.com/RayBenefield/kikd) into a monorepo of the style
that it will investigate. Since working on
[**KI/KD**](https://github.com/RayBenefield/kikd) I have discovered
[**Alle**](https://github.com/boennemann/alle) which is a very powerful
structuring for a monorepo setup. It requires some unique adjustments for build
tools and what not that default to ignoring `node_modules`, but for the most
part it is very powerful and awesome. I've also finally setup a test script and
the basics that I need for rapid development like a watch script as well. This
is definitely a solid start. My first task is to implement `kd ls` which will
list all of the projects in the repository based on the
[**Alle**](https://github.com/boennemann/alle) structure.


## #12

Fixed the `shebang` issue that was happening that kept me from running the cli
tool properly. Wasn't a difficult fix, just a **Babel** plugin that I found that
will also translate the `shebang` appropriately. I also fleshed out the `kd ls`
command which I think should be the first command as it is the simplest of them
all and will work towards gathering all of the project info that I'm going to
need anyway in future commands.


## #11

Dived deeper into each of the commands that the CLI will implement. It looks
like the first one that will be good will be the `kd ls` command as it will need
the initial system to determine what projects exist in the repo. So I think the
next thing to do is start working on the CLI tool. I might look into `meow` for
the simple CLI layer. We'll see how that goes.


## #10

Setup initial planning document for CLI tool as we progress forward. Figuring
out all the details that will be needed for the tool. Even going as far as
considering how easy it is to type the commands. **KI/KD** seeks to speed up the
development agility of Open Source maintainers.


## #9

Finished up the rough roadmapping section. I'm ready to start actually writing
some code. But not today. Spending the rest of the weekend with Jess <3. I've
also added travis notifications to the Slack channel I setup on Dev XP and that
will be nice. For now I think I'm good to go.


## #8

Went through a lot of the bullet points that needed to be fleshed out. I only
have about 4 more bullet points to really jump on and then I can start looking
at what kind of code I will be setting up for this. Something inspired by test
runner output or eslint or commitlint or something. Pretty colors and stuffz.
For now though I will take a break before closing out the rough roadmapping
issue.


## #7

I added a scope for commit linting for the roadmap in general. I think it is
important to have for this project as there will always be new standards coming
up that can be added to the system to ease everything. I spent some time playing
with the rebasing only to realize that the rewrite tags script won't be aware
when new commits are added or commits are removed... they assume the same
rev-list length so things get a bit messed up. So I added a bug to investigate
later. But I added several sections to the roadmap including auto publishing to
NPM, bootstrapping a new project, and managing a monorepo.


## #6

Went through the `rewrite-tags` script and found out the problem. It was trying
to rewrite tags based on the `master` branch rather than the branch that we are
currently on. So I refactored the script to handle that appropriately and it
seems to be working fine. At the same time I noticed another issue when rebasing
off master on a feature branch, but I'll look into that later as the end result
was still what I wanted. I can now get back to roadmapping properly.


## #5

Added more details on a badge to represent certification. I want to make sure
there is a minimal standard to meet at all times that can constantly grow, so
certifications could fall out of date and not meet new standards so the badge
will represent this with the latest version checked. In addition I think there
will be some very opinionated standards like enforcing worklogs for sessions for
transparency sake. I would like to have people meet that certification if they
so choose to promote more transparency. I also added details on the Github
special documents that Github will do special things for if you incorporate
them. While doing all this I discovered a bug that the `rewrite-tags` script
doesn't work properly in some circumstances, so I need to take some time to
learn what it is doing exactly.


## #4

Started mapping out all of my initial ideas for how to achieve a **KI/KD**
certification. Got through some initial changelog details and really got into
details around a new **Semantic Versioning** proposal. Mainly since projects on
**NPM** are still at major version 0 and being used in production. Announcements
should happen at `0.1.0` instead of `1.0.0`. And then Major version represents
the number of breaking changes you have introduced. And Minor represents the
number of feature releases you have had that people will care about and need to
be publicized.


## #3

Setup the initial readme document with some details on how the project came into
inception. The next thing I'll do is start rough drafting out some of the checks
and tools that I'll need to consider and incorporate across the board. Should be
fun.


## #1, #2

WOOT!!! Getting into a new side project is always exciting... sort of. I'm
stuck in this side project rabbit hole that I'm hoping I can pull out of. It is
stressful and sad, but if anything I'm gaining a lot of experience doing it so I
just gotta keep trudging forward and getting faster and better.

So what is this about? Well **KIKD** stands for **Kontinuous
Integration/Kontinuous Deployment**, get it?!? lol... but seriously, I was
working a lot with **Transmutation** preparing it for a quality developer
experience for contributing and ultimately realized that I want to standardize
my ideals into a standard that I keep across all my projects. So that is what
**KIKD** will do. It will check whether or not the project it is run on is
certified with the heavily opinionated standards that are inspired by the open
source community. I'm by no means an expert, but I like having my own standards
to follow and automate. So this project will provide tools as well as a checking
system to make sure there is some sort of compliance. I'll flesh this out in the
next few sessions in the readme with all my goals.
