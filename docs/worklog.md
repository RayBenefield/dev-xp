# Worklog

## #344, #345

Well I got a rollup plugin working officially. I also extract the front matter
and create a proper readme file. It looks like it will work alright. We shall
see. Next is to test it with
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
as a plugin based on the original literate programming plugin that I wrote last
week. ONWARDS!!!


## #342, #343

Started working on figuring out how to setup a
[**Rollup**](https://rollupjs.org/) plugin to extract the config as well as the
code. And so far so good, I made a very short like 15 line function that
extracted the code bits, now I need to adjust it to extract the configuration
bits. Shouldn't be too hard. Probably need to import a yaml parser as well. I
should be able to add just a couple more lines to gather it all. Looking forward
to it. I'll probably make it another reduce function since I don't want to
overcomplicate the single one that extracts the code. I'll tackle that tomorrow.


## #338, #339, #340, #341

Forgot to log this this morning. I spent most of the morning working on getting
the
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
package fully published. It took a bit to write out the entire readme and make
sure it was published properly and had to make a few tweaks here and there, but
things worked out. I did discover that I need support for adding additional
files to a build, for example I needed an image that was referenced in the
readme, but it didn't get built with it because I don't support that yet. Next
thing to focus on is to get a
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
plugin going properly so I can start converting modules over to a single file
package setup.


## #333, #334, #335, #336, #337

Phew!!! So I did a lot of work to try to get `entyre` working this morning...
what I'm calling the Single File Package `babel-node` equivalent. Hopefully it
works out alright. It seems to work with
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
alright. We shall see how things progress along. I had a lot of problems with
`babel-register` for reals, but I got it figured out enough right now. It was
painful and hurt my brain, but it is done. I'll work on the plugin tomorrow for
building things properly. I'm kind of curious to see how the
[**Rollup**](https://rollupjs.org/) plugin system works as I want to be able to
split one file into three essentially so we shall see how that works in the long
run. Time for real work right now though.


## #331, #332

Spent this morning exploring how to combine `lit-node` with
[**Babel**](https://babeljs.io/). I discovered `pirates`, which is awesome, but
I haven't quite figured out the best way to interweave the two compiler systems
yet. Still lots to figure out sadly. Bleh... time for real work.


## #330

Started planning out what it is going to take to build Single File Packages. I'm
going to definitely need a [**Babel**](https://babeljs.io/) plugin and I may
actually need a [**Rollup**](https://rollupjs.org/) plugin as well. I have a lot
to learn, but if I can pull this off I'll definitely cut out a lot of painful
work in terms of publishing and what not. Should be fun... I should reserve
`babel-plugin-literate` and `rollup-plugin-literate`. Quick break before I get
more into building a babel plugin.


## #329

Alright so I'm finally back to coding after getting back from
[**Vue.js**](https://vuejs.org/) conf. Which was an awesome experience btw.
While there I realized a portentially awesome thing. A concept I'm dubbing
"Single File Packages" similar to Single File Components, but for monorepos. I
wrote about it here: https://twitter.com/RayBenefield/status/980489677407956993

Now to figure out how to get all this to work.


## #328

Took a much deeper look into the [**Vue.js**](https://vuejs.org/) repository and
trying to get a sense of where to start. I started a notes document on what
would be nice, what is nice, and things to do to get started. There is a lot of
things that could be great to improve the contributor experience and that might
be a good place for me to start to bring in fresh eyes as a new contributor from
the ground up wanting to understand core and dive deeply into the internals. So
a roadmap for new devs would be a very nice thing to have to help guide them
through the dev tools, the practices, and sort of a day-to-day workflow sort of
perspective.


## #327

I've decided to start taking a journey to being a contributor to the open source
community... like a more dedicated approach. Not just here and there. The
[**Vue.js**](https://vuejs.org/) core team really inspired me yesterday at the
panel and I'm stoked. So I'm going to start diving into the
[**Vue.js**](https://vuejs.org/) repo for maybe two sessions a day to get
familiar with the landscape. It will expose me to a lot more of the frontend
environment so I can get a feel for the landscape. Things like flow, selenium,
other testing frameworks like jasmine with karma, etc. are not something I'm
super familiar with so I'm going to get familiar with it over time. My first
jump in session was straight up going through the contributing guide which was
super slick and super simple. `yarn` then `yarn dev` and try `yarn test`, no
problems initially getting into the code base. Now I need to start explore core
and how the base [**Vue.js**](https://vuejs.org/) instance is created and how
the global API really works.


## #326

I'm at VueConf.us!!! It's the first [**Vue.js**](https://vuejs.org/) conference
and I'm having a blast. While watching I had a massive realization, I wonder if
I could get literate programming working in the monorepo. Because of my plugin
system, it was really easy to write a new plugin to get it working properly. I
had to play around with my [**Prettier**](https://prettier.io/) and [**ES
Lint**](https://eslint.org/) setup for Vim, but I think I'm satisfied with the
result. I'll polish it another day. So with literate programming, I should be
able to accurately document all of my small package functions. I might have some
more details to figure out editor wise, but I'm pumped for this. So soon I can
make an `index.md` to do literate programming and the code will be extracted to
`index.js` and rolled up with [**Rollup**](https://rollupjs.org/) and the
`index.md` file is copied to the `readme.md` file. :)


## #324, #325

And I finished the last portion of the build part of the
[**Vue.js**](https://vuejs.org/) plugin. Next is to figure out the best way to
do publishing straight to [**Firebase**](https://firebase.google.com/) hosting.
It shouldn't be too bad... I hope. lol... and I still have to merge the code as
well.


## #321, #322, #323

Got the first batch of the [**Vue.js**](https://vuejs.org/) plugin setup. All
that's left is to work on the plugin portion of the side effect side as the
`index.html` from the package must be copied into the `dist` package folder. I
added `files` as a feature for package details now so I could use the filter
better to check for an `app.js` and an `index.html`. Looking good so far. I
should be able to have a full build system later today or tomorrow some time.
Then I need to work on the publishing portion and perhaps I can auto deploy to
[**Firebase**](https://firebase.google.com/) hosting. Should be awesome.


## #319, #320

Continued the refactor of the build plugin system. Slow progress, this last
session I setup CTRL-P for vim so I can travel around faster now that I have
lots of packages and then I refactored the current setup into something that
resembles a plugin system and I'll start to figure out how best to extract it
and configure the system to work properly either today or tomorrow. I have to
think on this.


## #315, #316, #317, #318

So I started the work to change the build system into a plugin system that will
allow me to build a [**Vue.js**](https://vuejs.org/) based plugin and in the
future serverless plugins for various providers. I spent time a lot on
refactoring how the configs are built today and changed all commands to be a
function first so they can be configured with plugins when necessary. Lots of
adjusting and cleaning up, but I'm close to being able to extract the config
creation into the plugin system. I imagine I'll need a plugin to support config
building, actual building, and post building. Shouldn't be too bad as the
current cli and package support only differ in config building as they both use
[**Rollup**](https://rollupjs.org/) for actual building and the deployment to
[**NPM**](https://www.npmjs.com/) is the same as well. Off to paid work.


## #312, #313, #314

I FUCKING DID IT!!! WOOT!!! So all three sessions I kept fighting and fighting
to get a working output for a Vue site. At first it was a pain to even get it to
build, I needed to first setup a separate directory to try to see how it should
work and then kept playing around with rollup configs. Eventually I hit a point
where I couldn't get the javascript to load on the page, then realized a stupid
mistake, then it all worked from one directory and that was refreshing. Next
thing was to try to figure out if I could pull it off in a monorepo, having
[**Vue.js**](https://vuejs.org/) components essentially be their own package.
And that was no easy task at all. But eventually I figured it out. My first
major bump was trying to get both [**Vue.js**](https://vuejs.org/) as a package
from `node_modules` and the `src/node_modules` packages to be all bundled
together, but I figured out you can have multiple module directories... which
isn't documented. :) WOOT!!! I'm sooo happy.


## #311

Spent the first session fixing a test that broke the build yesterday, so now it
is merged and completed. I've started exploring what it will take to get a
[**Vue.js**](https://vuejs.org/) site going. Hopefully I find something that
works. I can only hope.


## #308, #309, #310

WOOT!!! I'm now able to build singular packages as well as multiple named
packages with `kd build`. Also ended up fixing the bug that **Aggro Tactics**
caused and added the passing of configs to commands. :) Soon I'll tackle adding
config files so they can come from there instead. But this is the start to
getting me to be able to experiment with new rollup configs to enable
[**Vue.js**](https://vuejs.org/) setups for the monorepo. Super stoked for what
is coming up. I think I'll be able to build a [**Vue.js**](https://vuejs.org/)
site using a proper [**Rollup**](https://rollupjs.org/) config. We shall see. TO
PAID WORK FOR NOW!!!


## #307

Just about ready to jump back into the build command. Finishing up the final
testing stuff for the package detail refactoring. I just have to update the
tests for `find-packages`.


## #305, #306

Went back to working on setting up
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
to build a single package at a time if need be. I added argument parsing support
to
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
so that I can run the build function with a `{ packages }` argument properly. So
far so good. I just need to refactor out the package details portion of
`find-packages` since I need to be able to get package details without finding
packages in root. I'm just about done, just want to add some testing to that
part then I can proceed with the build command supporting a packages parameter.
Tomorrow I will try more.


## #304

Wrapped up my initial planning for **Aggro Tactics**. I think my next step is to
make a paper version that sort of works to get a feel for how things will play
out. I'm really curious and excited. I'll get back to more coding to prepare for
the [**Vue.js**](https://vuejs.org/) setup tomorrow probably. For now I'm going
to go play some [**Monster Hunter World**](http://www.monsterhunterworld.com/).


## #303

Session 2 of planning out **Aggro Tactics**. As I envision the gameplay it just
gets me more and more excited to have something to play. :) I can't wait. I may
not be able to work on it more at this moment due to a meetup, but I'm excited
for the progress of the design.


## #302

Got sucked into real life again. I recently have been CRAVING getting back into
the [**Magic: The Gathering**](http://www.magicthegathering.com/) scene again,
but without spending money. So last night I started watching footage from the
QuarterFinals of the latest Pro Tour, **Rivals of Ixalan**. And boy was it good.
But I saw cases of randomization screwing results... and reminded me that I have
a game design that I keep wanting to come back to and effectively pull off. This
morning in the shower, I think I figured out the mechanics necessary to make my
game work. I've been designing and redesigning over the past decade. I've even
built 3 iterations of the game in digital form and one form was tested in paper
form. So I'm coming back to **Aggro Tactics** to try to re-create it again.
Since this is a company monorepo, I want to feature it here with design docs and
everything, and eventually build a site where it can be played and an API where
it can be extended upon. I really want to see this come to light one day, so I'm
going to improve this repo to ensure that I can build websites with it and APIs
as I've always planned... but now sooner rather than later. So this session I
started work on writing out the initial readme of the goals, inspiration, etc.
This is going to be fun folks.


## #301

So I wasn't able to code yesterday because of real life, but I'm looking more
into things. Today I really wanted to do something visual that I can show off
and really hate that my current setup does not allow me to throw together a
quick website to share. So I started looking into what it will take to get
[**Rollup**](https://rollupjs.org/) and [**Vue.js**](https://vuejs.org/) working
together neatly for this [**Alle**](https://github.com/boennemann/alle) setup.
But in order to start working on that and experimenting with a new rollup
config, I need to only build one specific package. So I need to do some
refactoring to enable building a single package. Exploring looks like I need to
refactor the gathering of packages to extract that package information portion
and then use that to call `buildRollupConfigs` system. And I also need the work
I did a couple days ago to enable passing command line arguments for
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).
So lots of little details. I'm taking a quick break right now and I'll probably
create an issue for this real quick.

## #300

Woot!!! Work session 300... huge strides made in the past few months of just
starting this. I've gotten a decent ways through the rewrite analysis, which
should form the basis for the rewrite tags system. I figured out how I want to
pass arguments to commands through
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
so I'll probably check that in soon as I needed an argument from the command
line since the `post-rewrite` `git` hook actually passes whether or not the
rewrite is an `amend` or a `rebase`. The plan is to now gather as much
information about the differences as possible. The analysis of an amend is
slightly different from the analysis of a rebase. Because an amend only has a
single commit to worry about, I can actually dive deeper into the differences.
But with a rebase, I'm analyzing the massive rev-list so ideally we only look at
the summary and the commit hash. I need to think about how this will evolve
before moving forward. Done for the day and I'll be starting my paid work after
my break. Perhaps tomorrow I'll figure out enough to merge something.


## #299

Yay I feel like I'm back to coding. So I'm working on the `rewrite-tags`
command. Decided to make it a part of the upcoming Jig project that I've been
planning on working on. Since it is strictly a `git` enhancement. I'm starting
by grabbing the old and new rev-lists and then doing a comparison between them.
Starting out fairly solid. Already got a command going in
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
for it. It's like riding a bicycle... lol. Luckily I made it easy. Gonna take a
quick break though.


## #298

Slowly getting back into things and one of the first things I really want to get
into is removing that damn `rewrite-tags` script that I have for something that
is smarter with node. I'm sick of all the warnings after rebasing and the system
should be smarter than it currently is. I think I should be able to after
learning everything I need to know about how the current script works. It looks
like literally just a get list of refs and then offset by the same number of
commits, but I think I can do one further and discover which commits were tied
to which other commits using the message of the commits and fine orphans from
either list to detect new or deleted commits in the granted rebase. I can also
probably use `git reflog` to determine how much comparison actually needs to be
done which is also nice. So I'll look more into it next time. I'm off to a
dentist appointment. I just had my wisdom teeth removed and started working on
my health for my high blood pressure so that explains my absence from coding for
a while. But I think it is time to rebalance my life to fit in both coding,
health, game time, and family all at once. Should be fun.


## #296, #297

Wow... it's been weeks since I've been able to focus on some sort of coding at
all. Well I just wanted to take some time to try to setup something with Vue in
the monorepo. Right now it doesn't seem like
[**Parcel.js**](https://parceljs.org/) will work neatly in the
[**Alle**](https://github.com/boennemann/alle) style monorepo, which sucks. I
don't really want to debug it right now, so I just started exploring at the root
level for now. I found a Codepen using [**Vue.js**](https://vuejs.org/) and
Interact.js: https://codepen.io/Flamov/pen/NwpzZO. It creates a swipeable tinder
card setup. I wanted to do something like this for the Halo Forge community for
map feedback so I explored it. I copy and pasted the code to get it working. It
wasn't much, but it works. I'll explore it more later. Was fun at least.


## #295

Spent more time planning. A lot of this session was really around the pseudo
code and how it will all be structured in the end. I'm trying to plan enough so
I can refactor the current system into the new algorithm around boxes. Hopefully
things work out well. This is a good time to let things simmer in my brain for
the next day or so until I feel comfortable approaching a refactor. Probably
done for the day as I have to make up some paid work today. But this was a good
set of sessions that will help me push through the rest of [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
I'm satisfied now.


## #294

Started planning out the algorithm for how [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
will handle its own box system. I'm designing two different kinds of stylers.
One that handles layout and returns boxes and whether or not the last one is
open or closed. And the reducer just combines all of the boxes into a line
within the context type. A box can have its own context level as well and its
own array of boxes. Brain just broke... example layout stylers are display,
width, word-wrap, overflow, padding, margin, etc. The next type of styler is a
render styler which does not change the visual positioning of any content. It is
intended to add coloring/underlining, and other styling in general or replace
characters in place. The renderer will determine the full content of the box
(including blank spaces and new lines) and then pass to each of the stylers to
replace as needed to render the final content enhanced. Examples of render
stylers are fonts, borders, masks, and probably padding in a second pass I
think. Should be fun. Quick break and then another round of planning.


## #293

Been a crazy weekend of watching the first LAN in the Halo World Championships.
But I finally found some time to do some work. I spent this session just
researching how CSS works and understanding the rules behind it so I can create
those rules in the terminal better with an algorithm that works well. I learned
about the box model and how block and inline contexts work and I think that may
be enough for me to understand. My brain hurts a bit, but that's fine. lol... I
need to let this simmer for a bit before I try to formalize it. So a quick break
and then some more design.


## #292

Responding to a frontend pro/con conversation in the Eugene Tech Slack.


## #289, #290, #291

WOOT!!! I did it!!! Finally got `display: block` working as I think it should
work... obviously this is going to get more complicated once I start adding in
nested styling and stuff... but this is a solid start. Seriously. Had to tweak
some things and change how the styler works, it now returns a node instead of
just the node's value. The parser also needed to convert nothing but whitespace
into an empty string. The core of renderking needed to drop any final node value
that had no value worth a damn. And it also had to start passing the previous
node into the styler. All of this enabled everything and will also enable future
things. I'll also be able to start doing some more complex styling rules since I
have access to the previous node now. So I'm pumped and happy about the current
state. Nesting is going to get tough, but I will survive. TDD has made a HUGE
difference in how this is getting written and it shouldn't be too bad at all
moving forward. I'll probably need to do some readability refactoring at some
point, but for the most part I'm happy with the results. Also found a bug, but
it should be an easy fix. This first daunting part is now over and I'm
satisfied. :) Good to be back to coding.


## #288

After DAYS... I've finally gotten back into work and so far I'm satisfied. I
started work on the `display: block` functionality. But I got past the simple
part and the simple use cases are now snapshotted. Next is trying to figure out
how to handle previous node information. Because I don't want to add a new line
at the beginning if one already exists in the previous value. Not quite sure
exactly where to go from here. Perhaps I pass in a previous node and just go off
the final value it has and check the last character and if it is a newline, then
just don't add a newline... I guess that is the simplest approach. This TDD
stuff REALLY helps. Like seriously... smallest implementation. And best thing is
that with snapshots when I snapshot the simplest implementations, I know that
they should never break when implementing the new feature. So nice... gonna take
a break for a bit while I mull over potential fallout to the approach I
described above.


## #287

I've pretty much been slacking behind on doing work. I've taken essentially a
"weekend" to gather myself back into a working mood. And I've recently reached
high rank in [**Monster Hunter World**](http://www.monsterhunterworld.com/) so
that's to blame as well... lol. Sooo much fun. Anyways, this session I was just
creating issues inspired by how [**Lerna**](https://lernajs.io/) does a lot of
their integration testing. There are a lot of great ideas that
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
can learn from, so I created several inspired tickets for them and investigated
even more. Lots of [**Jest**](https://facebook.github.io/jest/) trickery as well
as fixture management which is really nice actually. I'm thinking I will
actually do some `display: block` work this morning for [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
We shall see how I feel after doing my morning stairs. lol... I may need some
more [**Monster Hunter World**](http://www.monsterhunterworld.com/) time. ;)


## #285, #286

Simple morning session. I jumped in preparing to work on `display: block` which
is kind of daunting to me... something about number of potential scenarios is
exploding in my head. Luckily I'm not handling nested scenarios right now with
open and closed tags. So I started out just exploring how multi-lines would end
up working across the board and made a few adjustments that I think will work
well. I now collapse all whitespace into a single space everywhere, and then
when parsing the entire string, the very first node is left trimmed. It seems to
have given me the results I'm looking for. Part of me is not really in a coding
mood this morning. So I might actually just ditch out and go play some
[**Monster Hunter World**](http://www.monsterhunterworld.com/). Yeah, I think
I'll do that. Maybe I'll do some more work later. But I'm just not in it right
now. I need a brain break... I need a weekend lol.


## #280, #281, #282, #283, #284

Wow... what a big session. I needed to fix the CI tests for the font system for
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
so I started exploring all the things that I needed to figure out. Then dove
into not saving snapshots when skipping a test in
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape).
This would allow me to skip a test if `process.env.CI` was true. Then I could
use that in the [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
tests. So I went through that, got it working. Ended up removing the input hash
from the snapshot keys... now it looks like
[**Jest**](https://facebook.github.io/jest/) again. But whatevs. When I got
skipping properly working I decided to fix up the aggregate results so I know
how many are skipped and everything is now neatly done. Aggregates are printed
in a nice fashion and only print if they need to (so failed doesn't print or
create a new line unless there are failed tests). It just all works now. And I
was able to properly skip things for [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
:) Now I can finally continue and I just so happened to do some nice
improvements to
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
while I was at it... monorepos are SOOO powerful cuz I just get to keep going as
fast as possible and everything just magically works together and can be tested
together easily. And all of that just got published immediately. I'm sooo happy
about this.


## #279

WOOT!!! So last night, just unaccounted for I browsed and played with
[**ReasonML**](https://reasonml.github.io/) through a
[**Babel**](https://babeljs.io/) plugin and it just didn't work. I wanted to see
if I could just get it magically working, but nothing at all. Made me realize
that [**Babel**](https://babeljs.io/) understanding is really the weakest
portion of my knowledge right now. So I think I'm going to have to dive into
[**Babel**](https://babeljs.io/) eventually myself to get a better feel of its
internals, because [**Babel**](https://babeljs.io/) config loading is a pain and
a half and always the part that I have problems with. So I studied a bunch on it
this morning, mainly just its AST and differences between the ESAST. And then
this morning I wanted to take one more go at
[**ReasonML**](https://reasonml.github.io/) and it worked! So that
[**ReasonML**](https://reasonml.github.io/) exploration started with a tweet
that referenced [**add-reason**](https://github.com/nickzuber/add-reason) a new
project someone was working on. So I gave it a try. Setup a
[**ReasonML**](https://reasonml.github.io/) directory, setup
[**bs-platform**](https://www.npmjs.com/package/bs-platform) the system that
handles compiling for OCaml and [**ReasonML**](https://reasonml.github.io/).
Then with [**add-reason**](https://github.com/nickzuber/add-reason) setting up
the config files and the symlink, I setup a `test-reason` package in my monorepo
setup, it worked with `babel-node` as hoping after compiling with `bsb
-make-world`. And then I `kd prerelease`d it and `kd build`'d it and then tested
against the `dist` version and it worked wonderful as well. So if I do the
[**Rollup**](https://rollupjs.org/) it picks up the compiled source as expected.
So I potentially have a route to bring
[**ReasonML**](https://reasonml.github.io/) into my setup. Which is close enough
to how I normally program in node that I won't mind the additional workload to
learn as it isn't far off. I'm pumped to include it. And my health is stronger
than it has been in years... I'm ready world!!! Time to get back to
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
as now I have to fix some testing things for [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
Yesterday when I said all was fine, it broke in
[**Travis**](https://travis-ci.org/) and I cried... lol. So now I have to figure
out a solid way to skip those tests in [**Travis**](https://travis-ci.org/) and
I also probably want to work on the system that just straight up fails in CI
instead of updating snapshots. Which means I should also report proper
aggregations instead of shortcutting... lol.


## #277, #278

WOOT!!! The styling system is no functionally based. I've set a style precedence
order so each style gets sent in that order, and then setup the stylers as
functions that accept their setting and then create a function that accepts the
node and then they modify that node and it gets reduced over to generate a final
node which we send back the value of. Super stoked about that and it should be
easy to refactor into supporting the margin properties which will need
information on previous nodes. So hopefully it won't be too bad. This also means
I can probably extract all of the styler rules into their own packages so we can
support plugins. :) That is pretty awesome. I'm gonna make a ticket for that.
With all that it was really easy for me to make both the `display: none` system
as well as the `font` rules. Was REALLY easy. So two tickets knocked out
today... very happy about that functionality.


## #276

Spent this session focusing on what kind of work needs to be done for
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
there is still a lot of tedious stuff that needs to be done, but the ultimate
goal is to be able to replace [**Render
Kid**](https://www.npmjs.com/package/renderkid) for nearly identical
functionality at its current usage state. Hopefully things don't last longer
than the weekend and I can get back to things in the core
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
work.


## #275

This morning I had to fuel my curiosity real quick... one of the things that I
realized this morning in the shadow is that I really want to be able to have my
end distributed packages tested. Since I rollup all the dependencies, it should
be really easy for me. Should take just an install in the project directory,
then run tests that are in the same `node_modules` structure to ensure that it
works fine. I tested with [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
this morning that doesn't use external dependencies and it worked fine when I
copied the tests and snapshots to a directory in the `dist/` folder. I should be
able to come up with something in the future. I just needed to fuel my appetite
for that before moving forward. I think it might be time for me to get back to
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
though. I've still gotta focus on filling out the styling system and eventually
get into properly nested tags. I think I'll start with `display` as a styling
option using `none`, `inline`, and `block`.


## #273, #274

I have now firmly established my footing with a [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
MVP that supports a style where a tag can have a value. That's it... so I can
use it to insert premade text now... lol. Which is useful for adding like a bar,
but that bar also still needs essentially like a `display: block` in order to be
put on a new line automatically. I also created a project to properly track
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
separately from the other projects now so that is good too. Time to start
decking it out in features now. And it will get constantly updated properly
thanks to
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
being so good at tracking version updates. :) Super satisfied with this entire
monorepo process so far. It has gone a LONG way since its initial inception and
idea. I'm stoked!!! And hopefully my fixes in health will open up more time for
me as well moving forward. Time to get prepared for some paid work... which I
will start after doing some stairs. Here we go.


## #272

Was eating breakfast, but still wanted to be productive, so I watched
[**FunFunFunction**](https://www.youtube.com/funfunfunction) instead. The video
was about setting up speech recognition in the browser using the IBM Watson
apis... was pretty awesome. Good learning. Also did it while eating a morning
salad. And drinking water. Gonna kill this damn health thing... yeah I know not
the right word usage, but whatevs!!! Gonna go for a walk then get back to work.
Actually going to go grab some hot chocolate.


## #271

Started out easy this morning with the actual programming stuff. Jumping into
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
I decided to actual use the multi test functionality to split parsing tests into
passing and failing. Made it easier to understand what snapshots were what. I
can't believe I started with comments lol... whatevs. I think I'm actually going
to call the parsing system good for now. I know I'm not handling nested tags
right now, but I think that is actually a good MVP. I can handle nested tags
after the MVP. So I'll finish the last of the tests and then I'm going to start
looking into the actual styling system which will involve reading my new AST.
Should be fun lol...


## #270

HUGE step for me this morning. I made scripts to make my steps towards healthy
living doable. I needed to use some programming to take my health into my hands.
So you can read that in the [**healthlog.md**](./healthlog.md). For now I have
to go do some stairs to pad my numbers. ;) Then I'll get back to [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).


## #269

Added a bunch of testing for each of the grammars for the [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
parser. So far so good. Also labeled each group as pass/fail with comments and
then realized that I could use actual test names. So I'll fix that later. Next
session is probably just more cleaning up. Gotta go for now.


## #268

So I'm in a lobby while Jess is at an appointment so I'm squeezing in some work
time. I started working on [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)'s
parser again and the tests wouldn't run. So I did tons of exploring. This was
probably the same problem I had when the tests wouldn't run like 1/5 of the
time. Well I think I finally found it. The process doesn't get a chance to
finish sending the last message before exitting. So I setup a callback and it
ends properly now. I don't think I'll have any further issues. YAY!!! Time to
get into parser details. :)


## #266, #267

Cleaned up the couple of bugs that I found working on multi-suite functionality
and cleaned up the readability of the code, which is super nice. I just took a
quick look and I'm thinking maybe I should add in some more quality forcing
tools like cyclomatic complexity and max-depth of blocks. Would force me to be
more strict on things and force cleaner code. Well anyway, I'm ready to retackle
[**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
on my next major block. I think I'm going to go work on Serverless/Vue/Dynamo
now though for some paid work. ;) Excited for that! Maybe tonight I'll tackle
more.


## #262, #263, #264, #265

Phew!!! I got multi-suites working just fine. Discovered a few bugs while doing
it, but for the most part things are good. Took me a little bit, but things were
much smoother this time now that I have much better organization and focus in
each of the
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
packages. So I'm satisfied with the work. I think tomorrow morning the first
thing I'll do is tackle the couple of bugs and then jump back into [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
finally since I now have support for multi-suites and I want to start testing
the various parts of the language in [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
Woot progress!!!


## #259, #260, #261

Finally... figured out what I needed to do for saving snapshots over time,
ultimately I think it simplified my code and clarity around what package is
responsible for what now.
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
in general is still probably my messiest setup, but I'll survive. It is my first
time trying to really establish a solid testing framework from scratch. It's
been fun. But now I have incremental snapshots and that was not an easy feature,
but it is a super useful one. :) Next major session will be focused around
multiple describes because I really want to get that damn [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking)
done so I can finally replace [**Render
Kid**](https://www.npmjs.com/package/renderkid) and have a CI style... it's
amazing how much I have done just to get a damn CI formatting system. lol... and
I thought that was going to be easy.


## #257, #258

Decided to start working on the incremental snapshot saving system and then
broke my brain. It wasn't as simple as I thought it would be, but now I'm in the
weeds so might as well push through. I think I have a vague idea on how to pull
this off right now, but we shall see if that works out after breakfast. I need
to calm my brain a bit or Imma break it. lol...


## #256

Did a bit more refactoring, just to make sure I could get my max-warnings down
to 5. Only a bit more to completely clear out that backlog of gross over 50 line
files. :P At least I don't have a triple digit (100+ lines) violation anymore. I
also think I may have spotted how to tackle incremental saving of snapshots
actually which I'm really pumped about, because I'm sick of having to go through
a long list of snapshots every time I decide one is not right. That will be a
useful feature to have. I might also be able to tackle not updating snapshots
for skipped tests before breakfast. We shall see.


## #255

Starting the morning slow with just refactoring out the printing portion of
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
wasn't too bad. Also refactored it a bit into
[**Chalk**](https://www.npmjs.com/package/chalk) templates. Made it a bit
cleaner, but still some work todo... not exactly satisfied with it. But I'll
deal. My goal today is to get multi-describes working so I can get back to work
on [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
Hopefully I'll get that done today.


## #253, #254

Another refactoring session of cleaning up lines of code everywhere and
simplifying things. It actually wasn't too bad at all either. Had to really get
rid of code duplication caught by js[**JS
Inspect**](https://www.npmjs.com/package/jsinspect) which is an awesome tool to
have in place at a high threshold as it really forces you to refactor. Moving it
to just prepush has helped a lot to put its refactoring balance into place later
on. Also happened to start sorting snapshots by index now, wish should make
diffs actually much simpler. I'm hoping to also be able to use the input hash to
know when the particular test has changed inputs. Should be really nice to have.
Ideally in the future I'd like to have a full string of the input in the
snapshot file so they become awesome references for people in the future as they
quickly iterate. It makes the snapshot files much more valuable and informative
during PRs as well when it includes the input as well as the output. Pushes a
lot of the PR focus on the snapshot file rather than the test file. Reading
assertions is painful as hell and seeing input to output mapping is WAY more
valuable. I'm also curious on how I'll tie in assertions in the future. We shall
see. I think I may be closer on figuring out how to handle multiple describes in
a single test file now. So I'll look into that next I think. If I don't decide
to tackle another small
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
feature/fix.


## #251, #252

Holy hell what a double session. Just spent a lot of work splitting refactoring
the snapshot system. Made it much cleaner to read and split it into several
different packages. I think I added 3 new packages in those two sessions to
really simplify what was happening. So now I can focus on future features
better. Gotta go out to a meetup now, but I'm happy with the work so far. Lots
of cleanup. Also reduced the max-warnings from 7 to 6. So only 6 more files to
get below 50 lines of code. :)


## #250

Extracted all of the worker logic into its own package. This required me to pass
a few more things to it since it is now isolated from the rest of
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
but it is giving me insight into where things need to be centralized and cleaned
up. I think the next portion to clean up is to manage the snapshot updating
portion because that is actually probably multiple concerns.


## #249

While enjoying my breakfast I just stared at the
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
code for a while to get a sense of what it will take to enable multiple
describes. I need to do a lot of refactoring and testing first though. There are
a couple of places where I can actually make things cleaner and easier to read
at least. Still sooo much to do for
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape).
It is daunting sometimes, but gotta keep just pushing through. Baby steps.


## #248

Decided just to do a simple refactor for now. Setup the ability to skip a test
now. I don't get the input for serialization though, but since I still get the
index, I know what test needs to be skipped as well so I can use that in the
future for reporting purposes. Also did some slight refacctoring for that in
order to reduce some lines of code and keep it under 50. Which really seems to
be the sweet spot for small modular code. Time to go snag breakfast and I will
probably look into enabling multiple describes in a single test file next since
I'll want that for [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).


## #246, #247

Just spent a bit of time exploring the landscape of the things that need to be
done. One of the things that has been frustrating me has been the rebasing
script as it fills the buffer with craziness of warned failed rewrites, so I'm
probably going to turn that into a package soon, cuz that is painful. I think
what I'm going to do is probably use
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
to adjust tags instead, since the commits are supposed to be semantic we should
be able to go through each commit/tag and repoint them where they should go
after a rebase. Should be easy I think. Also spent a lot of time exploring
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
really and trying to figure out which parts to start improving that will help me
with [**Render
King**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/renderking).
Kind of feeling the tiredness of being up since like 2am... so there's also that
to consider. Bleh... sooo much to do all the time.


## #245

Yesterday I thought a LOT on the entire parser situation and experimented after
work and finally figured things out. So I used that knowledge that I gained in
order to refactor the parser. And now it is super cleaned up and only 15 lines
of code, which is awesome. It still needs to support open and close tags though,
but after that I think I'm in the clear for the parser. I also found a bug with
a particular character order so I need to fix that. I think I do need to do a
a few updates to
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
though as well to improve my testing experience. I came up with a crazy cool
idea to "skip" a test by just prepending the input array with a `!`. Since every
input is required to be an array, nullifying it to `false` means I can filter
those out in the tests. Super easy skip implementation. :) So after the
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
improvements and then the parser, next will be the styling portion because then
I will have an AST to work with. But I might not get to that today. I foresee
pain in my future with this parser as I keep learning
[**Parsimmon**](https://www.npmjs.com/package/parsimmon). It's 4am so who
knows... but I'm kind craving some [**Monster Hunter
World**](http://www.monsterhunterworld.com/).


## #243, #244

So I'm stuck right now... my biggest problem is figuring out the proper way to
perform a lookahead. I want to allow the characters `>`, `<`, `/` as long as
they don't make up a tag in sequence... but I can't figure out exactly how to do
that... backtracking confuses me. Oh well, time to work for now. I really need
to learn this eventually and might as well push through now. Bleh... dumb.


## #240, #241, #242

So I'm diving into [**Parsimmon**](https://www.npmjs.com/package/parsimmon) and
trying to figure out how it works while building a parser for this simple
templating language. Trying to wrap my head around it and I've got it decently
so far... just lots to figure out and learn. It is a fun experience though. I'm
stuck in a problem of looking ahead and avoiding pulling a string that has tags
following it. It hurts my brain, but I'm working through it. Gonna go grab some
quick breakfast and try to get one or two more sessions before work.


## #239

Alright so I'm jumping into building my own parser/rendering system I guess.
Should be fun. I'm calling it `RenderKing` inspired by `RenderKid` lol... should
be fun I haven't written a parser... like ever so exciting I guess. :)


## #238

I couldn't get a CI rendering style working easily so I'm going to quickly build
my own as it is ridiculous frustrating and I've been wanting to replace
`RenderKid` anyway for dependency reduction reasons. So I'm going to do that
now.


## #237

A fairly early morning. Going through with some minor refactors to begin with.
Just trying to clear out the smaller tickets on the chopping block before moving
forward. Lots of quality of life details really like a CI rendering style and
removing warnings from the build process by determining what exports value to
use dynamically. I'll probably tackle some documentation stuff this morning as
well. We shall see.


## #232, #233, #234, #235, #236

Holy hell... 5 sessions straight in a row. I just tackled lots of random
refactorings and cleaning ups. I tackled maybe 5 or so issues. Lots of cleaning
up of
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape).
Improved the default usage to remove the verbosity of tests by using a lot of
implicitness. I also reduced the complexity of the dep tree by removing
`jest-diff` finally as well as `pretty-format`. As a result I'm using `diff` and
`prettyjson` in response so visual diffs for prompting now look like `yaml` and
the saved snapshots also look like `yaml` now as well. Totally awesome and
simplified. Also removed a lot of fluff lines in my snapshot files that really
weren't needed. Just a lot of cleaning up in general. I'm actually extremely
happy with the setup right now. :) Still lots of actual package refactoring to
do, but I think I'm in a better position now to do it.


## #231

Simple first session. I ended up removing `jsome` as a dependency and replaced
it with `prettyjson` instead which has a much cleaner dependency tree and isn't
automatically a side effect. I might actually use that to do snapshots now
instead of `jest-diff` and `pretty-format`. Would definitely make for more
readable snapshots at least... not sure how useful it would be or what
technicalities I'd run into. Hmmm... I'll check it out. I might spend some time
splitting up
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
into a bunch of smaller packages. I need to simplify the entire system. Maybe I
can get rid of a `max-line` warning in a couple of places. Man I need coffee...
I'm up WAY too early.


## #227, #228, #229, #230

Today was going to be rather simple in just refactoring, but I actually dived
deeply into some of the build system. So my initial jump in was about trying to
simply customize the [**Rollup**](https://rollupjs.org/) config so that the
`externals` are actually accurate to what is external for each project. Turns
out I did a lot of that prework with `kd deps`. So I refactored that to
explicitly divide external and local dependencies into different parts so I
could use the external portions easily. Since I already use a dependency
detective to figure out what is external and what not it also had the side
benefit of catching weird imports like `loud-rejection/register`. So as a
result, I also got rid of a lot of build warnings which is awesome. And then I
realized I could use that work to also update the `package.json` for each
package in post build when it is built. So I did that too and now packages will
only have true external dependencies listed. :) Totally awesome and super
pumped.


## #226

I just couldn't get the problem off my mind, so instead of ditching I decided to
push through with my last few ideas. I ended up just changing those tests to
`broke-tests` so they don't get picked up by the glob. Which is sad and dumb.
But at least it works...
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
still randomly breaks it seems and I'm not sure why, but oh well. I'm getting
closer at least. Writing a new test framework is not easy. Not even in the
slightest. Now I go play.


## #223, #224, #225

SOOO CLOSE!!! Finally got the snapshot system working properly for multiple test
files, and went to go create a multi-test file runner and it worked manually and
then when I went to commit my precommit hooks broke because of a lack of being
in a git repository. Sooo something weird is happening with pathing or
something. But I'm sooo close... grrr. I'm gonna take a break before paid work.
Gotta play me some [**Monster Hunter
World**](http://www.monsterhunterworld.com/) to relax a bit... well relax as
much as [**Monster Hunter World**](http://www.monsterhunterworld.com/) allows
lol. SOOO CLOSE!!! So angry... :\


## #220, #221, #222

WOOT!!! I found a pattern that works well and I'm satisfied. Ultimately it is
running around 10 processes and 80 tests across all of them, including loading
up the snapshot file for each in about 2.5 secs which isn't bad at all. I think
it will scale well too. And it runs a single or a multi-file now. I should be
able to easily create a multi-test runner now. Super pumped about it. I just
need to add back in the snapshot updating portion and I should be good to go. :)
Holy hell that was a lot of learning in terms of streams and child processes and
learning how to get everything to coordinate together.


## #219

Spent a session before breakfast to explore how child processes work... then
accidentally infinite loop nested spawned processes and had to find `sudo
killall node` lol... so now that I have that rudimentary experience now I can at
least start to think how I'm going to handle this moving forward... gotta
isolate each process really. So we shall see how things go.


## #218

Gotta take a break for the day. It is [**Monster Hunter
World**](http://www.monsterhunterworld.com/) time. :) Realized that I was
running into problems with a lack of isolation. So I'll have to think how to
handle that. Basically a bunch of the tests change the process `cwd` and as a
result lots of things break all over. So I'll think on it.


## #216, #217

WOOT!! I'm getting sooo close. Learning how to handle multiple streams at a
time. I'm trying to get the system for running multiple test suites working. I
have the proof of concept working without snapshots, so now I need to
re-organize everything to do the snapshots as well asynchronously. Lots to still
do as I'm just learning, but I'm getting closer. The tests that would take
minutes to run now take 1 second... huge difference lol. Super awesome. :)


## #214, #215

This morning I felt bold... probably because [**Monster Hunter
World**](http://www.monsterhunterworld.com/) is absolutely awesome and
empowering. I decided to start work on setting up
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
as a stream which will allow me to easily create the multi-file test runner
system. I'm going to do this before jumping into the
[**Jest**](https://facebook.github.io/jest/) as a platform stuff because I want
to be isolated from the eco first to understand what my actual needs and wants
are and then explore that avenue after words. Learning streams is fun though...
lol. Trying to get a feel for the space as I haven't done it before. But seeing
how fast [**Tape**](https://github.com/substack/tape) is compared to what I have
right now inspires me to pull this off so hopefully things go well. Coordinating
the snapshot stuff and handling promises natively and everything... lots to do.
Also I need to really start refactoring
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
because there is a lot of functionality that can be its own little module.
Hopefully things continue to go smoothly and I don't get super stuck on
anything.


## #211, #212, #213

Spent all my sessions trying to build a full readme. There is a lot to the goals
of this project so I can't expect to fully finish it up right away. But I got a
lot of good details explaining my full goal here. Because I think it is possible
to do amazing things with the amazing things that the world has figured out. I
didn't get as much work as I wanted to this morning, since I stayed up late
playing [**Monster Hunter World**](http://www.monsterhunterworld.com/). OMG!!
The game is so good and if you have the chance to pick it up and you are reading
this then do it. My first jump into the series and it is absolutely amazing.
Gotta get to paid work now. :)


## #208, #209, #210

Spent a ton of time refactoring and cleaning things up. Added a "Prior Art"
section to
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)'s
readme, removed some old debugging output I had when fixing the auto-versioning
stuff, fixed the bug where we tried to publish all publishable packages rather
than just the ones that needed to be published, updated the `kd publish` output
to show which packages were to be published, changed all the links in this
worklog to match the new repo structure, updated the repo's description and
topics, and a few other things... just lots done. I'm really enjoying the
experience of working with all these packages and all of this is just getting
easier and easier as I progress. Ooo I just thought of a new idea... what if
when closing committing a ticket I ask the committer if any issues in progress
are something that you might be closing... this will be good for the
[**Commitizen**](https://github.com/commitizen/) tooling that I'll put in place
for
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom).
Hmmm... we'll see. Lots to do though in general. For now it is time to do some
paid work... also [**Monster Hunter World**](http://www.monsterhunterworld.com/)
comes out tonight at 9pm PST... :) I'm going to be quite distracted once that
comes out and I'm sooo excited for it.


## #206, #207

Spent two sessions moving over 10+ packages that really should be in
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
and not
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
So I did that and I'm just waiting for the pull request to go through.
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
should work with any [**Alle**](https://github.com/boennemann/alle) style setup
theoretically. No idea though... not planning its extensive useability yet,
right now the split off was mainly for shrinking the growing size of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
It was relatively smooth, but I realized that I would definitely like a `kd
move` function to handle the refactoring of anything dependent on it. Now to
figure out what I want to work on next.


## #205

IT FUCKING WORKED!!! Refactoring out a piece of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
into
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
in a single cli tool just worked. Like magically. I used `kd prerelease` and
everything and moved over the `kd changes` command to `semcom changes` and both
packages use the same command. I also moved the command to
`@semcom/command-changes` and everything just worked like magic. I'm super
stoked. Working on these projects is going to be sooo much easier now. Lots of
chores to do for cleaning up
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
but I'm at a good point.


## #203, #204

Went through and finally refactored out the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
`cli.js`. I've moved all of the command configurations into their individual
packages. I've always thought that they belonged there, just wasn't sure exactly
how to organize everything. An additional export just makes sense. This is an
important step for working on
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
because now I can move the
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
related packages into a new project while also using the commands in both
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
and
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom).
Next session I'm going to try to get
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
initialized and published in one session. Wish me luck... cuz this will prove
the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
process. :)


## #202

Spent a session planning out potential new projects for the future since I'm
going to expand quickly. I had a few ideas on what I will eventually need for
the entire repository so had some fun with it. I'm really looking forward to the
speed that I will be able to build new projects now using
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
Ultimately I'm going to blow through these things. So great... so pumped...
can't wait.


## #201

A brand new morning. Excited to get back into coding. I've got a lot of cleaning
up to do throughout the projects, but things feel a LOT more manageable with the
new project organization. I'm super pumped about that. It allowed me to easily
close a lot of duplicate tickets and merge a lot of things together. Also gave
me the chance to realize that there isn't as much massive future projects as I
was intimidated by in the first place. Lots of small fixes that are needed
across the board that should be simple. Seeing 30 issues prioritized on a board
throughout swimlanes is MUCH easier that knowing you have 100 issues remaining.
So I'm excited to get back into things. Yay project management win!!! Time to
take a shower and then I'll tackle creating
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom).


## #199, #200

WOOT!!! 200 sessions is massive. That puts me at approximately 100 hours since
starting this repository. I've already done a TON of work for automation and
plan to do a ton more moving forward. I've moved this project from a goal of
certifying projects for quality to instead focusing on managing an entire
company monorepo in open source. This includes automation and developer
experience as first class citizens. Anything that I have to do multiple times
NEEDS to be automated. I want to exlore what it takes for a single individual to
handle **Google** scale codebases. I know I won't get near that at all by
myself, but forcing myself into a scenario where I bite off more than I can chew
will force me to get better and better at automation naturally. I have still one
or two other projects (like **DEX** and **GitJigs**) that will be added to this
repo and it will grow quickly.  Once any of the projects gain traction, the
others naturally will through proximity. So I'm looking forward to the kind of
stuff that will be needed to make this succeed. There is lots to learn and it
will only bring positive experiences to force me to accelerate in awesome ways.
:)


## #198

Plowing through issues. I think I have two more sessions left before I need to
start work. I decided to create
[**SemCom**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/semcom)
as a project so I'll jump into that stuff tomorrow. As long as I finish the
re-organization stuff today. Looking forward to it. Back to sorting.


## #197

Fell asleep yesterday and I'm just combing through issues today and
re-organizing them. I think I'm settled on this repo becoming a company repo
rather than a project repo. I think having
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
target a company repo rather than a project repo makes more sense and allows me
to distinguish a bit better from [**Lerna**](https://lernajs.io/) as many people
are very comfortable with [**Lerna**](https://lernajs.io/) and some of the
things they choose to do may not sit well with lots of intermingling projects
for a single company that rely on much different needs. I also think I'm ready
to move [**Transmutation**](https://github.com/RayBenefield/transmutation) into
this repo as well as start planning out SemCom.


## #196

Just more cleaning up of issues. This is probably going to take a while to go
through every one. But luckily there is a lot that I can close. And also crazy
pipedreams I've decided to label as `resurrect?` to go back to in the future
without keeping the issue open.


## #195

Just started exploring the world of [**Github**](https://github.com/) projects.
Played with creating multiple projects, then moving an issue between different
stages and adding to a project and what not. All seems reasonable. At least this
will give me a bit of organization. My goal is to figure out how to organize an
entire company repo. I expect I'll eventually have some automation around labels
and what not because the organization/management of projects seems not fully
featured on the issues page. We shall see though. Going to start organizing all
of the issues and then curating. This entire morning will be full blown planning
across the board.


## #194

Decided to start exploring [**Github**](https://github.com/) projects. Seems
pretty cool. I'm considering converting this entire repository into my company
repository for `Dev XP`. I already have three projects and I think I would
totally bring in
[**Transmutation**](https://github.com/RayBenefield/transmutation). And I'm
going to split off `SemCom` and also start working on `GitJig`. Should be fun
actually.


## #193

Finally figured it out... I broke things before I left for dinner. Finally got
back and took another session to actually fix it. I kept missing a bunch of
small things. But it is working again now... I'm exhausted though. Good news is
I reduced the number of dependencies (and dependencies of dependencies) by
half... an entire half. From nearly 500 to around 250... and there are still a
few more packages I could target. I can almost for sure get under 150 at least.
There is no way I'm getting rid of some of them like
[**Rollup**](https://rollupjs.org/) and [**Babel**](https://babeljs.io/). But
there are still some randoms that I can replace. Anyways, I'm tired and done for
the night. Hopefully I'll get some solid time before the unconferrence tomorrow.


## #192

Went through and tried to remove both `cpx` and `npm-utils` with both
`copyFiles` from node v8 and a manual adding of the `NPM_TOKEN` to the `.npmrc`
file... hopefully it works. I just put in the pull request now and hoping all
tests pass and then will try to merge and hope things go well. About to go out
to dinner, but I should also be able to get more work done after going to dinner
with the kid. Hopefully things go well. :)


## #191

Finally added a list of files to the `change-gatherer`. I think I'm going to
split that up into a `commit-gatherer` and a `change-gatherer`. Really I need
the commit change files for commit linting, not really for change parsing. I
also fixed that bug I found in
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
that I had where having one command bailed out early and had it miss out on cool
features like `--json`. Just a bunch of tiny clean ups. I'm hoping I'll be able
to start working on a full `git log` analysis soon. Cuz I really want to rebase
into something prettier with all of the proper tags and everything. Then I can
work on the changelog system as well as potentially the `rewrite-tags` script in
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
Lots of possibilities... just cleaning up.


## #189, #190

I'm on the bus to Eugene. Spent some random time refactoring some stuff with
rollup to clean things up a tad. Still have more rollup stuff to handle. But the
build should work again. I still need to figure out how to handle folder imports
like `loud-rejection/register` and `simple-git/promise`. And I need to default
to `exports: 'named'`, but otherwise I'm very close to having a clean build
step. I also want to try to clean up the external dependencies to only what is
actually needed for each package so they are actually accurate.


## #185, #186, #187, #188

So instead of going with [**Inquirer**](https://www.npmjs.com/package/inquirer)
I just said screw it and went directly with its dependency [**External
Editor**](https://www.npmjs.com/package/external-editor) instead. Took me a bit
to get it right, but it works now. And I setup the command for `kd prerelease`
and the template, and also did the side effects of needing a `package.json` and
a `readme.md` file. Should be good to go now. I also published
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
with the system. Which is AWESOME!!! Super easy to do, then noticed a dumb bug
where
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
try to publish even though it wasn't versioned. So I'll patch the bug tomorrow
maybe. But it works... the MVP of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
just works and I'm SUPER happy about that. :) Can't wait to polish the hell out
of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd),
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli),
and
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
for more general consumption.

Oh yeah and I'm also going to Eugene this weekend to take care of the kid (today
actually). There is an "unconference" happening called BarCamp... should be fun
also. I'm going to try to do a couple talks. We'll see how that goes. Time for
paid work and then the bus ride to Eugene. I'll probably get to do some work on
the bus ride.


## #184

Got a bit further, I created a "fixable" filter to grab all failing checks that
I can fix by doing something... like prompting for a `readme` :). So I started
to try to tie in [**Inquirer**](https://www.npmjs.com/package/inquirer)'s
`editor` prompt to fill in the contents. And then all the sudden there was
sadness and lameness and it was erroring out. So ***sigh***... I hope something
gets fixed before I tackle this tomorrow. It looks like someone else ran into
the issue as well: https://github.com/SBoudrias/Inquirer.js/issues/637. I don't
have time to investigate... time to go do paid work on
[**Vue.js**](https://vuejs.org/) and [**Serverless**](https://serverless.com/)
:)!!!


## #181, #182, #183

Took some time getting familiar with how to setup an autocomplete prompt with
[**Inquirer**](https://www.npmjs.com/package/inquirer). Took a lot of
exploration. But ultimately I actually came up with an abstracted prompt for
selecting any package by name and returning the whole package details which is
awesome. So I am using it to allow someone to pick an unpublished package and
then I'm going to grab the failing checks of the unpublished packages and help
the person fill out the rest. Right now, it is just a missing `readme.md` that
will be prompted for. And then there should be a side effect that adds a
`version` to a `package.json` and then commits any collected filled in checks
(like creating the `readme.md`). Should be fun. I think I have time for one more
session for the morning.


## #180

Last night I was caught by surprise... @marionebl had written a comment to one
of my issues on
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
It caught me by surprise because I haven't announced this tool pretty much
anywhere except to a few friends and on **Facebook**. lol... but he came in with
a great suggestion on dynamically filling in the scopes for
[**Commitlint**](http://marionebl.github.io/commitlint/#/) in the config file.
Something I had considered previously as I was tired of editting the config file
every time I started a new package. Ultimately though I decided against it
especially after the experiences I've already run into with needing multiple
changes in a single commit message and what not. I hope he doesn't take it
personally. :) Just trying to get a handle on things on my own while I try to
stabilize a single project in open source. Time to jump into some coding. I
think today I'm tackling `kd prerelease` so I can make it easy to publish new
packages quickly. I plan on targeting
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
for my next publishing. So hopefully that goes well this morning.


## #176, #177, #178, #179

Spent a ton of time trying to figure out the best way to handle a release tag
and ultimately realized that I can't grab the latest PR merged easily from
[**Travis**](https://travis-ci.org/) so I decided to give up on that and just
have release tags be a `#12` number instead of including the PR. I'll survive,
but it looks like it is working now. The next thing I think I'd like to start
doing is analyzing the `git log` and then doing a full rebase after I determine
all of the changes that will be needed to start the repo from scratch. Should be
fun. Time for some paid work though.


## #175

Spent some time cleaning up the issues and clarifying somethings and
re-evaluating. I'm still just stoked that I got everything working right now. I
need to setup a milestone now that completes the multiple package publishing
portion which will require a couple of changes first. Gotta go get some paid
work done now.


## #171, #172, #173, #174

***I FUCKING DID IT!!!!!***
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
is now officially publishing multiple packages. :) SOOO HAPPY!!! This session I
pushed to finish the building of non-bin based packages (like
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)).
Little did I realize, because of the rest of the work that I've been doing with
`kd version`, `kd publish`, and `kd checks`, etc... as soon as I finished that
portion, it just cascaded down into working. :) YAY SOLID SOFTWARE
ENGINEERING!!! FUCK ALL THE PEOPLE WHO SAID I WAS A PURIST AND SHIT I SAY IS
UNREALISTIC!!! WOOT!!!! I'm actually tearing up, because this entire process was
silky smooth. Everything accidentally fell into place and super quickly because
of proper dependency injection, the concept I dubbed "data snowballing" that
[**Transmutation**](https://github.com/RayBenefield/transmutation) is setup to
handle, destructuring, functional purity, etc. This was a HUGE validation for
me... this absolutely blew my mind. I was thinking that I wouldn't be finished
with multi-publishin until at least Thursday because I thought I had more to do.
But it just worked... like wow. I'm crazy emotional right now... I really needed
this to work. I've had a lot of roller coaster rides of egos keeping me down
over the past couple years. But this is my self validation. This shows me that I
should have some confidence in myself. Keep learning, keep pushing, just keep
going and don't give up.

Just to be sure I imported
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
into a new project to test that it worked. At first it didn't, but then realized
it was because I have a bug when there is only one command (I bail out early and
because I do it doesn't have any `--json` features). When I added a second one
it just worked. :) I'm super stoked... now of course there are still a few
details that are needed. Like release tags still need to be created to properly
determine what packages need to be updated. But I did the pre-work for that, so
it is just really a matter of updating the `kd version` command. Also I'm
getting a better feel for how I should be setting up commit messages to speed
myself up. So there is several bits of automation that I can put into place to
validate commits and assist in writing commits. So much that I can still do to
get faster... I'm super surprised how fast things are going right now. I'm
getting faster and faster every day and I'm not even close to optimized with
this process yet.
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
will save SOOO much time in building quality projects. I can't wait to start
using it with [**Transmutation**](https://github.com/RayBenefield/transmutation)
properly.  Going to take some time to make a bunch of tickets after heading out
to get some breakfast and coffee. Gotta start planning out my next few days to
polish the publishing/versioning system.


## #167, #168, #169, #170

Spent a lot of time just doing random tasks. Cleaned up the root directory
again. Removed a bunch of stuff I depended on for my vim setup. So now they are
removed, also made prettier settings explicit in the `eslint.config.js` file. I
also just realized that I can just require it since it is a `js` file. Hmmm...
anyway, I'll add a small ticket for that. Also setup a gpg key to sign commits
and then realized that rebasing onto master is unverified. lol... also added
[**Snyk**](https://snyk.io/) for vulnerability checking. Removed several [**ES
Lint**](https://eslint.org/) warnings for `console.log`s in side effects. Played
with moving the `LICENSE` file around again as well. Updated the `package.json`
to the latest Node LTS version `8.9.4` and removed `.nvmrc` since they plan on
loading from the `package.json`. And created a few tickets for cleaning up like
removing `npm-utils` as a dependency. Just a bunch of random. I needed a slow
day as I woke up not feeling so well. I should be able to get back to things
tomorrow though. Gotta get multi-publishing working by the end of the week
hopefully. Going to first try to publish
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
and then publish
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape).


## #163, #164, #165, #166

Put in a ton of work to get versioning working at least for packages in
"development" before version `0.1.0`. I'm satisfied with what is happening right
now. I think the next thing I need to do is add the "release" tags to the
version system. Once that is added then the system should be smart enough to
avoid pushing a version if nothing that
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
depends on is updated. This is relevant for new packages that are being built as
units before being integrated.  As well for documents that don't show up in the
`readme` for the package. Lots more things to consider, but this really was the
big piece for me. The rest is a lot of clean up and supporting systems. And then
I'll probably work on the `kd prerelease` portion to test adding a new package
on `kli`. Which also means I need to update the build system to handle more than
just `bin` files now as well... still lots of little things to do. But maybe I
can get the multi-publishing working by the end of the week before I see my son
this coming weekend. :)


## #162

And the big stuff is happening now. I'm currently adjusting and refactoring the
`recommend-version` system to start doing the heavy logic. I've made sure
`changes` will make it into the algorithm as well as all `packages` and I still
need to work in `dependencies` actually. I've added comments to the file also to
correlate each portion with the versioning algorithm. Gonna go walk to the
convenient store and fetch some gum... need some minty fresh breath. lol... yeah
I'm weird.


## #161

Built a new feature for
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
that allows me to specify a `--json` flag and what fields I want to display to
pretty print json instead. Should be super helpful in general, but will be used
as I work on the `recommend-version` system. I still need to populate commits
with the files that are changed in that commit. But I may not actually need that
right now since I can probably just use the change list as long as the scopes
are right.


## #160

Setup a template for the `kd changes` command. I kept it simple for now and I
can edit it later. I think I'm going to put some focus on setting up a `--json`
flag so I can work with some of the raw data that is going to come out of the
`kd version` command. Gotta get prepared for the big guns.


## #159

Finished up the last needed portions of the `kd changes` command. Went fairly
well. Now I need to replace the JSON output with a template. I'm going to have a
pseudo working changelog thingy... super nice. The `latest-release-tag` portion
really wasn't bad at all. Went super smoothly. Really loving how fast it is to
build new commands, new tests, templates for commands, etc. Lots of wonderful
setup in the project that really lets me get faster and faster. And I'm still
missing a lot of automation like auto generating a `tests` file, not having a
test runner for `kape`, and lots of little details that could make me go a lot
faster... but I'm good for now. Gotta really get to this multi-package
publishing system. Once that is done, then I can really start diving down, cuz
that is the real *Minimum Viable Product* [**MVP**] here. Gonna go have some
breakfast now. :)


## #157, #158

I'm getting SOOO close to the core of the versioning system. Right now I'm
gather tags and parsing them for the repo. Then I'm going to use the latest
***Changes*** tag in the form of `#<changeNumber>(PR-<prNumber>)` as the tag
that needs to be used as a marker. Hopefully it works well enough for the
situation. I've set a temporary tag in the repo at the branching off point from
`master` so we'll see if things go well.


## #156

Added final details on the versioning system. I think I have thought through
enough of the system to really start working on the algorithm now. The last
piece to work on outside of the actual version system is to add the changed
files to the fetched commits and then add the files and affected scopes to be
used in the versioning system.


## #154, #155

Just finished breakfast and jumped right into the documentation for how
versioning will work. It is a tad complicated, but it is getting done. I also
spent some time figuring out a cool idea that would really help
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)'s
goal of improving development agility. For now it is time to go on errand runs
for the day with Jess. :)


## #153

So I spent some time figuring out exactly how changes need to work for this
system. Like independent versioining is not a super simple thing. My initial
thoughts are that I'm going to `git tag` EVERY PR merge as an auto-incrementing
number prefixed with a hashtag `#`, why? Because any tag starting with `#` is
ordered at the top of the tag list when you do a search. The
[**Github**](https://github.com/) tags are sorted in reverse. So `#` will go
before everything and any package you actually care about will be searchable
with its package name. And even if a package is scope with `@` tags are not just
prefix searched, which means you should be able to find things easily. But
opening the initial drop down will show the tag tied to the latest PR merge.
Perhaps it will be something like `#1 (PR #123)` that might be a thing. I have
to test if it is a viable tag. If it is, then SWEET!!! If not then I'll figure
out some other scheme. Going to try to start a document on how auto versioning
will work in this system.


## #152

Wow that was super easy to create a `kd deps` command. I had to put in a bug fix
to tack on `src/node_modules` for the `dependency-list` portion, but it worked
fine after that. Started with the `jsonRenderer` on
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
which worked super nicely since I could just pass in a `scope` of what to
`isolate`. Then I was able to add a template right after that and that was super
quick too. What a great little experience adding a new command. Very happy with
that. I fixed a bug, created the
[**Transmutation**](https://github.com/RayBenefield/transmutation) for the deps
command, then rendered it with
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
in json, and then created the template... all in a 25 minute session. I'm
satisfied. :) Next to collect the files that change with given commits for the
commit gatherer... actually I should create a command for that. Hmmm... time to
look into passing flags to commands? Probably that time soon. I'll think on
what's next over the break.

OH SIDE NEWS!!! I'm sole architect/lead dev with my client for the current
project I'm on. But now we are no longer doing Django/Python... I will now be
working in Serverless/Vue.js... I'M SOOO STOKED!!! Finally being paid to do
something I really want to do. Looking forward to really learning Vue and
applying serverless on a production level system. Bout time!!! WOOT!!! Paid work
is now going to be less sad. :)


## #150, #151

Spent some time on an Issue Template for [**Github**](https://github.com/). I
made sure to include an important note about **[pro bono]** work. Basically if
you are not a contributor or a donator, then your issues will be labeled as
**[pro bono]** and closed after 2 weeks of inactivity with an **[unfinished]**
label. Why? Because the work that open source devs do for the community is
amazing and of their own choice and time. It is pretty much **[pro bono]** work
if it is for someone who does not have skin in the game. While these issues are
still important, the collaborators need to prioritize other work for development
agility sake. It will be better for the community as a whole if they do this.
Time to work on the `kd deps` command. ;)


## #149

I spent this session just doing a bunch of random refactoring... in particular
reducing the number of files at the root of the project to have the logo show up
higher which is better from a DX perspective as it will allow the logo to grab
attention without scrolling. Still more files to move, but it was helpful to get
through a lot of these.


## #147, #148

Spent the first sessions of the morning on taking a list of packages and a root
and then calculating the dependency list using the `dependency-detective` I made
yesterday. And it was a fun little play of reducing a bunch of stuff, but came
out well. Now I have a unique list of dependencies to use for stuff. Next to
enhance the package info with those deps and then to work on adding the files
changed from commits to that info.


## #143, #144, #145, #146

I did a very, very happy thing. I removed the need for a `package.json` for a
new package now. All you need now is an `index.js`. This is HUGE... makes it
sooo much easier to abstract out functionality into its own package. Because of
the [**Alle**](https://github.com/boennemann/alle) repo structure we can assume
the package name will be exactly what the directory structure is and we can
infer it. This means less setup work and I may not even need a `kd new`
command... but I still might want one since I'll probably want tests to be
automatically setup as well as the `index.js`. I'm very happy with the results
of what was just changed. Also happened to refactor out the `post-build` portion
of the `build-packages` piece. Which was super easy without needing a
`package.json`. So I removed every `package.json` and the `name` field from
the `kikd` cli package portion. Super happy about the results. Seriously, really
reduced the amount of stuff in the repo. And to think I was going to jump into
createing a dependency list first... lol. That will be left to tomorrow. I have
a lot of issues piling up as I keep coming up with new ideas and things that
need to be done. Hopefully I can speed through a good portion of the list this
weekend.


## #139, #140, #141, #142

Spent the morning writing a dependency tree calculator for this style of repo.
It currently accepts a single package to detect its dependencies and crawls
anything local to it. I'm probably going to need to flatten those dependencies
into an array for each package so that I can do an `includes` to determine
whether or not a package depended on a change made. I also still have to include
the files that are being changed in each commit as well so I can determine what
actually changed. Lots to still do to get versioning working properly, but every
day is another step.


## #137, #138

So I modified the `commit-parser` to handle adding the commit hash to the
change. And then using that I streamed the `git log` results into the parser to
get a full set of `changes` that can be used by the versioning system to
determine what the next version should be.


## #135, #136

Started exploring what it is going to take to gather all commits from `git`.
Well I started with exploring streams and how [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)
handles it. They setup a stream and pass everything through that. Which is
definitely going to be far more memory efficient. Right now, I'm not looking for
memory efficiency, so I'm going to shortcut with [**Simple
Git**](https://www.npmjs.com/package/simple-git) for now and I'll create an
issue to make it more efficient with streams later.


## #134

Decided to just pickup a simple task. So I finally swapped in
`rollup-plugin-node-builtins` instead of manually defining `fs`, `path`, etc. It
didn't work originally for me when I had a manual build process with
[**Rollup**](https://rollupjs.org/), but now that
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
builds itself it actually works fine which is nice.


## #131, #132, #133

Added some complexity to my `commit-parser`. It handles multi-line commits now
as well as a mix of bodies and headers and properly preserves line breaks within
a body as well as trims bodies, and other things. It fairly cleanly gets all the
results that I want. :) And I'm happy about that. Should serve me well moving
forward as I determine version bumps. And I feel this algorithm and style will
suite more situations better. I'll probably introduce more information to
commits in the future like tying the original commit hash to it, parsing out
affected issues, and other unique attributes. This will probably be needed when
I start looking into changelog generation. But I'll tackle that in the future
when needed. I think I can start tackling recommended versions now.


## #129, #130

So I started on my own commit parser and it seems to be fairly solid. I need to
start working on the system that will parse a multi-line commit which will be
the sort of fun part. And by fun I mean not really. We shall see how that goes
really. I think what I have is almost suitable enough. The thing is if a line is
not parseable by the regex then it won't have an effect on the versioning. And
that should really be enough. So I should just need to split the commit message
by line and then run each of them through the regex. It is possible that I may
need to also reference the source commit since a commit could have multiples.
This way when generating a changelog I can properly link to the given commit.
I'll think on that. But I'm close to having something I can work with at least.


## #128

So delved deeper into what the [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)
parser is really doing. It is overly complicated for my needs and since things
are sooo opinionated in
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
I'm just going to write my own parser with my own concepts. Mainly because the
code will be SOOO much simpler to understand. No reason to overcomplicate
things. So next session I'm just going to jump into commit parsing. I think I
may even get rid of [**Commitlint**](http://marionebl.github.io/commitlint/#/)
because I'm going to go super opinionated on this and don't want to bloat the
setup and I want to keep things as clean as possible and under this repo's
control. Makes it easier for me to stay agile as less exploration into other
repos. Especially since I have the skillset to build out most tools that I would
need myself.


## #127

Started exploring [**Commitlint**](http://marionebl.github.io/commitlint/#/)
structuring for messages. And I think I've decided that a single commit message
should be able to include multiple "commits". I should be able to have multiple
headers/bodies if necessary. And honestly `feat` and `fix` could also include
`breaking` as a type rather than `NOTES`. Cuz really each header includes a
type... and a single commit could include multiple types. Like I could add tests
and also add a fix and also have a breaking change in another scope. So I think
the commit style needs to evolve a bit. But the
[**Angular.js**](https://angularjs.org/) team has done a great job of leading
the charge on commit standardization. Next session I'm going to dive deeper into
the `conventional-changlog` commit parser to get a good sense of what they are
doing to pull of their parsing.


## #126

Lots more research into how `semantic-release` is handling things. So far I feel
like I'm going to end up writing my own commit parser and I'm just going to have
to deal. Gotta figure out how they approach grabbing all of the commits from a
repo. Shouldn't be too bad for me since I'm using `simple-git`. I'm thinking if
a dependency changes, assume a `patch` version unless a commit exists with the
scope of the package that changes and details around that change. And for sure
`BREAKING_CHANGE` is going to need to include scope so we know exactly what
packages need to update to a `major` version. So fun... :\ lol. Probably one or
two more sessions of research before I really start getting into things.


## #125

Doing some research on the best way to go about handling the recommended
versioning system. Reading up on what `semantic-release` has done and what might
be re-usable for this case. Also exploring how to handle dependency changes, and
just researching in general. There is a lot of ways to go about this, but also
handling auto-independent versioning on a large monorepo scale will be
interesting. Especially since a dependency within the same repo changing won't
always mean a `patch`, `minor`, or `major` update. Means I might have to either
change how changes are reported in commits, OR have a prompting system. I'm
thinking the best route would actually be to support multiple commit messages in
a body of a commit and scopes for a `BREAKING_CHANGE`. This would allow for pure
parsing of the commit and no prompting intervention. This probably means we need
our own parser as well. Lots to do!!!


## #123, #124

Well now I am gathering the version from NPM as well as the version in the
`dist` directory. That should be good enough. I don't do any error checking for
the version already existing in NPM, but for now this should be good. I just
want the information. I think the next thing I really have to start doing is
analyzing the `git log` in order to determine what packages need to be updated
based on the its last version. So that will be what should enable multi-package
publishing. That will be the next fun trek that I should be tackling today after
we return the rental car. Should be fun...


## #122

Been a couple of days since I've done coding in general. I was sick and also
yesterday we returned my future stepson to his dad's. But I'm back in the game
and excited to move forward. Lots to do still, but I really want to have
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
multi-package publishing in the next couple of weeks. Right now I'm just trying
to improve the publish command with more details about publishing. Right now I'm
gathering details from [**NPM**](https://www.npmjs.com/) about what might
already exist and I'll also grab info on the `dist/` directory and compare the
two for the publish command's output. Should be fun. :)


## #121

Just setup a basic `kd publish` template for now. I think I'm going to add some
new data to it, like an analysis of what NPM has for the version of each package
as well as the version that is sitting in the `dist/` directory. Those would
both be good. For now I have to switch to Python... side note we just started
using Vue so it has more JS... yay! lol...


## #120

WOOT!!!
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
is now officially publishing itself. Now it is being very explicit in what it is
publishing right now, but I'll fix that. With my next ticket to add some
non-side effect stuff.  Was a simple fix of just being explicit with the
`--registry` flag for `npm publish`. Glad that fucking worked, cuz I can finally
ease up a bit. And this is session #120 so that means I'm now 50 hours into this
project. That's how long it took to get it to publish itself. So if I was
working say 8 hours a day roughly with about 12 sessions a day. I could
theoretically have built
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
in 2 work weeks. But I'm working with it on the side including weekends so I'm a
little over a month of time. But still... feeling awesome right now since I
finally have this self publishing. Next is to focus on multi-package publishing.
That's gonna take some fun work, especially the detecting what packages need to
be independently versioned based on their changes as well as their dependencies.
Should be fun.


## #118, #119

Throughout the day yesterday I did research on my problem. Turns out I'm not the
problem. Apparently if you run an [**NPM**](https://www.npmjs.com/) script
through [**Yarn**](https://yarnpkg.com/), [**Yarn**](https://yarnpkg.com/) ends
up hijacking an important config variable called `npm_config_registry` which is
used to determine what registry to publish to. So running `npm publish` will use
that variable except it is trying to run it against the
[**Yarn**](https://yarnpkg.com/) registry... despite `registry` being set in the
`.npmrc`. Yeah that is annoying. So I am going to work on a fix for that. For
now though I'm going to get some non-side effect command going for `kd version`
so I have something to analyze things pretty-like.

These sessions I just did some random refactorings like move `env` variable
checking to the CLI script. I also decreased the threshold for [**JS
Inspect**](https://www.npmjs.com/package/jsinspect) since I really want it to
catch things like similarities between the commands in the system. So that was a
bit of fun cleaning up as I also found a small other place where I duplicated
code and just abstracted it into a new package.


## #110, #111, #112, #113, #114, #115, #116, #117

Soooo I've been playing with travis like CRAZY!!! I got the git updates to work
for versioning from Travis. But now I'm stuck on deploying to NPM and can't
figure out why things won't work. I'm setting an auth token and it just isn't
having it. So I'm going crazy right now in debug mode. I'll have to revisit this
tomorrow. Hopefully I can figure it out. I HATE PUBLISHING!!! Grrr... we shall
see how things go tomorrow. So frustrated right now. And sooo close to self
publishing... this is the last damn part.


## #109

Oops... I didn't start Python since I triggered an endless loop of CI... lol.
I'm glad I caught it. I had to add a `[skip ci]` line to the commit. But it
works now and I'm satisfied. :) Now my CI properly uses `kd udpate/version`
which is awesome. I love how much easier things are getting as I go forward.
This is what real quality software engineering feels like. We get faster, not
slower. I feel like I should add `kd log/work` to be able to manage my log
entries better lol. Probably when I setup a markdown generation system for
readmes. We shall see. Now it is time for Python.


## #106, #107, #108

YAY!!! Today is the one month anniversary of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
which is AWESOME!!! I've made a ton of progress. This morning I finished up the
`kd version` command which is working splendidly. I'm excited to start working
on the `kd publish/deploy` command portion. The git side effects weren't as bad
as I expected at all. Very happy about that.
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
and
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
have been a HUGE help to this process and I'm loving that. Very proud of my
progress. This will be a very powerful tool moving forward and I should be able
to start multi-deploying probably in a week. Which will be awesome. HUGE deal.
Time to go do Python for the day.


## #104, #105

Setup the side effect system which was a bit of a pain at first but it works
now... you now require a `--commit` flag in order to commit a side effect for a
command now. Otherwise it will just run the render function.


## #103

Setup the template for the `kd version` command. Jumping into the side effect
system now. Which means I might be able to replace the `npm version patch`
command with `kd version --commit` when I'm done. We'll see how that works out.


## #100, #101, #102

HAPPY NEW YEAR!!! Today I jump in deeper into the versioning system. I'm REALLY
close. I did a bunch of cleaning up and refactoring for how
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
and commands should work as a pattern. Setup the `jsonRenderer` from
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
to accept a property to isolate, which is awesome. I also setup the base command
of `kd version` which will now reveal the `old`, `new`, and `type` of patch. It
will also filter out unpublishable packages and ones with a version... which
will be addable in the future with a flag. Quick break before I work on the side
effect system of
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).
Then sadly I need to do me some Python work. :(


## #99

On the greyhound back from Eugene to Bend. Was a wonderful trip seeing my kid.
Cried like crazy leaving him again. It isn't easy. So this session I setup the
simple version recommendation system to recognize no version, or a pre-release
version as `0.0.*`. I'll work on patch, minor, and major based on git commits
later. For now, I'm going to work on the side effect system for
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).
I want to be able to "dry run" the version system and see the expected results
thentack on a `--commit` flag to run the side effect. Should be useful for other
things as well. I want
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
to push people to push out the side effects as far as possible to the outside of
the system. If anything, I know it will help me. Gonna probably rest for a bit.


## #98

So my session this morning definitely worked. I am fully building
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
with itself. Which is awesome.  So next thing is to start taking over the
publishing/deploying portion of the system. I need to replace the shell script
that I have right now. This means I need to handle the versioning system, the
git system, and the final npm deployment system. So lots of stuff to do. I'm on
the greyhound right now to Eugene. And I'm falling asleep. So I think I'll take
a nap break. Not much I can do if I can't focus. A nap might be good for me. I
forgot to drink coffee this morning sadly.


## #97

This is the moment of truth... I think I have removed the `prebuild` step
completely so now we generate a full `package.json`, copy the `readme.md`, and
the repo `LICENSE` to the destination directory. I had to hack together the
versioning for now until I tackle that portion. But I think I can get publishing
to work next chance I get... which is SUPER exciting!!! Hopefully things work.
I'm going to merge this log entry and then merge to master and cross my fingers.
This is a big step as it is now `0.0.50`.


## #96

Back into the work. It is Saturday and I'm heading out with my future step son
to visit my son in Eugene. :) Before that though gotta get some coding done. I
think I'm VERY close to being able to self publish. Ideally I get that self
publishing working by January 2nd... it will means that I'll have a working MVP
within just a month. WHICH IS AWESOME!!! This session I just added checks for
the required keys for the base config that will be needed for publishing. Going
to merge it in soon and hopefully get the `LICENSE`, `package.json`, and `dist/`
handled in the build command now. So I can remove the `pre-build` stage in my
`package.json`. Then we will be truly dog fooding the build.

I think for self publishing I still need a versioning system and a deploy
system. So hopefully we cna pull this off in the next few days. I probably won't
be coding tomorrow, but hopefully I can get something going soon. :)


## #93, #94, #95

Did a lot of refactoring in order to support root level checks for publishing.
But it is all done now and we now can check for repo level dependencies like the
`LICENSE` file. Next will be checking for keys in the `package.json`. Once I do
that I can actually start applying the check to the `kd build` command. WOOT!!!
Time for Python... \*sigh\*.


## #92

Closed out a couple tickets that verified that `kd check` could handle a mix of
multiple bins and main files. Looks like it all works fine now... there was one
bug. And added a ton of snapshots to catch them in the future. The next thing is
to probably handle repo level checks like checking for the `LICENSE` file and/or
things needed in the root config like `repo`. Then after that probably some
aggregate stats on the check. And then apply the build system to all publishable
packages.


## #91

So rather than go to coffee, I had an epiphany on how to fix the damn tests in
CI. I just needed to change the working directory in the test to the test
directory so that way I could set `root` to a static value of `.`. Which worked
perfectly. So now I can go get coffee and breakfast. :)


## #87, #88, #89, #90

Finishing up the last bits of pretty printing the checked packages results. I
ended up adding more details to the results as well and now they are nice and
pretty. Looks great so you can see what packages have what and what packages are
missing what. Side effect to all of this is that I had to update the tests for
both `check-packages` and `find-packages` to use
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape).
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
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
for the first time with the `executor` portion of
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).
And it was very informatitive. It let me know that I definitely need a `when()`
operator for
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
as well as a `then()` operator. I also need to really try to put some focus on
setting up multiple `describes` in a single test file properly so I can test
various configurations of a SUT. But the cool thing is that my build test suite
is now running both
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
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
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
All part of this ideal Developer Experience that I'm trying to shoot for. I'll
try to start implementing it next session and see how things go.


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
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd),
but I'll survive. For now I need to stop as we are going to pick up my future
stepson for him to spend winter break with us. My development speed is going to
slow over these holidays, since I'll be spending time with him and off the
computer over the holidays.  Still lots to do, but things are really coming
together slowly. One day I'll probably split off the `kli` project into its own
repo, but for now I'll keep it here. It might actually be valuable for me to
have an automated process to split a monorepo into multiple monorepos so that
will be my test case. AWAY!!!!


## #56, #57

Refactored out the searcher functionality and coincidentally added a new feature
to be able to use a string or an array for `aliases` which is awesome. It is
nice being able to easily created a new package using the
[**Alle**](https://github.com/boennemann/alle) repo structure. And once
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
is setup then I'll be able to really start publishing new packages really
quickly and keep all my functions small and awesome. I think ultimately I have a
very powerful system. More refactoring?


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
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).


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
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli).
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
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
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
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
I'm hoping things go smoothly, but we shall see.


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
part of the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
actually. It should make the CLI much easier to use as it will be smart enough
to determine what command you are trying to run. Should be a fun little thing.


## #36

So I quickly tweaked the build command to work adhoc with a bunch of hardcoded
things and I got it to work properly!!! I'm super pumped, but now I need to go
through and properly support details. Like I needed to handle ignoring paths
from the `find-packages` script. So I added that. I need to keep going through
and tweaking things until I get something that really works. I think by default
I need to ignore the `__tests__` folder. Since this is
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
then I'm fine with being opinionated period. More work to be done!!! But I
should totally have the build command working tonight!


## #35

I feel like I'm SUPER close to having this work. I'm going to have to tie in the
root of the packages in order to properly run
[**Rollup**](https://rollupjs.org/) in the right destination folder. Hopefully
the next session I'll have it working just right. I'm SUPER excited to have this
work cuz this is the first real work that
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
will actually do. So I'm fairly pumped about that. I REALLY hope this works. I
hate that I have to work right now... cuz I'm like right there at the finish
line. Oh well... time for **Python**.


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
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
itself to start eating dog fooding. This will lead me to rely on it in the
future. And right now the only deployable is the `cli.js` so I'm going to write
up a build system that only handles a `bin` entry in the `package.json`. So it
shouldn't be too bad.  Hopefully... it is time to get very familiar with
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
left in me for the day before [**Monster Hunter
World**](http://www.monsterhunterworld.com/) Beta!!!!


## #13, #14

Finally started doing the setup for some real coding. I converted
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
into a monorepo of the style that it will investigate. Since working on
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
I have discovered [**Alle**](https://github.com/boennemann/alle) which is a very
powerful structuring for a monorepo setup. It requires some unique adjustments
for build tools and what not that default to ignoring `node_modules`, but for
the most part it is very powerful and awesome. I've also finally setup a test
script and the basics that I need for rapid development like a watch script as
well. This is definitely a solid start. My first task is to implement `kd ls`
which will list all of the projects in the repository based on the
[**Alle**](https://github.com/boennemann/alle) structure.


## #12

Fixed the `shebang` issue that was happening that kept me from running the cli
tool properly. Wasn't a difficult fix, just a [**Babel**](https://babeljs.io/)
plugin that I found that will also translate the `shebang` appropriately. I also
fleshed out the `kd ls` command which I think should be the first command as it
is the simplest of them all and will work towards gathering all of the project
info that I'm going to need anyway in future commands.


## #11

Dived deeper into each of the commands that the CLI will implement. It looks
like the first one that will be good will be the `kd ls` command as it will need
the initial system to determine what projects exist in the repo. So I think the
next thing to do is start working on the CLI tool. I might look into `meow` for
the simple CLI layer. We'll see how that goes.


## #10

Setup initial planning document for CLI tool as we progress forward. Figuring
out all the details that will be needed for the tool. Even going as far as
considering how easy it is to type the commands.
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
seeks to speed up the development agility of Open Source maintainers.


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

Started mapping out all of my initial ideas for how to achieve a
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
certification. Got through some initial changelog details and really got into
details around a new [**Semantic Versioning**](https://semver.org/) proposal.
Mainly since projects on [**NPM**](https://www.npmjs.com/) are still at major
version 0 and being used in production. Announcements should happen at `0.1.0`
instead of `1.0.0`. And then Major version represents the number of breaking
changes you have introduced. And Minor represents the number of feature releases
you have had that people will care about and need to be publicized.


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

So what is this about? Well
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
stands for **Kontinuous Integration/Kontinuous Deployment**, get it?!? lol...
but seriously, I was working a lot with
[**Transmutation**](https://github.com/RayBenefield/transmutation) preparing it
for a quality developer experience for contributing and ultimately realized that
I want to standardize my ideals into a standard that I keep across all my
projects. So that is what
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
will do. It will check whether or not the project it is run on is certified with
the heavily opinionated standards that are inspired by the open source
community. I'm by no means an expert, but I like having my own standards to
follow and automate. So this project will provide tools as well as a checking
system to make sure there is some sort of compliance. I'll flesh this out in the
next few sessions in the readme with all my goals.
