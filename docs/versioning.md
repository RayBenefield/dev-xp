# Automated Versioning

Similar to [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog),
[**KI/KD**](https://github.com/RayBenefield/kikd) will automatically detect what
version of your packages will be next. The key difference is that this is done
not for a single package, but for multiple in a monorepo.
[**Lerna**](https://lernajs.io/) is the key tool that is being used right now,
built by the [**Babel**](https://babeljs.io/) team. While amazingly impressive
the versioning system heavily revolves around fixed versioning. There is support
for independent versioning, but it isn't a first class citizen.
[**KI/KD**](https://github.com/RayBenefield/kikd) will attempt to solve this.


## Versioning Style

The core source of whether or not a version needs to be updated is the `git
log`. If a project follows a particular style for commit messages, then that log
can be used to determine when to version. Versioning is based mostly on
[**Semantic Versioning**](https://semver.org/). The only difference is
development based versions are `0.0.*` instead of `0.*.*`. Which I think is
super important since many packages on NPM are at `0.1.0+` and still used in
production. Double zeros will caution devs to include the package initially
until it hits `0.1.0+`.


## Commit Style for Changes

The commit style is inspired by [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)
initially started by the [**Angular.js**](https://angularjs.org/) team. Commit
messages are made up of 4 major parts:

```
<type>(<scope>): <subject>

<body>
```

 - **type** - *The type of change that was made, this is a fixed enumeration of
   either:*
     - `fix` - A bug fix, usually accompanied by a test
     - `feat` - A new feature that does not break the current public API
     - `breaking` - A breaking change to the public API
     - `test` - Modifications or additions to testing for stability
     - `refactor` - No behaviour change; typically readability or simplification
     - `perf` - A refactor that is intended to improve performance
     - `version` - Releasing new packages to the wild
     - `docs` - Documentation for others to read
     - `dx` - A task that is done to improve Developer Experience
 - **scope** - *This is the package that the change affects*
 - **subject** - *A summary of the changes made*
 - **body** - *More detailed information on the change including metadata like:*
     - `[skip ci]` - Prevents the triggering CI systems
     - `{closes,fixes,etc.} #{##}` - Automatically modify a related issue

The **type**, **scope**, and **subject** parts make up the **header** of a
***Change***. A **header** may not be longer than 72 characters to improve the
**header's** appareance in various contexts like `git log --one-line`. The above
structure can be repeated as often as necessary to describe all of the
***Changes***. The below can be a full single commit message which includes
multiple ***Changes***.

```
breaking(*): Things don't work the same.

This is why they don't work the same and what is needed to adjust.

feat(*): Add cool new feature which caused the breaking change.

And this is how it broke it and why it is necessary.

docs(*): Add some cool docs for the above.

fix(*): Also accidentally fixed this bug thing.

Closes #123
```

Allowing multiple messages allows bigger commits that could not be split up
easily, but had multiple notable changes. And they can all be done from the
command line with `git` like so:

```
git commit -m 'fix(*): Thing.' -m 'Body of stuff.' -m 'Closes #123' -m 'docs(*): Documentation.'
```


### Differences from [**Conventional Changelog**](https://github.com/conventional-changelog/conventional-changelog)

 - Breaking changes in [**Conventional
   Changelog**](https://github.com/conventional-changelog/conventional-changelog)
are made in the **body**. A breaking change I feel isn't really a `feat` or a
`fix`. It is a specific **type** of change and should follow the **type** field.
If a `feat` or `fix` is included then it can be appended to the same commit
message. In addition, `BREAKING CHANGE` has the same effect as `fix` and `feat`
and should be follow the same structure.
 - Commit messages in the [**KI/KD**](https://github.com/RayBenefield/kikd)
   style are used to document ***Changes***, which is a very specific goal vs
just documenting a commit.
 - Scopes are pre-defined in [**KI/KD**](https://github.com/RayBenefield/kikd)
   based on the packages that are modified. Anything that is done outside of
`src/node_modules` is considered something that affects the repo and has a scope
of `*`. This more explicit approach will allow for some automation and
validation that changes are documented. It also removes some of the ambiguity
that comes with deciding the scope.
 - The **type** field is more explicit. [**Conventional
   Commits**](https://conventionalcommits.org/) allows for any types beyond
`fix`, `feat`, and `BREAKING CHANGE`.
 - While `chore` is optional, it stems from the
   [**Angular.js**](https://angularjs.org/) team. We've changed `chore` to be
`dx` instead, which stands for ***Developer Experience***. `chore` has a very
negative connotation and replacing it with something positive is very
beneficial. And also opens up a few more characters.
 - Also the style will be very particular in
   [**KI/KD**](https://github.com/RayBenefield/kikd). The **subject** must be a
full complete sentence with a capital letter and a full stop `.`. This pushes
devs to make their **subject** comprehensible. It also improves the look of `git
log --one-line` as well as the resulting generated changelog.


## Determining Version

The rules for how a package will be versioned are as follows:

 - Packages without a `version` field in their `package.json` will not be
   considered for versioning
 - Packages with a `version` set to `0.0.0` will increase their `patch` version
   as their initial public release and become `0.0.1` no matter what other
changes exist
 - Packages with a `version` less than `0.1.0` will increase their `patch`
   version if they or any of their dependencies are updated due to being still
in "development"
 - Packages with a `version` set to `0.1.0` will not increase their version if
   `v0.1.0` has not been released yet. This will happen the first time a package
is changed from a "development" version of `0.0.*` to `0.1.0`. Otherwise it will
follow the rest of the rules.
 - ***Changes*** in the PR that are parsed from all commits are used to
   determine the rest of the rules... any ***Changes*** that are **scoped** as
`*` will affect the versions of ***ALL*** packages:
     - Any ***Changes*** of **type** `breaking` will change the `major` version
       of every package designated by **scope**
     - Any remaining ***Changes*** of **type** `feat` will change the `minor`
       version of every package designated by **scope** that is not already
getting a `major` version update
     - Any final ***Changes*** of **type** `fix` will change the `patch` version
       of every package designated by **scope** that is not already getting a
`major` or `minor` version update
     - Any ***Changes*** of any other **type** will also trigger a `patch`
       version... this is to ensure the latest ***Changes*** are added to
[**NPM**](https://www.npmjs.com/)
 - Any package that depends on a another package that is getting a `patch`,
   `minor`, or `major` version update and is not affected by the ***Changes***
will get a `patch` update to reflect new code being included in the final
`dist/` as a side effect

It is important to realize when writing commit messages to document
***Changes*** to consider any packages that may suffer a `breaking` ***Change***
or may gain additional features from a `feat` ***Change***. These affected
packages should be included in the **scope** of said change, or they should get
their own ***Change*** entry in the commit message.


## Tagging

In addition to modifying the version of the package for publishing,
[**KI/KD**](https://github.com/RayBenefield/kikd) will also manage the tags in
`git`. Packages are tagged with their name and their version off of the
versioning commit. For example, `@kikd/find-packages` at version `0.3.4` would
be tagged as `@kikd/find-packages-v0.3.4`. [**Github**](https://github.com/)
will allow tags to be searchable by any portion of the tag so a search for
`package` will show that tag. In addition to tagging each package, every version
commit will also be tagged with the iteration of changed merges along with the
PR number. If 5 pull requests have been merged in previously and the next PR is
#23, the next tag would be `#6(PR-23)`. The beginning hashtag is for
[**Github**](https://github.com/)'s sorting system. They sort tags in reverse
natural order meaning that all tags that start with a `#` will show up first in
the list, making it easy to find the latest merged changes. Even scoped packages
that start with `@` will be after the tags with `#`.

When the ***Changes*** list is generated for the next PR, the most recent `#`
tag will be used to determine what ***Changes*** were made after the latest
releases. This will be applied for all previously published packages. However
new packages that are just released will gather all ***Changes*** for that
package's **scope** since the beginning of the repo in case any exist. This is
because a package may not be released to NPM, but may have existed and "rolled
up" into other packages, hence ***Changes*** may exist for them in the earliest
commits.


## Automation

The above rules allow for certain level of automation in the future. Because
***Changes*** are nearly directly tied to the files changed and in an
[**Alle**](https://github.com/boennemann/alle) style repo the directories of
those files can speak exactly to the package being modified, we can
automatically assume what **scopes** are needed for that commit. A commit
template can be provided based on those file changes that include pre-filled
**scopes**. The developer is then only responsible for re-ordering the
**headers** and filling in the **subject**, **type**, and **body** if necessary.

In addition tooling can be provided to validate the length of commit
**headers**. This is pseudo done in the
[**Commitizen**](https://github.com/commitizen/) repo has setup with
[**Conventional Commits**](https://conventionalcommits.org/), however it
involves a lot of prompts. The useful portion is the countdown to remaining
characters. However a list of selections for **type** would have been super
helpful.

Because we are able to detect the ***Changes*** we can automate the expected new
changelog/versions back to the PR from CI. This helps inform the maintainers
without having to dive too deeply and manually try to figure out the next set of
versions.


## Release Commit

Upon a PR merge, all packages will be versioned accordingly with their
`package.json`'s updated. Any generated changelogs will be created. All git tags
will be created (one for each package updated as well as the ***Change***
iteration tag). And a new commit will be created on CI and then pushed to the
main repo with a `[skip ci]` line to avoid an endless build loop.
