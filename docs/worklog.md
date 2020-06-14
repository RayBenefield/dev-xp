# Worklog

## #694, #695

Got a basic serverless function working to authenticate on Twitter, and also
found out how to send a state query parameter so I know which user triggered the
authentication. This includes setting up an encryption and decryption system to
send state across calls. Next thing I have to start really exploring is how
to structure the users collection so I can query by various identities and
acquire the credentials that I need.

## #693

Started simply by setting up the `rampant.ai` domain so it can be used for
serverless functions in the future.

## #692

Spent a session last night where I was just exploring a Twitter auth path. I
really want to start exploring the potential for adding Twitter based
integrations into Mixer sooner rather than later. I think it will start being
very important. Kinda wanna explore Firebase Functions and setting up an oauth
flow that way.

## #690, #691

Refactored more responsibilities out of intents. I want intents to be as simple
as physically possible so they are easy to contruct from the ground up. More
specifically I removed the need to subscribe to an intent and also removed the
ned for a giveawayRepo to be contructed. Next thing is probably to create a
pools repo and then find a way to simplify giveaway logic a bit.

## #687, #688, #689

Did ALL the moving required to isolate the `@fever` namespace to strictly be
nothing but intents for rampant to process. And then I wrote a `find-modules`
module that finds all resolvable modules in a particular namespace so they can
be loaded as intents. Now I have a fully centralized intent loader system that
will allow me to easily create intents without having to hook them up to rampant
anymore. I still have some more work to clean up each of the intents and make
making intents much easier in the future. Eventually I'll setup a plugin loader
system that will include batches of intents, until then though I'm just batching
everything under the `@fever` namespace. Working backwards seems to be working
better than my first approach to `rampant`.

## #685, #686

Refactored out the remaining pieces of the come-at-me system into intents and
now everything is registered in the selection module. Now I need to refactor
that into a system that dynamically loads from a single folder. Doing that will
simplify the intents even further and make it really easy to create new intents
in the future.

## #684

Refactored out part of the initial come-at-me system, once I've separated them
into intents I can start working on the base intent loader system so I can stop
manually including them and just make a new module instead. Also automatically
generate a logger and subscribe to lower the lines of code needed for an intent.

## #683

Replaced the complex transaction logic with simpler increment logic also using
`upsert` to check if the document exists or not already.

## #680, #681, #682

Added a new clear-code command as well as a new intent that reacts to the
creation of a new code for a lobby. Also fixed a bug that existed when storing
winner results. I need to eventually start working on auto-detection of new
intents in a single directory so it is easier to manage things. I also want to
auto setup a logger for each intent.

## #677, #678, #679

Did a LOT of refactoring to clean up the required code in all of the intents.
The goal is to make it SUPER simple to create a new command with a bunch of
useful shortcuts like a moderator gate that "errors" because it doesn't have
certain information.

## #675, #676

Created a new filter command system that accounts for different roles in the
channel. As well as added testing for it. In the future I need to set it up to
handle both whitelisting and blacklisting options. For example a command for
subs but not for moderators.

## #673, #674

Refactored a lot of stuff around the pick command, the most complicated of the
commands. Add lots of functionality to the giveaway repo and extracted the
choose winners code. I'll need to update that to choose multiple winners in the
future.

## #671, #672

Refactored the code and enter commands to use the new moderator abstraction and
the giveaway repo. Shrinking the code down to less than 50 lines.

## #669, #670

Was going to push up new giveaway code, but realized it wouldn't pass linting so
I'm taking the time to refactor now so I can push it up and continue work for
kikd. I've created a giveaway repo for data access purposes of the giveaway
system, and I've also created a moderator package to simplify command streams a
bit.

## #668

While on stream I created a code command to restrict code access for a game to
be for only those with access to the chat. Eventually I'll track the games we
play and who requests the code but for now I needed to block out people having
access to it if they were banned.

## #666, #667

Refactored the give command to be more modular and handle the addition of slots
so in the future I can make it work to have multiple winners for a single
giveaway.

## #665

Refactored all of the commands into their own modules for now until I can
optimize things in the form of a Rampant framework. But right now I need to
prioritize having multiple winners for a giveaway so I can avoid giving the same
people the same reward.

## #663, #664

Refactored how the entrants used for Winners is stored. This allows us to know
where the Winner was picked from as well as the totalEntries used for the
giveaway and the total candidates for the giveaway. This should now enable me to
easily run setup multiple winners for a single giveaway. So I can just do `!give
sub` multiple times to add to the giveaway and avoid duplicate winners for a
single thing for the week.

## #660, #661, #662

Started the refactoring of winner/entrants by removing the realtime need for
"starting" and "ending" entries. Instead now we just start a giveaway, handle
entries, then pick and clear the giveaway. I will need to "block" a giveaway if
one is already in progress as well as handle multiple picks, and new storage of
winners. The new data structure for giveaways is next on my list to clean things
up.

## #658, #659

Working on refactoring winner/entrants for giveaways better based on entryPools.
Also thinking on how to handle code giveaways for access to custom/creative.
Lots of things to consider, but I think I may have a data structure I'm
comfortable with and I may start with the migration of the old stuff first then
setup the new system.

## #656, #657

Refactored where entry pools are stored in the database for better organization.
Also started including the total of an entire pool's entries. This will be
useful for watching week to week growth.

## #652, #653, #654, #655

Recreated the entire come-at-me giveaway system in Dev XP. A lot of old hacked
together code that I just decided to make work. Now the goal is to refactor it
into something that is a little more powerful and flexible that I can add to as
time goes on.

## #649, #650, #651

Properly determine the difference between what files need to be reset vs what
files need to be added. This is important for files already staged vs not
staged. It took some fancy work, but I got it working well. Next is to craft
commit messages based on chosen files to be added.

## #647, #648

Finished up the work on collecting the files in `git status` programatically,
and also got a working prompt with checkboxes that works properly and pre-checks
already staged files, and presents modified and untracked files as different
sections and colors. Now to use that to construct commit messages.

## #644, #645, #646

Moved over the entire Transmutation module including all the operators all of
the tests, and the old worklog for it. I need this for the merging function used
for `transmute().extend()` so I can properly merge git status files for a proper
commit command.

## #643

I started work on trying to setup SemCom to handle a `kd commit` command so it
could take modified, untracked, etc. files and then generate commits for them.
However I ran into a problem where I need to bring over some code I've written
for `transmutation` so I can do a proper object merge. I'm going to bring
`transmutation` over to my main `dev-xp` monorepo so I can utilize that code in
SemCom. That's my next goal.

## #637, #638, #639, #640, #641, #642

Brought over my old Come @ Me giveaway system that was with the old rampant
stuff. Took a bit to adjust the mixer chat stuff to the recent Rampant work I
did, but it is all good now and handles prefixing entries based on week which is
a nice new feature. Also properly handles new people entering the giveaway and
has logging as well.

## #635, #636

Did a little more testing on `kd new` with a CLI package and realized the output
file is not being set to executable so I made a ticket for that. Other than that
I added creation for a basic npm package now and that is all setup and ready to
go. The next thing I want to do to ease the monorepo process is expanding SemCom
to handle committing to craft the proper commit messages with the proper scopes
and message lengths so that way the actual update process can be done seamlessly
rather than manually. I'll also need to address the updating process to handle
more than just a patch version. It needs to handle a minor and major, which
means supporting BREAKING CHANGE as a part of the commit as well.

## #630, #631, #632, #633, #634

Did all the necessary work for the `kd new` command. It took longer than
expected as I was finding better ways to implement the request for data and the
effect within a plugin rather than directly in a command. But it is now all
figured out and I'm able to create new CLI packages. Next is just creating basic
NPM packages which is a lot less work. Also created a decent template for it and
figured out how to due plugin based templating.

## #627, #628, #629

Started work on the `kd new` command. Got the new command setup as well as the
basics for requesting the data needed to create everything. Should be fairly
easy to finish in the next couple sessions.

## #625, #626

Spent some time exploring what is going to be needed to make `kd new` work so
new packages can be created. I'm going to need inquirer to choose the type of
package as well as need to consider `babel` packages that need to be installed
to make things just work. I want to start with a CLI package first and then move
on to the normal NPM package. The reason for this is that it is the best way to
showcase the system working.

## #623, #624

Added the final parts to run the initiailize method. I initialize git, create a
`package.json` file, and create the `src/node_modules` directory. Technically
that's everything that was needed now next is to create the `kd new` command so
we can create new projects.

## #619, #620, #621, #622

Made all the necessary adjustments to KLI and continued with the KIKD init
command. I also created a template for it. I'm publishing KIKD now with a
stubbed out effect so I can test it with `npx kikd` before actually creating a
monorepo.

## #616, #617, #618

Started the basic setup for an initiailize function for kikd. Started with just
a basic command with no template and an effect that just console logs. Realized
that I need to make more updates to KLI to support this new command. For
example, commands are dry-run by default and instead this command needs to be
auto commit so a new monorepo can be made with `npx kikd` rather than `npx kikd
--commit`.

## #614, #615

Add functionality to set a default command using just the name of the command.
To do this I had to require that every command have a name, and then create a
hashmap of commands by name. Got that all checked in and set a default command
of `kd ls` for now for KIKD until I setup a proper initialize command.

## #610, #611, #612, #613

Setup KLI to support default commands properly with some testing. Also did some
refactoring for later growth of KLI. With that in place I can start creating a
KIKD initialize command that is default to start a monorepo or spit out stats
for the monorepo. After that command I can also add a new command to create new
packages which will need to be done on a plugin basis.

## #606, #607, #608, #609

Haven't written in the worklog for a while even if some work has been done. I
need to upgrade KIKD to have an initialize command that starts the monorepo
structure as well as a create new module command. To do this, I need to upgrade
KLI to support a default command so KIKD can be setup by running `npx kikd` in a
new folder. Creating a new module should also support both a regular javascript
module as well as a CLI module. So they both need to tap into the plugin system.

## #604, #605

Fixed a bug with KIKD that basically was not properly adding dependencies that
were imported with parts like `simple-git/promise`. So when Dex was published,
it would be missing the `simple-git` package. So I wrote a function that would
strip import parts for the main package. I did it with testing from Kape as
well... everything seems to work after merging everything. I'm satisfied with
the update. Next things for Dex is to auto push, and also detect what branch it
is on and make sure it is only putting log entries on master.

## #602, #603

Setup Dex to work with git properly. It adds the respective files to be
committed, then commits them with a header message as well as a sanitized
version of the entry. Already merged and published.

## #599, #600, #601

Spent this morning making the final adjustments to have a pseudo working Dex. I
added the saving of a config file so that way the session will automatically get
tracked every time we make a worklog entry. So now I can manually do all the git
stuff and the worklog entries work fine. Found a quick bug that I will need to
fix, but ultimately it works as I need it to. I'm satisfied for now.

## #597, #598

Wrote all the necessary stuff to manage the worklog markdown file itself. Lots
of work done which is really good. I insert lines when it exists, I create a new
file when it doesn't. It all works out perfectly. Next thing to do is update the
config file so we can continue the numbering from the latest session.

## #596

Refactored some things to clean up the base file. Extracted config management as
well as prompting. Then did some research on how to generate a markdown document
like this worklog, right now I haven't really found much. I may have to hack it
together with basic file writing. Looks like I have an `insert-line` module that I
can use. Hopefully it works neatly. And if it doesn't exist, I'll just create a
new one easily.

## #593, #594, #595

Tried to merge everything and everything broke in many different ways. First it
was trying to pull in the `package.json`... rollup wasn't handling things
properly. Then when I published it, Winston wasn't very happy since it exports a
default property. So I had to override it a few times to find a workaround. But
now it looks like Dex is finally working after being published. Now I can
progress forward.

## #592

Setup reasonable defaults for the config so when it is time to actually write
the worklog entry, then it is written properly. I may actually call this one
good for now, cuz I think I want to try to replace my current worklog approach
sooner rather than later. I'll add subproject management in the future. Next
thing is to merge and write a worklog if one doesn't exist. After that I need to
edit a worklog that does exist, which should include this one. And then I need
to manage committing the changes.

## #591

Added a basic setup for loading a config file. This config file will hold the
latest session count, the subprojects that exist, and any other details that may
need to be known.

## #590

Setup a logging system and basic CLI toolage for Dex. Hopefully as things go
forward it will be neatly logged on the CLI and I can debug it easily. Dex
doesn't need to do very much so hopefully it doesn't become obnoxious logging
like Rampant at this point. Next thing I'm going to work on is the actual prompt
system to collect data on a session.

## #588, #589

This morning I setup the module for Dex's CLI tool and published over my old
one. It worked out really quickly. Now I'm just working on nailing down an MVP
to work with to call it good then make updates from there. Right now my target
MVP is backup all session information on Firebase, keep project info local, git
commit/push on master, and a managed markdown worklog file like this one.

## #586, #587

So apparently I broke something and I'm not sure what. So tomorrow I get to go
through the painful process of figuring it out. And my logging is absolutely
useless to me right now so I need to think of a better way to do it. I want to
kind of filter the logs down, but I'm not exactly sure the best way to go about
that. It would make my life sooo much easier if I could select which parts of
the system did logging. So that way if I know that
[**Firebase**](https://firebase.google.com/) is not the problem then I don't
have to log the darn documents for that.

## #584, #585

Finally added sources to settings thanks to the import functionality. I also
added export and delete functionality for projects and cleaned up the testing
and export systems more. I added basic logging for the new functionality, but I
need to add more and extract the start project functionality a bit as that file
is getting unusually large. So that's on my list for next timel before I
actually merge in all the work. Perhaps I'll get one more session in to merge
everything in.

## #583

Currently working on optimizations to make the footprint for intents much much
smaller so I can more easily create intents for situations like creating tests.
I now create a default source if no source exists that will automatically run
the intent on creation with the appropriate filtering. I've also removed some
lines where parsing is not necessary for a log message. Just looking to clean up
the testing system as I move forward.

## #582

Starting work on extracting the import/export/delete functionality of rampant
projects from the testing system and the CLI tool. Lots of little things that
need to be refactored to make this a clean transition. But doing this will
result in a much cleaner project management experience for rampant in the
future. It will open up functionality that I need in the future for the webapp.

## #581

Slowly starting to get back into things. I need to more programmatically handle
projects so I'm going to convert the import/export to features of the
@rampant/ai module so both the CLI and the testing system can use the same
stuff. I'm also combining the intents and project settings into a single file so
this requires edits to the export and import functionality.

## #580

Added a unhandled rejected promise handler for properly logging the errors that
happen. Then adjusted the erase command on the chat bot to be a proper promise
so it can be logged appropriately.

## #579

So exploring what needs to be done moving forward for the giveaway I got into a
spot where it felt right to add logging to the [**Mixer**](https://mixer.com)
plugin stuff so I prioritized that first. I'm kind of not feeling coding right
now and may instead just jump on Destiny for a bit to relax. I'm feeling not
well rested. But at least I had the discipline to do one session. I think I need
to add the intent to these logging messages so I'll do that real quick next
time.

## #578

I've spent too much time away from the project and I wanted to get back into
things in a way that felt meaningful. So I've started exploring what it will
take to create the Come @ Me giveaway system again. To do this I'm designing a
full giveaway plugin that could be included in projects in the future easily.
This plugin should support both raffle/entry based giveaways and just singe
entry giveaways that most streamers use during the stream. I want to be able to
create an entry pool and then randomly select from any pool. A giveaway should
also be able to pull from another giveaway's entry pool. We should also be able
to have a set of winners and be able to track whether or not winners have
redeemed their prize. To match the current streamer giveaway economy, we should
allow a form of redeeming that involves typing in the chat after the winner is
decided. This will be a fairly robust system and will require a lot of parts.

## #575, #576, #577

Spent all this time trying to figure out how best to structure the query for
`intentCount`. Ultimately I finally got the pagination working properly and it
is SUPER valuable. Makes a big difference in training already. I got sucked into
training because it was less about going through a bunch of negatives and more
about feeling real progress. Side effect is that the sort is backwards
alphabetically, but that is probably way better since a lot of questions start
with the letter `w`. Next thing I want to work on is to improve the command
system.

## #573, #574

Created a tool in order to add `intentCount` to the untrained samples. This will
allow me to then query based on `intentCount` allowing me to prioritize training
of things with suggestions first.

## #572

Minor tweaks before merging the code. Particularly around [**ES
Lint**](https://eslint.org/) stuff. But happy that part is done. Time to make
some key improvements here.

## #571

Finished up the last of the logging and I'm not ready to merge all the work I've
done for that logging. Time to work on somethings that will make a big
difference for the stream. Like having a flag to train samples with suggestions.

## #569, #570

Finished up the refactor and the logging for the NLP extension. Also took a bit
of time to extract the [**Firebase**](https://firebase.google.com/) db
interface's basic actions to its own module. To remove that warning. I also
found a couple places to improve the logging levels of the
[**Wit.ai**](https://wit.ai/) plugin in the `processIntent` steps. Last thing to
do for [**Wit.ai**](https://wit.ai/) logging is to log the API calls then I can
move on to another important part. Perhaps the intent engine is next.

## #567, #568

Started diving into adding logging to the NLP extension and got sucked into
refactoring it like a lot to simplify how it works. So yeah... I'm in the course
of adding logging AND refactoring. But I need to step away before I get too
sucked in.

## #566

Well I tried to improve and debug the dedupe tool, but when all was said and
dune. I think it already did its job. Sooo that's cool I guess. Not sure how
many it removed then. I should probably be more careful with how I do things in
the future. lol... back to regular scheduled logging.

## #565

I quickly threw together a dedupe-untrained tool hoping to make training easier
this coming week, but I'm not sure it was successful lol. I hit the quota
carelessly. Today we test.

## #564

Add logging to the main portion of the Wit plugin as well as refactored out the
nlp extension. Next thing to do is log that.

## #563

So I got lost in learning more about [**ES Lint**](https://eslint.org/) but the
good news is I discovered that I can consolidate my testing rules with my main
rules. I've also discovered how to change a rule dynamically for a file so for
the files that have logging I've decided to give an allowance of nearly twice as
large. Allowing for less than 100 lines of code still (using 99), but allowing
lines 51-99 be extra buffer that might be needed to provide good logging. When I
get back to things after breakfast, I'll start working on the actual logging.

## #562

Spent the time refactoring the [**Wit.ai**](https://wit.ai/) plugin to use
streams instead of promises. This cut down the lines of code significantly. Next
thing to do is to go through and add logging to everything.

## #561

Created a quick CLI tool that will sync [**Wit.ai**](https://wit.ai/) training
for all intents to our training cache which may need to happen again in the
future. I realized I probably want a new module space for these quick tools in
case I ever need them again. Cuz I've had to write a bunch recently. I should
also probably add logging to them in the future. But for now we good. I may want
to invest in a quick way to write these in the future. We shall see. These tools
will inspire features on the frontend.

## #560

Refactored the process intent logic to use the new `train-samples` module. What
I also realized was I was overwriting our cache that we were building every time
I run rampant. Which is dumb, but the data is not lost as it is stored in
[**Wit.ai**](https://wit.ai/) so the next thing to do is to create a re-sync
tool to extract the samples from wit for each intent and store it in our cache.
This may come in handy in the future.

## #559

Alright, was able to change how negatives are stored and used and now we should
stop re-storing negatives as untrained messages and we will be lessening the
hits on [**Wit.ai**](https://wit.ai/) as well. So that's a win. Next is to allow
the process intent to use the new train-sample module.

## #558

In preparation for logging for the [**Wit.ai**](https://wit.ai/) plugin, I am
exploring opportunities to simplify it and refactor it to be cleaner. I'm also
exploring allowing training through intents. Perhaps taking unknown intents and
adding them to the untrained space. Not sure if I'll take that approach yet.
We'll see. I'm also exploring consolidating the train samples logic that the
training tool uses alongside the `processIntent` system.

## #557

Finished up the logging for the main rampant module. Should end up working out
well and help a lot. I need to add logging to the intent engine and the
[**Wit.ai**](https://wit.ai/) plugin as my next targets. That should give me
some decent relevant coverage. Then the [**Mixer**](https://mixer.com) plugin
and [**Firebase**](https://firebase.google.com/) plugin so I can start working
on the Come @ Me giveaway system. Still sooo much to do. Shower/breakfast time
now.

## #556

Back to working on logging. I'm working on the main module and figuring out the
best way to handle certain things. I want to log all the things for debugging
sake, but I'm starting with the top level of platform and working my way down. I
created a stub logger so I can shut off logging for different things while I
work on decking out the debugging messages for different parts of the platform.

## #555

Spent time polishing up the database logging and then created new tickets for
logging as well as merged the pull request for all of the base logging stuff. So
far so good.

## #554

Fully decked out the database interface with logging so I can determine what the
hell is happening at a detailed level if need be. It will help me optimize my
calls to the database which is necessary since I am constantly hitting the
quota. Next is to start logging out the main rampant system. Lots to do, but
this already feels super valuable and I love it. Nice to make this feel like a
more official polished product.

## #553

Made some quick modifications to the training tool. Cached the other intents
list to avoid making lots of calls and hitting a quota. I also added a `cancel`
option to the others list so we don't ahve to make another massive call for
intents on reboot.

## #552

Finally figured out how I wanted everything setup and I setup the CLI to accept
a log level, as well as an environment variable for default log level. I've
started adding logging to the [**Firebase**](https://firebase.google.com/) db
interface, but it is not done yet. Also I need to remove the insane amount of
queries that I make for autocompleting in the training tool.

## #551

Still exploring how to place the logger in various places to work as needed. For
example one of the things I realized is that before rampant starts, it exports
the database which needs a logger. But when we start rampant, we could be
changing the logging levels so I need to make sure that that can be changed on
the fly without changing the logger in the database. I think I'm just about
ready to start logging all the things.

## #550

Explored how I want to format the logging for Rampant. Lots of little details to
figure out. I have the levels defined essentially by depth. Where platform based
logging will happen at the top level no matter what. And plugin setup/teardown
details after that, then intent completion, then extension steps, then details
about the extension trigger, then debugging to print all the things. This should
work out moving forward... hopefully.

## #549

Spent some time exploring the possiblities with
[**Winston**](https://www.npmjs.com/package/winston). I'm trying to find a good
way to print what needs to be printed. Like which intent is being worked on,
which plugin is printing the message, etc. Lots of little details to figure out
to get a good logging system.

## #547, #548

I have gotten really bad at my worklogs lately. I think the last two sessions I
just did dedicated training and patched a couple bugs. I just merged all the
work. And I was going to work on the Come @ Me giveaway system, but I realized I
should really put work into the logging system so I can make it way easier to
start debugging these more powerful intents as I build out the plugins. So I'm
going to start working on [**Winston**](https://www.npmjs.com/package/winston)
to get a logger in place.

## #546

I realized that I didn't put in my last log yesterday. I didn't do much, just
spent most of the time doing dedicated training and I'm going to continue that
for a little bit to see what else I need to get done and then put in a merge.

## #545

I believe I got creating a new FAQ intent working well. From testing it a bit I
realize I need to choose from different kinds of intents, and I also need to
grab details from the project to create the intent properly. So I need to do the
project global variables system soon so I can make the training tool better. The
main other type of intent I need is an empty intent that is recognized, but
doesn't need anything done for it. Like a greeting, confirmation, denial, etc.

## #544

Didn't take long to setup an autocomplete prompt for existing intent training.
So I did that and copied most of what was done from
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd).
Next thing is to work on creating new intents with the training tool.

## #543

Did a bunch of project management and created immediate tickets to get things
working as needed before I can be featured. I want to apply for a featured
schedule before next week so I want to get as many things in place as I can to
have a smooth transition into featuring and start handling rampant growth. I
also fixed up the fact that uploading the project sources was removing other
things in project settings so that now exists.

## #542

Finally found the problem with the callstack and was able to setup the training
tool to work as I want. I still need to add more features like being able to
create a new intent from the prompt and also select a previous intent using an
auto-complete. I also just realized I need to update the source import to avoid
deleting the noIntentSamples. So that's on my list as well. A bunch of little
upgrades for the tool and I should be good.

## #541

So I figured out why I was getting a callstack problem. I'm requesting thousands
of requests without even realizing it while I'm training. So I need to figure
out how to avoid that. I think I may have an idea, but we shall see tomorrow. At
least the necessary training logic is in place.

## #540

Tried to get [**Inquirer**](https://www.npmjs.com/package/inquirer) to work
well, but it looks like I'm getting a weird callstack error. It looks like
ultimately this will be simple. I'll skip things that are new intents, I'll
train things that are old intents, I'll "negative" train things that don't have
an intent. I also realized I need to add an "Other" option to enter an intent.

## #538, #539

Finally getting back into working on the training tool. The biggest daunting
thing was the deferred fetching of results which wasn't too bad once I found a
sample. Then I started to verify that the negative samples training thing was
working and had a place to sit in the database. Next thing to do is now setup
[**Inquirer**](https://www.npmjs.com/package/inquirer) so I can train one sample
at a time. Right now I'll skip any that needs a new intent. But in the future
I'll write a system where it is easy for me to quickly add an intent.

## #537

In preparation for the training tool I needed to extract the
[**Wit.ai**](https://wit.ai/) API calls to its own module and abstract it. I
also figured out how to do negative samples, which will be important for
handling unknown messages. I think I need to store them somewhere in the
database as well so I'll have to look into doing that. This way I can handle
caching of unknown things which will be helpful.

## #536

Finally starting work on the training CLI tool. I put it off yesterday and chose
to work on Fortnite Creative's new patch to recreate Crazy King from Halo.
Started working on the training CLI only to realize that some of the samples
posted as untrained have whitespace trimming issues. So I went over to the
sanitize portion of the wit plugin and updated it to handle trimming. At the
same time I also added snapshot tests. I forget how useful
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
is as a testing tool. It was SUPER easy. I'm very happy with the work I did
before honestly. Holy hell, it felt good. I also realized how important it will
be to setup "unknown" intent handling. So next session is about exploring that.

## #534, #535

The migration tool is now good to go. I was also able to learn about doing batch
operations with firestore which was SUPER helpful and I may actually look into
refactoring the training system to do the same thing on initial startup. I'll
make a ticket for that. Next thing to do is to build a new CLI tool to train the
system. Something else I learned was also that you can have a negative version
of training where it specifically doesn't now how to classify the intent. So I
may need to re-think some of my training as well. But I think for now I can
classify things as Unknown and then go back and fix it later.

## #532, #533

Started working on the migration tool to store all of the console logged
untrained samples into the database, and ended up accidentally hitting the write
quota for Firestore. lol... oops. 20K is the top and I was doing both storage
and updating an increment to count number of Untrained Samples. Well I guess I
will continue this tomorrow then.

## #531

After a guess is made with [**Wit.ai**](https://wit.ai/) we now store the
entities discovered in an untrained section of the database to be used later for
training. Now that I know the structure of that I can now make a migration tool
that will convert the console logs into untrained data. After that then I can
work on a training CLI tool.

## #530

Created an export command for the Rampant CLI which allows me to output the
sources and intents from the database into a data file that I can use to run a
project. It involved finding javascript stringify, but was well worth the effort
and a lot easier than I expected. Next is to start storing the untrained guess
to the database.

## #529

Before moving on to the work that needed to be done. I had to finish some
refactoring and clean up a couple bugs. One being the message more than 280
characters, since [**Wit.ai**](https://wit.ai/) can't process that. Also merged
everything into master so I could move forward cleanly.

## #528

Spent the morning preparing for doing work on the project. Made some tickets and
figured out what needs to be worked on first. I'm working towards having a
system where I can train Rampant at the end of each day easily. First things
that need to be handled is to store untrained messages into the database, create
a migration tool to store all of the current untrained messages that I have from
the console, and to create an export command so I can keep the local files in
sync.

## #527

Spent some time planning out what my next features are going to be for my stream
so I can make plans on what to work on next for Rampant. I think the next big
focus needs to be on improving the accuracy of the model by including lots and
lots of training in a particular way. First things first is to create a place to
store untrained stuff and then to store the current stuff with a script and then
to default to storing to that place in the database.

## #526

I spent a bit of time writing out a really long Twitter thread of the cool
things I will be able to do with Rampant with ALL of this training data. This is
absolutely a big deal and I can't wait to show people the power.

## #524, #525

Since I've been logging my guesses from chat messages I realized I was able to
collect all of those samples to use for training data. So I used some Vim
trickery in order to filter down my terminal buffer to just those guesses over
the past week. Now I have this massive sample file to use to train my model
for my channel. This is HUGE.

## #523

I never logged this, but I fixed some basic bugs to make Rampant stop crashing.
Mainly around empty query strings being sent to [**Wit.ai**](https://wit.ai/)
and also around not being able to auto-complete a command that was not found.

## #521, #522

Spent time exploring what needs to be logged, what errors happened yesterday,
and other things. Also spent time showing Jess how RxJS works so the intent
engine and stuff makes more sense moving forward.

## #520

Spent time showing off the build system to Jess as well as explored different
logging options for node. I think I'm going to go with
[**Winston**](https://www.npmjs.com/package/winston) so I'll start exploring the
package with some playful log stuff.

## #516, #517, #518, #519

Spent a couple hours with Jess giving a brief overview of Rampant so she can
start exploring and contributing when she finds the time. :D This happened a
couple days ago. Just late with the log entry.

## #515

Spent a bit of time doing some more training for the bot. Added discord and
subgames and a schedule and gamertag. Not much done. Just seeing if I run into
any more problems. I think the next major thing I want to do is make the Come @
Me giveaway system work as well as the untrained storage system so I can train
the bot after streams.

## #514

Finally merged in all my previous work to master. Fixed the cache for the mixer
chat real quick and just some basic training and testing. Nothing much, made a
cuople tickets and reviewed my prioritization of some tickets as well. Things
should be good for a big ticket soon. I could probably get some basic
refactoring done here PAX. We'll see if I can bury myself into something deep.

## #512, #513

I'm at the PAX west media room working on implementing new samples and
perfecting my ability to demo stuff. I really need to start implementing a
logging system so I can analyze things a little better. I got the sanitization
system working now so that way the cache is 1000% more useful. Now it's just a
matter of testing some training. I'll probably do some more training and also
merge in the work I did. I'll be working on this throughout the event.

## #511

Trained the model with more intents, testing how much I can push the model and
how long it takes to train from scratch.

## #510

I added in a threshold system for the NLP so that way if it isn't confident
enough in the guess then it will not post an answer. I also added a reverse
filter regex so I can filter out commands from being analyzed with AI to
conserve on API calls.

## #509

Finally added the ability to delete a message and checked in a change to the
@rampant/get to return the original key by default. I just started adding
multiple commands to start finding things that need to be worked on. It's a lot
of copy and pasting, and I want to make it easier in the future.

## #508

Got a Mixer whisper effect working as well as an equality filter so I can get a
command working properly.

## #505, #506, #507

My brain hurts. I tried to start just building intents and I'm already running
into a bunch of problems. Authentication based first and then merging two
sources and figuring out the end intent, I gotta re-structure my brain a bit to
make it work.

## #502, #503, #504

Add a full training cache system to the [**Wit.ai**](https://wit.ai/) plugin.
When processing intents it will take a samples property and populate both the
database training cache as well as training the NLP model with things that are
new. And then I changed the nlp extension to check the training cache first
before calling [**Wit.ai**](https://wit.ai/). This will save on API calls for
samples that we know are of the given intent.

## #501

I have officially completed the manual loading project system with the CLI. It
accepts arguments and everything. Now that I have that in place, my goal is to
start creating some intents like chat commands and what not to make sure my
system is actually working and prepare it to demo to people. I believe I will
want to work on the [**Wit.ai**](https://wit.ai/) training system so I can have
samples setup for my intents as well.

## #500

Wow the 500th session working in this monorepo. It feels good to be back to
working in this structured environment and I can't wait to continue to build
this out and improve it. Perhaps one day I'll actually convert this manual
worklog system into DEX... that would be awesome. Anyway, I'm nearly there with
the CLI system. I'm finding that some of the test intents are refusing to work
so I'll have to explore why this is a thing after this. But I setup the base
rampant system to dynamically accept a project ID so the test system passes it
in now and the cli passes in whatever project is passed as the parameter. Now
for a quick break before trying to solidify this loading system.

## #499

Started work on the individual launching of a project from the CLI. I setup
[**argv**](https://www.npmjs.com/package/argv) to parse CLI arguments strictly
and I'm working on setting up the data files that will be loaded for the
project. The plan is to load them directly into the database before starting
rampant up.

## #498

Cleaned up the basic Twitter plugin. Just simple changes like setting up
templating and what not. So I'm going to check this all in and switch my focus
over to getting the cli to load a project from JSON data files so I can start
working on my actual intents for my stream. This will give me something to demo
to partners.

## #496, #497

Setup a basic Twitter plugin with the ability to retweet something. Then got
sucked into trying to figure out how to get the Twitter access tokens in the
first place. I tested it with the current tokens I have for one account, but I
need to learn how to get those tokens in the first place. I still need to check
in the code, but I'm going to spend time exploring a new authentication system.

## #495

Spent a bit setting up Twitter and exploring the authentication system to
prepare to build it next.

## #494

Did a quick brainstorming session with some really cool ideas for the platform
like a roaming bot system as well as a partnered program for Rampant. This is
going to be HUGE.

## #492, #493

So I quickly threw together a natural language processing extension with
[**Wit.ai**](https://wit.ai/). Only took two sessions and it just works. I even
spammed the chat a little to check for response time and it seems to work
alright. I need to add in a reverse filter option so that I can ignore commands
and not try to analyze them to reduce requests. Next thing I need for NLP is
adding a database cache based on training. I'll need to add a whole new section
of a project to store training, and when we process an intent, we check to see
if it is in training, if it isn't then we train [**Wit.ai**](https://wit.ai/) to
handle it for that intent and store it in the database. Then when we analyze we
check the cache first to save on calls to the API. Lots of tickets to go make.

## #490, #491

Completed the auto complete plugin as well as moved some modules around for
[**Mixer**](https://mixer.com) and [**Firebase**](https://firebase.google.com/)
plugins. Auto-complete works well enough that I'm satisfied. I needed to add a
"intentProcessor" system that will prepare the searcher for autocompletion by
processing each intent's name and aliases.

## #489

Extracted the last of the plugin stuff into `core` and `firebase` plugins.
Everything seems to be still working as need be. Now that I have plugins working
I can put focus on the auto-complete system. I think I need to use plugins to
process intents so that way I can extract settings from intents to "prepare"
plugins for certain things. Like training the NLP or populating the autocomplete
searcher. Auto-complete is next on the list to do now.

## #488

Refactored the [**Mixer**](https://mixer.com) chat stuff into its own plugin
system. I plan on refactor it even further and re-organize things into their own
modules. But for now it works. One day I want to dynamically read the directory
to populate the effects, sources, and extensions. So that way I don't have to
add them to the plugin manually. Next thing to refactor is the
[**Firebase**](https://firebase.google.com/) stuff. And then extract the core
stuff that relies on nothing really. The plugin system went a lot smoother than
I expected. I'm excited about that.

## #487

I made the dynamic command system work using basic templating for the intent.
This allows me to create a parameter in the middle of the source stream and then
use that as a source for the command. I've tested it works. Next thing I want to
do is be able to auto-complete commands and have aliases. In order to do that I
need to setup a plugin system so that way I can host the auto-complete system as
a plugin and include an extensions that uses the searcher to spit out a result.
And the plugin will also be used during intent creation where it will be
populated by the name of the intent and re-created every time a new
intent/alias is added.

## #486

Started work on the dynamic intent system which starts by filtering what events
flow through the intent streams based on the name of the intent in the stream.
Right now this means I had add an intent field for every test intent. But I want
to simplify that in the future. The goal here is to have the command stream
dynamically set the intent based on the parsed out command. Gonna make a few
tickets to optimize things.

## #485

So I was able to clean everything up and commit small pieces of it here and
there. Now the source dependency system is working fine and we have a way to
merge multiple sources into one. This could be useful later and sets the stage
for other dependent types like combine or zip, etc. Next thing is to make
intents work dynamically and filter them to only run when the intent matches.
This sets up chat commands to work properly and then sets the stage for NLP for
smart processing.

## #484

Yesterday I made having sources have dependencies a thing and it worked. But I
didn't get it to the point where I could merge it and it was organized. I need
to refactor a bunch to make like extensions work better since "context" doesn't
really exist in the source part of the pipeline so the filter extension was not
working. So I made everything work as I wanted it too.

## #482, #483

Started bringing in the sortable sources and discovered a logic flaw in how I
handle extensions. Filter extensions expect a context object, but in sources
there is no context yet. So I think I have to re-think the payload system a bit
to make it work as I need to and for the extensions to be useful across the
board.

## #481

Started implementing the topological sort system to sources with a dependency
list. Also converted the source creation to a serial promise so dependencies are
created one at a time. In the future I may be able to optimize the system by
simultaneously creating the sources that don't have any dependencies. But for
now this will be good enough. Still need to create the source type for merging
dependencies in the proper way to create a source.

## #479, #480

Totally forgot to put this in yesterday. I spent some time exploring the
topological sorting algorithm in preparation for the dependency system for the
sources. I want to be able to setup a full command source as a simple example so
I can get chat commands working.

## #478

Finally got around to the refactor of the effect creator and I got filtering
working. I made the decision to make the entire intent system a bit more
intuitive and the same across the board so I changed `context` to be `$` to
match the templating system so it all makes more sense. Next thing I need to
work on is the source inheritance system and the intent system. Close to making
the chat commands work. Then after commands work with auto-complete I'll work on
natural language processing. If that all works then I'll start working on
Twitter integration. I'll need to work on the initial linking of accounts for
Mixer and Twitter and I'll probably need to resort to serverless functions.

## #477

Finished the refactor of the pipeline creator into an object system. Also added
the extensions to the source creator as I intended. But now I want to be able to
test filtering so I created a from source type so that I could test filtering.
But filtering isn't working as expected with the test so now I've gotta do some
exploring into why that is and make sure I make it work properly.

## #476

Started going through and refactoring small things like the intent stream
creator and the pipeline creator. The pipeline creator is going to become the
extension creator and I'm going to add the filter-regex in there. I need to add
a check for whether or not types exist in these object systems, but for now I'll
continue forward with what I have. I'll just make a ticket.

## #475

So in the shower this morning I was thinking about the source extension system
and realized that it is basically the same as the pipes system. So I want to
merge the two together. Before I do that I wanted to refactor the source creator
to use an object system with keys rather than an if statement system. This will
allow me to convert to a plugin system later which will be awesome. I need to
explore the pipes system in the intent engine and figure out the best way to
refactor that and make it useable between the source creator and the intent
creator. If I can convert the extension/pipes system to an object system as well
it will prepare me for creating a lot more of them in the future.

## #474

After designing this morning I came up with a basic approach to extensions for a
source. So I implemented a basic version that really needs to be refactored to
be supportable by all source types but it looks like it will ultimately work. I
tested a basic filter based on regex and it seems to work fine. This is going to
be important for implementing a command system.

## #472, #473

I'm into the next difficult part of the system which is extending sources with
additional capabilities like filtering. The goal of this is to create a command
stream so I can do basic chat commands on Mixer. If I can do that then I'll be
good to go for the basics. But also I want to be able to add natural language
processing using [**Wit.ai**](https://wit.ai/). Which would make a HUGE
difference in things. So hopefully this planning goes well. My brain kind of
hurts, but after 2 sessions I think I have a solid idea of where to start and
how to do these things.

## #471

Cleaned up the Mixer Chat effect as well as the Input source and committed
everything to the repo. Now I'm going to run a pull request and merge everything
in. The next big thing will be setting up an intent recognition system. As well
as being able to add extensions to sources so I can do things like add filters
or buffers, etc.

## #469, #470

Got most of the work done for setting up a Mixer Chat input source for intents.
In order to properly test it I also quickly through together a Mixer Chat
Message effect that would post to a channel. I realized that filling out all of
the necessary parameters for a chat message will be painful. So I'm thinking
that a set of project default params needs to exist as well as intent default
params so they can be merged. And it may be smart to have default values for
each of the properties so if `userId` is set as a default for the intent then I
don't need to include `userId` as the part of the message. My ultimate goal is
to have an effect of `{ message: { text: 'hello' } }` be enough for an effect.
Next thing to do is polish up the work I've done so I can check it in and then
start exploring what it will take to get an intent system in place.

## #467, #468

Converted the engine to use a pool of shared sources that are created. This is
prepratory work to allow for Mixer Chat to be added as a shared source with
settings outside of an intent. Now intents that look at the same database
document or use Mixer chat from the same channel results in only one shared
observable source to save on memory. This will ultimately be more efficient in
the end. Next part is to create base sources from project settings that get
created before intents are created.

## #466

Spent some time cleaning up the Mixer bot creation stuff. Adding some features
to it to be used later like chatting and whispering. Also may have figured out a
way to create a mod chatroom which will be SUPER useful moving forward. I've
also seen whispers be easily detectable in the chat as well which is awesome and
could be useful in the future. Next session should have me checking in the Mixer
Chat stuff and then working on the new sources pool system.

## #465

Extracted out the Mixer chat creation stuff to polish it a bit and make it work
as an object factory that creates bots for users. I also included a caching
system for it so multiple bots don't need to be instantiated for the same user.
Just need to clean up the code a bit and check it in. Then the next thing is to
figure out the sources pool system so I can setup Mixer chat as an input source
for intents.

## #463, #464

Got to do some polish work and planning for what needs to be done next for Mixer
Chat as an input source. I got a prototype of the code working which was much
smaller than I expected. The next thing that needs to happen is to re-organize
the intent engine to handle setting up a source pool, which will include Mixer.
I need to consider how the plugin system will work as I will need to look into
Twitter next. Still lots of organizing to do to make things work as I need them
too. But this will be the first bit of coding that will show the system just
working magically once everything is in place. After Mixer Chat I'll look into
customizing sources with pipeline modifications like filters for things like
commands or the Come @ Me giveaway system.

## #462

Well so far the rest client continues to work. I've organized it and cleaned up
the code a bit so it makes more sense and is easier to manage in the long term.
I've also created a caching system so a user's rest client isn't created more
than once and it can just be fetched when needed. Hopefully that works well
enough. I want to be able to get rid of the Mixer specific libraries and manage
my own rest client and chat client. But I won't be able to until I learn how to
connect raw to the websockets for chatting.

## #460, #461

Started exploring what it is going to take to get Mixer chat setup as an input
source. In order to do that I need to have the Mixer Rest client system setup as
well, which means the full auth system needs to be pulled over as well. Luckily
I solved most of that already in my old Rampant code, so now it's just a matter
of cleaning it up and making it work. So far things are going well.

## #459

Added reporting of an intent breaking so I can pick up on that in the future
when I'm working on intents. It was dumb that things would silently break in the
past and now it is far more obvious. I'm satisfied for now. Next thing to do is
try to set up things so all effects still complete even if another effect
breaks. Ideally an effect breaking doesn't crash the entire intent stream.

## #458

It's been 2 weeks since I've been able to code due to a kidney stone. But I'm
back into things. Just wrapping up some work on context upgrades and I need to
add some error reporting when an intent crashes. Also ideally if a single effect
crashes, other effects should still work in an intent stream. Just a lot of
minor polish that needs to happen. I also need to change the sources system so
we create a pool of sources first and then include sources in an intent stream
from the sources pool. So that way we can share sources if need be. Like when
multiple intents will be based on a Mixer chat stream.

## #457

Trying to explore a way to have working effects run, even if another effect
fails. I found a way to catch errors at least and report them. So that's a
positive. But if like a database effect fails, I don't want the log message to
fail. There's no reason the log message shouldn't work.

## #455, #456

Yesterday I was unable to code due to depression. But I'm back to things this
morning. I thought things would be super easy. But I found a couple minor
problems. So I'm working on the parsing feature of the context system so we can
convert strings to numbers and objects. But intents started dying silently. I
discovered that nothing is reported when a stream dies internally like an effect
or pipe just hits an error. So I need to fix that. Also discovered that the
database effect doesn't accept an object with each individual value substituted.
The basic parsing system is in place, but now I have bugs to work on before I
start moving forward. Which is a tad rough, but must be handled.

## #453, #454

Pipelines work with a proper templating system. Of course I got a security
vulnerability warning for using dot.js as it allows for arbitrary code
execution. I really want people to be able to have logic based templates, but I
don't want to expose sensitive data to intent creators like user access tokens,
environment variables, etc. I'll have to eventually do research into logic based
templating engines that have protections in place. For now I'm happy to have a
templating engine that works when I want it to. So for now I call it good. The
next thing that needs to be done is build a pipe for adding
[**Firebase**](https://firebase.google.com/) data to the context. After that
then I think it may be time to start exploring [**Mixer**](https://mixer.com)
extensions and when that happens then we need to start exploring the intent
system.

## #452

Got an initial setup for context pipelines working. Wasn't that bad. I also
added an additional test to make sure it was working properly. The next big step
is to add dot.js as a templating system for both the key and the value in static
pipes. This will be used to create things like composite messages of multiple
pieces of context data.

## #451

Well I tried to use pupa for doing microtemplating and realized what I needed
wasn't something that returned me a string, but something that returned me a
piece of an object. So I removed puma and went with
[**Lodash**](https://lodash.com/).get instead which allows me to access a part
of an object with dot notation. But I wanted it to look like templating so I
created a derivative that requires you surround the dot notation with curly
braces. Also yesterday in a spare few minutes I was able to solve my dot.js
problem and was able to create the javascript function that I used to combine
votes so now I know it is possible to work with. So I'm excited to finally start
adding the context pipeline system. I have a few tickets to make first.

## #449, #450

Screwing around with the possibilities of dot.js... I need to make sure I know
how people can build their own functions if they want to before moving forward.
I really want to figure this out.

## #448

Took some time to brainstorm some ideas for the stream including automatically
turning on post notifications on Twitter as well as a potential stream game in
the form of Cards Against Humanity.

## #445, #446, #447

Started working on the basic context system. I've got the system working for
subbing into a log effect, but I still need to do the work for the database
effect. I also got sucked into exploring what library to use to do proper string
templating where I can do calculations and stuff to do things like calculate
total votes or use conditionals or whatnot. Lots to explore and experiment with.

## #444

Took some quick time to add in the removal of an intent from the engine. Means
I'm able to remove intents mid stream which could be important. I still need to
write tests to verify that this happens all the time, but this is a good start
and I created a ticket to do that later. Next thing I need to do is the context
system. That's the next big scary part to do, but it really shouldn't be that
bad. Time for a quick break.

## #442, #443

Finally organized all the code for the testing engine and also added some pretty
logging and intents that made sense to have right now. Checked in all the new
modules that are needed to make it run and I'm satisfied for now with the
testing system. Next thing to start focusing on is the context system because
I've decided that before effects run, it must actually pull its data straight
from the context with no modifications or hard-coded strings. So I'll have to
change how the current effects run, but ultimately I think this will be safer
because I can build a full dry-run system in testing which will be SUPER nice to
have to verify things are working correctly. I may even be able to build a dry
run intent that will help me debug things live. Long break time. :D

## #440, #441

Created the work to remove an intent in addition to add an intent so there is a
cleanup system as well. Got stuck working on timing of creating and deleting
intents. Ended up creating a system where intents are run one after the other
for creation, then one after the other for deleting with a delay. Next goal is
to optimize everything for check-in and start planning out what intents test
what features and making the testing system a clean output.

## #439

Started work on a testing system for the intents. I want to be able to start the
Rampant engine and then add intents to the database then clean them up
afterwards. This way it will be faster to test new functionality in the future
and I don't have to mess with [**Firebase**](https://firebase.google.com/)'s UI
anymore which takes FOREVER to work with. So this will be good. I can create
data files and hopefully structure testing a bit in the future. But I started
the first sample of it for this session. Just not feeling coding right now so
I'm going to take a lunch break.

## #438

Created a [**Firebase**](https://firebase.google.com/) effect that allows
intents to set, update, or upsert data in the custom-db. Allowing me to create
things like voting things, storing settings for users, etc. Thinking about this
means that I'll probably want a custom user settings database for a particular
project that can be merged with user context for the entire app. So projects can
maintain their own user preferences. So perhaps a user effect that stores in a
different location from the custom-db. Next I may explore templating for
intents, or start looking into creating the intent testing system. Which will
definitely be needed and is now doable with the current @rampant/db extensions.

## #436, #437

Updated the intent engine to support database changes as an intent stream. Right
now it is based on a document specifically in a custom-db collection so that
projects can maintain their own custom documents for unique ideas like voting
and what not. This should work fine for now, if I think more is needed in the
future I'll add it. Next is to add the ability to update the custom-db
collection with data using an effect so I'll work on that next. And after that
I'll have the [**Firebase**](https://firebase.google.com/) functionality to
write an intent testing system so I don't have to spend a lot of time creating
intents in [**Firebase**](https://firebase.google.com/)'s UI which takes a
while.

## #435

Refactored the code and re-organized it into modules that are clean and easy to
work with moving forward. Then committed and merged the initial intent engine.
Now the goal is to focus on extending. Right now I'm going to work with
[**Firebase**](https://firebase.google.com/) related extensions like saving to
the database as an effect, or watching database data as a source, or pulling
from the database as context. I may have to write a templating system soon to be
able to fillout some details dynamically

## #434

Took a session to setup the project on Github for Rampant AI. Put in lots of
things like the kinds of effects I need, the source types I need, context stuff,
etc. So that way I can have a more calculated approach moving forward.

## #433

Quickly tied together a bunch of [**Firebase**](https://firebase.google.com/)
stuff so that I could test dynamically adding new intents and it seems to
workout neatly. Now I have to organize the code and prepare the code for
check-in because this is a big deal. I'll also start working on adding new
effects and sources so I can show the power of the dynamic intent system. This
is an exciting moment. :D

## #432

So I've added the translation of effects into actual effects. This will be
useful in the future, but for now it's just a simple example so I can wrap my
head around that portion. The biggest part of the intent engine is next which is
figuring out how to create new intents, remove old ones, and modify existing
ones. I have to write a system that handles these changes as they come in as if
coming from [**Firebase**](https://firebase.google.com/). I think I'll need to
track sources and stuff in the future for modifications, but right now I'm
concerned about just adding and removing intents. It made me think that I also
need historical data to detect what exactly is changing when modifying an
intent, but that's later also. Just trying to wrap my head around what all needs
to happen.

## #431

I have begun working on the intent engine. The goal is to be able to take a
stream of intents and create a processing engine that can detect intents from
various types of sources, like database changes, text from chat, or other
intents happening. I've just started tapping into merging basic sources
together, but now I have to like add an intent and context to it. Still lots to
do, but it's a start.

## #430

Finally merged in the vim changes that I made recently and I'm happy to be done
with that. Now I'm on to planning out the intent engine and how it will be
structured and what it needs to accomplish and things that I will need it to do.
I've started planning on Miro, previously RealtimeBoard, and so far things are
looking good. I may need to do one more planning session before being ready to
start diving into code.

## #425, #426, #427, #428, #429

Spent the past couple days working on my Vim configuration. I was first
inspired by doing all the twitter POC stuff and hated that I was missing a lot
of javascript essentials so I spent multiple sessions just setting up syntax
checking, prettier formatting, better status line, devicons, and many other
things like fuzzy file searching. Lots was implemented and I should be ready to
go now. I really like that I have my Vim config in this repo now. Allows me to
start putting ALL of my development work in this repo and keep the same level
of quality management for all my projects without setting up a new repo. Time
for a break, but I just need to merge all this work and then start planning for
an intent engine for my stream.

## #424

Tested Twitter retweeting and it seems to work fine. Started to do some
research into Oauth 3-legged approach for Twitter. Conveniently Twitter doesn't
require a refresh token. It is permanent access until explicitly revoked which
is kind of nice. I went back to do some research on how my database was
organized before as well as some other details like how the express server was
setup for accepting tokens and what not. This shouldn't be too bad so I'm
excited to get something working on that end. Now I need to sit down and do
some massive planning. Next big piece is to figure out the intent engine so
that it can be made to cover all my use cases.

## #423

Created an app and setup some basic Twitter client code to get some user
details. Next thing to do is to play with retweeting and liking tweets, even
creating or direct messaging tweets.

## #422

Was going to start playing with the Twitter API and spent the time reading the
Terms and Conditions instead and applying for a developer account. But I've
gone through that process now and next session should be me trying to do stuff
with an app... this is where things get exciting lol.

## #421

So I decided to merge all the current vim configuration stuff that I have
setup. Just so I have it done and I can move forward with some other work. I
want to start playing with Twitter's Oauth soon so that's the goal. I can
update my vim config whenever I need to since it is now part of my monorepo.

## #420

Just trying to get the essentials for Vim checked in resulted in my having to
update [**Yarn**](https://yarnpkg.com/), node,
[**Commitlint**](http://marionebl.github.io/commitlint/#/), and a couple other
things, but in the end it all worked out and I finally got the essentials
checked in. Now to continue working on improving them... bit by bit.

## #419

Totally forgot this log entry. But I came back for the second day in a row and
decided to setup Vim dot files in this project so I can version them and keep
everything I use in the same place. Got all the essentials in play and the next
few sessions will be focused around getting all my preferred plugins
re-installed and configured.

## #418

Skipped a day of working on getting back into steady development, but today I'm
back and I'm ready to go. I spent a pomodoro re-exploring my dev environment.
I've decided to get back to my old Vim and iTerm setup that I had a year ago. VS
Code proved to be fancy, but clunky for my work style. I always felt like I was
working against the editor to make ends meet, but iTerm and Vim navigation using
the full command line with Fish just feels right. Something I want to do is
re-tackle my dot-files for Vim because I'm getting random errors in a couple
plugins that I don't want to have moving forward. I want to clean that up so it
feels fresh and clean again. But I also want to store my dot-files in this
repository. I may just setup my dot-files in the root directory for now and
fiture out where to put it later just symlinking it. We shall see how that goes.
I'm very happy to be back to a raw Vim/iTerm setup though... it is so refreshing
and responsive in comparison.

## #417

Wow... it's been pretty much a year since I've seriously looked into this
project. I want to get back into it and I started by reviewing the readme and
reminding myself exactly what I was working on. I have a lot of work to do to
get back up to speed, but I think I can get back into things. Life has changed
quite a bit after a year, but this project of improving ability to develop
software by one person has always been my baby. I think I'm ready to come back
and raise it and re-build my coding skillset. So I may not come back to this
today. But just doing a single pomodoro session really helps. Good sleep needs
to be done in order for me to tackle this better considering I was dozing off a
bit. For now... this was just dipping my toe before coming back.

## #416

Spent this entire session just worrying about what my next steps are and
creating some new issues for refactoring sake. I have a lot of shared
functionality that I'm going to need and centralizing it all will be really
nice. I just thought of another one actually. Now to take a gaming break before
jumping into paid work.

## #415

Applied the plugin system to `kd prerelease` and it seemed to refactor alright.
I realized that I could bring it into the multi-package handling system which
would be great. But I will do that in the future I also really need to start a
new
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
scope for node so I can consolidate a lot of the plugin logic stuff that are
shared between node packages and cli tools. Next is to build the `fix` function
for
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
packages. Should be fun.

## #414

Started work on setting up `kd prerelease` to handle plugins since writing a
`package.json` or `readme.md` is not really a thing in
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
packages. Just a bunch of simple refactoring for now to bring `kd prerelease` up
to recent standards of things. I'll probably start the plugin portion next.

## #413

Started some more exploring. Tried to start playing with **Unreal.js**, but
ended up having to install an older version of Unreal (4.18 instead of 4.19) to
be able to use the plugin built-in to the editor. Hopefully it will work after
this install.

## #412

So this morning I was really wanting to get back into game development. And just
out of curiousity I decided to lookup a game engine that supported javascript.
Turns out someone made an **Unreal.js** plugin. Now I'm kind of excited. So
first thing I started a session on was booting up the Unreal Editor and
exploring. Kind of excited for the potential to build games in the future. :D

## #411

Finished up the
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
check function fairly simply, but forgot to update the `filter-packages` module
to properly pass the config to `publish-check`. But things are working now and
the changes are now published. It is amazing how fast I can put out new versions
of packages with this entire toolset. Loving it.

## #410

Implemented a quick plugin system into the `kd check` system. Wasn't too hard to
keep the working node packages. Now I'm working on the check system for
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
packages which shouldn't take too long. I'm just doing tests and what not now.
Next session for sure.

## #409

Add a `rootStructure` to the snowball next to the `rootManifest` which allowed
me to simplify a ton of logic in the `publish-check` which is really nice. I was
able to remove around 10-ish lines of code really easily and I'm super satisfied
with the results. It is sooo much simpler to read as well. I'm starting to
realize that Sindre's comment on "If you are using `new Promise` then there is
probably a better way". I'm also really looking forward to removing `try/catch`
from my code base. If I can design an eslint rule to remove instantiating a
`Promise` as well that would probably be good.

## #408

Another day of refactoring to go through and general cleanup of the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
setup. Started by merging a [**Snyk**](https://snyk.io/) PR with an update for
the [**Rollup**](https://rollupjs.org/) [**Vue.js**](https://vuejs.org/) plugin.
And then went through and changed the `baseConfig` to `rootManifest` to match
the nomenclature that I've decided to adopt. Next thing I'm probably going to do
is adjust the `root` part of the snowball to be similar to the `structures` used
for packages.

## #407

I ended up just continuing the session and attempting to cleanup and remove more
lines of code. I also ended up adding filtering for the `kd check` command,
which is also really nice. It was super easy with the newly exposed filters of
list command. Lots of super easy stuff and I was able to get down more lines of
code and reduce the number of warnings to 6 instead of 7 since `publish-check`
was one of the culprits for lines of code.

## #406

Finished removing all of the dependencies in the `check-package` system.
Removing the `try-catch` blocks made a MASSIVE difference in the line count as
well and the level of complexity in the function. It is much cleaner now and I'm
very satisfied with the results.

## #405

Another session of random refactors. I'm currently cleaning up the
`check-package` module to remove the need for the `try-catch` as well as
removing the use of `resolve` and what not now that I have the `manifests` and
`structures` system. Ended up removing another 13 lines of code. Going well so
far. Had to change the return as well and adjust snapshots, but minor detail.

## #404

Did some random cleaning up. Ended up removing 16 lines of code by exposing the
default package filters supported by the `kd ls` command. Which is super nice. I
think I want to setup a default filter function now so `command build` and other
commands can include a default filter if none are selected. Break time.

## #403

Started creating a bunch of issues now that we have the general plugin system
done. I should be able to consolidate a lot of logic into the snowball rather
than doing them for each individual command. I'm hoping I'll be able to reduce
the total code count by 200-ish lines of code as I'm at around 2200. I'd really
like to clean that up and remove as much as I can. I think I will be since I can
start extracting a ton of logic into shared packages. Another break before I
probably start a random refactor session.

## #402

Spent some time playing with [**Codepen**](https://codepen.io) to play with a
pure css Hex grid... I'd love to create a [**Vue.js**](https://vuejs.org/)
library strictly built around hexagon components. Would be a lot of fun
actually. I may have to do that some day when I get the
[**Vue.js**](https://vuejs.org/) portion of
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
working all the way through. Just wanted to do something a little fun for now to
get back into the grove of things for today.

## #401

That was awesome... so I merged in the changes to add the plugin system for
manifests and then added a proper manifest function to the
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
plugin which ended up working out quickly and well. As a result I also enabled
promise manifest functions making things soo much simpler. I'll probably extract
the manifest function into its own package because I want to be able to manage a
cache similer to the `package-details-js` package. Which I really need to
rename. I'm going to write a ticket for that now. lol... need to go through the
entire
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
repo and rethink how I'm naming everything and also think about extracting the
plugin functions into their own scope so they don't bloat the core. For now I
think I should take a break and then hit some paid work. :D Been a good and
quick morning.

## #400

WOOT SESSION 400!!! That's a lot of work... lol. 200-ish hours essentially. Well
this session I was just verifying and cleaning up the commits for the work I did
to enable the plugin system for the manifest stuff. Going to push it up, but I
have duplicate code that I need to address first. One of the things I'm not a
fan of with jsinspect is that I can't put inline directives to disable the
check. Lame... I'll address that next session and then merge the changes to see
if everything continues to work fine.

## #398, #399

Moving forward with the conversion of the package manifest system into the
plugin system. Got stuck and ended up breaking a bunch of things now that types
is also a part of the snowball and everything needs to be re-adjusted at the
bottom of the snowball. None of that probably makes sense, but it does to me.
I'm going to take a break though before I finish this refactoring.

## #397

To prepare for the full plugin system I need to determine a packages type which
I am now adding to the snowball. And now systems will be able to determine what
to run based on the type of a package. Quick break time.

## #395, #396

Finally back from Portland and back to working on this. I'm finishing up the
major refactor of changing the core dependency on the glob of `package` info.
Now just names, structures, and manifests are used across the board. But I'm
done for the night and tired. Didn't get much work on this, but now I'm able to
jump into the actual plugin system.

## #393, #394

Another batch of refactors to get the `kd ver` system working. Next is probably
the `kd publish` version which means I need to touch destination details and the
template. Then after that I need to tackle the `kd prerelease` command and that
should be enough and I'll make a massive PR to make sure I didn't miss anything
in the core pipeline. Back to paid work.

## #392

Finished up the refactor to make `kd build` work properly. And then when that
was done I spent time to make sure that I find the rest of the stuff that needs
to be updated to the new structures/manifests snowball. It ain't easy, but I'll
get there. It looks like I have 6 packages that need to be updated to match and
verify. Probably refactor work that will be finished hopefully by the end of
this coming weekend and then I can get back into the actual plugin system.

## #390, #391

I got the `kd build` command working it looks like, so so far so good. I still
need to address `kd ver` and `kd pub` and hope that things go well. Once those
have worked then the giant refactor is done and I can move forward and start
solidifying the plugin system a bit more by introducing a types part of the
snowball and then use that to determine what needs to run for what. Should be
interesting... lol. For now back to paid work.

## #386, #387, #388, #389

Lots of cleaning up of the deps command and making things work. Had to update
the tests, and then enabled package filtering for the deps command, and then
just ruined
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
and then explored how to make SFPs work with
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
and then nothing. But I'm now trying to plan out how to do `kd build` properly
with this new `structures` and `manifest` split as some packages require a
manifest before deciding if it belongs to a plugin or not. I think I have an
idea on how to approach this. Just gotta think about it. Time for paid work now
though. Bleh... if only this was my fulltime job. I could reach my ultimate goal
sooo much faster.

## #385

So I worked on cleaning up the `kd dep` command and it seems to be working
alright. I need to change the tests to match the new structure that is no longer
dependent on the `packages` part of the snowball. But slow progression. Tomorrow
should be much cleaner. I've gotta finish up `kd build` next followed by `kd ver` and `kd pub`... hopefully tomorrow will be quick and painless. Time for
paid work.

## #382, #383, #384

Slowly grinding through the refactor of splitting into manifests and structures
throughout the system. This will be important to make things work in their
current state then I can apply the plugins system to handle fetching manifests
for single file packages. It is slow and grueling, but worth it. I've got `kd ls` and `kd check` working properly. I need to still address the `kd deps` and
then `kd build`. Following that I need to handle `kd ver` and `kd publish`
hopefully things go smoothly this weekend so I can do it all properly. This also
coincidentally fixes a couple issues where I wanted to be able to do
`--json=structures.kli` in order to fetch specific details for specific
packages. Which is pretty cool. Getting there slowly, one more session today
before doing paid work.

## #380, #381

Spent time just cleaning up the refactor that I worked on yesterday for
`package-structures`. Also spent a ton of time exploring the code base to see
what is going to be needed to make `structures` a core part of the snowball
rather than a haphazard one squeezed in. It is one of the few commonalities
between all packages and then from there things will split off into plugin
valley. After refactoring those things, I'll then be in the path to refactor
dependencies onto the manifests rather than a packages object. Which will be
plugin based now. This approach may actually enable my ability to include other
languages much easier if they transpile into javascript... could be awesome.

## #379

I'm working on a slow refactor to split up the structure portions of the
packages and the manifests of the packages. I think I have the initial split
into separate packages working, I just need to double check the documentation
and then check it in. Next would be to have the package details portion decide
which manifest system to load by using the plugins. Lots of little refactors to
make this clean.

## #378

Alright I realized a big mistake that I made early in the project. I loaded all
of the details of a package into the exact same place and pulled up some of
those details into this monolithic package details object. So now I need to
refactor it massively to enable this plugin details. I'm changing my terminology
of a package's "config" to be a package's "manifest" instead. I am going to
split up the filesystem details like `srcDir` and `destDir` and `files` list to
its own portion of the snowball that just holds package `structures` and I'm
going to split that from the `version`, `bin`, `main` keys which will actually
be part of `manifests` instead. Refactoring this core object is going to be a
pain though, because I have no easy way to know what is dependent on those
except greping. I'm wondering if considering typescript may be an option for
these massive snowballs. It would help me with intellisense but also help me
figure out what parts of the project are dependent on what parts of the
snowball. If I use static typing on the snowballs only it would be HUGELY
helpful... so I should consider it. Or actually Flow might be better. I'll have
to investigate that.

Btw I'm in Seattle now and just squeezing in some spare work time. Very proud of
myself for stepping up while I'm on vacation. :D And still drinking my smart
waters as well since we have a full size kitchen with full size refridgerator
and dining table. lol... pretty awesome.

## #377

Started working on extracting out the first part of the plugin system which will
be how package details are loaded. I need to be able to extract front matter
from SFPs, and to do that it has to be part of the pluggable system. So just
some simple refactoring to make sure that I'll be able to enable that.

## #373, #374, #375, #376

Preparing myself for a full plugin system for
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
in order to do that I needed to better support configuration in
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
and so lots of work was put there to pass the plugins through there. Now that
plugins are going through the base config, all commands will get the plugins now
and I can start using that to extend the system and make it 100% plugin based.
:D Lots of fun to come. I don't know when I'll get more side project time since
I'm heading out to Seattle for the Halo World Championship, but I'm well
prepared for the next steps.

## #372

More random refactoring. Changed the exit command on
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
when it doesn't find a command. Added a build template as well. Not much, but
three more tickets are being closed now with this PR so that's awesome. :D

## #371

Just some simple refactoring. I add import ordering rules to start. Might have
to look into how to trigger and "internal" group so I can separate those from
externals.

## #366, #367, #368, #369, #370

Awesome! This morning I put focus on trying to fix the publishing pipeline with
all the changes I made recently. And it looks like everything is updated
properly now and I'm able to move forward. Now that I've optimized the build
pipeline to be faster to focus on only what needs to be built and what needs to
be published, I can now put my focus into working on publishing EVERY package in
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
to get this going properly I need to invest time in the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
plugin system and figure out how I plan on extending every part of it so I can
really have a full pluggable system. I've been hacking work for SFPs and it is
now time that I focus on making the system actually pluggable for various
different types of packages. I need to convert most of the functionality into
plugins now rather than hard-baked systems revolving around
[**NPM**](https://www.npmjs.com/). If I can do this properly then I'll be able
to easily include
[**Entyre**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/entyre)
SFPs as well as [**Vue.js**](https://vuejs.org/) sites, and
[**Firebase**](https://firebase.google.com/) functions. Lots of potential in the
future. :D

## #360, #361, #362, #363, #364, #365

Holy hell that was a lot of work, but I've made solid progress. I ended up
refactoring how the `kd ls` comamnd works and started centralizing filtering
logic into it and created a new package to handle filtering. It was a hassle and
took a lot of re-thinking, but so far so good. `kd build --changed` is now
properly supported and other commands should be able to easily adopt new filters
in the future when I want them. I did notice though on merge that it didn't
properly publish, so I need to look at the publish command to figure out exactly
what the problem is. I should be able to reduce the build times drastically
after I finish this portion and then I can start looking into properly
versioning and loading single file packages. Once I start doing that then I can
go through and start converting all of my packages. Actually I'll probably need
the [**ES Lint**](https://eslint.org/) plugin first. So I'll probably do that
after handling the versioning portion. We shall see. Time for paid work.

## #357, #358, #359

This morning I started tackling the problem of adding a `--changed` flag to the
`kd build` command. To do this I want other commands to have the same kind of
filtering capability so I'm exploring what is needed for that. One thing that I
realized would be needed is a cache for the `package-details` system, so that
way it can be called multiple times with few problems. I'm going to try to
adjust `kd ls` so that I can filter packages with that and then have every other
command use that to populate their `packages` key. Lots of little work, but this
refactor will be huge moving forward. Looking forward to how it opens up the
doors on other commands.

## #354, #355, #356

Spent three sessions just blowing through as many small tickets as possible. I
improve the readmes for both
[**KLI**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kli)
and
[**Kape**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kape)
and also added a bunch of [**ES Lint**](https://eslint.org/) rules to improve
the quality gate available. I also extracted the config into a [**Dev
XP**](https://github.com/RayBenefield/dev-xp/) [**ES
Lint**](https://eslint.org/) config package, That I'll publish eventually. Lots
done I think like nearly 10 tickets closed as well. Super awesome. :D

## #352, #353

Spent a couple sessions just cleaning out issues. Setting a lot of issues to be
resurrected for another time and just general refreshing my mind on what things
need to be addressed moving forward. I have to plan out my next steps and this
helped me get re-oriented again. I'm down to about 102 issues again and would
like to close out as many simple things as possible so I'm going to now just go
through and pick the easiest ones for simple task stuff. Hopefully it isn't too
bad, just gotta trudge through all the painful monotonous stuff. Just needs to
be done.

## #348, #349, #350, #351

Well I did it... supposedly. Single File Packages should now be a thing. I can
build with them, build them themselves, and things seem to work. I fixed the
dependency system to properly read markdown files. Changed the common plugins to
parse out markdown files. And cleaned up several things. Next is to convert some
of the internal packages to SFPs. Before I can publish them though I need to be
able to update front matter in addition to `package.json` files. I also need to
adjust the build system to support only changed packages as a flag or the build
process will get ridiculous. So still a lot of polishing, but 90% of the way
there. Gonna relax and play Halo the rest of the day for the most part.

## #346, #347

Alright so I'm very close to the
[**KI/KD**](https://github.com/RayBenefield/dev-xp/tree/master/src/node_modules/kikd)
plugin working properly. I'm missing a very big piece in that the dependency
checking system that defines the "externals" for a package cannot read an
`index.md` quite yet. So I have to update that first to support `index.md`s and
then it should compile fine. I manually tested a list of external dependencies
and it seemed to work. Also when this system works properly I also have to
re-write how post-build works since I will need it to use the baseConfig and
then overwrite it with the attributes found in the `index.md` which means I'll
probably have to adjust the portion that grabs the package config as well to
read the `index.md` properly. A lot of adjustments, but ultimately things should
work out great. I'm very very close though. And good to see my
[**Rollup**](https://rollupjs.org/) plugin is working neatly. :)

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
setup, it worked with `babel-node` as hoping after compiling with `bsb -make-world`. And then I `kd prerelease`d it and `kd build`'d it and then tested
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
accidentally infinite loop nested spawned processes and had to find `sudo killall node` lol... so now that I have that rudimentary experience now I can at
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
It was relatively smooth, but I realized that I would definitely like a `kd move` function to handle the refactoring of anything dependent on it. Now to
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
repo and it will grow quickly. Once any of the projects gain traction, the
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
sadness and lameness and it was erroring out. So **_sigh_**... I hope something
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

**_I FUCKING DID IT!!!!!_**
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
properly. Going to take some time to make a bunch of tickets after heading out
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
units before being integrated. As well for documents that don't show up in the
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
that is the real _Minimum Viable Product_ [**MVP**] here. Gonna go have some
breakfast now. :)

## #157, #158

I'm getting SOOO close to the core of the versioning system. Right now I'm
gather tags and parsing them for the repo. Then I'm going to use the latest
**_Changes_** tag in the form of `#<changeNumber>(PR-<prNumber>)` as the tag
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
non-side effect stuff. Was a simple fix of just being explicit with the
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
with itself. Which is awesome. So next thing is to start taking over the
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
computer over the holidays. Still lots to do, but things are really coming
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
characteristics to publish. This check will start by looking for a `readme`, a
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
shouldn't be too bad. Hopefully... it is time to get very familiar with
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
