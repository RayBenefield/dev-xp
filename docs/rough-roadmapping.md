# Rough Roadmapping

This document is a place to spit out brainstorming ideas for how this project
will progress.

## Quick Goal

**KI/KD** is shooting to be a certification system for an open source project
that meets certain quality standards by implementing development experience
tools to improve a contributors experience and introduce a minimum quality bar
of project management.

---


## Display Certification

Projects that meet the **KI/KD** certification can display it prominently with
the **KI/KD** ceritifcation badge like so:

[![KI/KD Certified](https://img.shields.io/badge/KI%2FKD-Certified-blue.svg)](https://github.com/RayBenefield/kikd)

This means it passes the given checks by the most recent certification. If the
certification gets updated with new standards the badge will instead be changed
to the MAJOR/MINOR version that it meets (since PATCH's won't represent a
certification change):

[![KI/KD Certified](https://img.shields.io/badge/KI%2FKD-v0.1-blue.svg)](https://github.com/RayBenefield/kikd)

In addition there would be a "PRO" certification that goes beyond the **KI/KD**
certification and meets a more opinionated style (this would be like having a
worklog done in **DEX**).

[![KI/KD Certified](https://img.shields.io/badge/KI%2FKD-PRO-blue.svg)](https://github.com/RayBenefield/kikd)

---


## Automated Changelog Generation

A changelog is automatically generated for every release that happens. In order
for this to be possible the project must meet implement the **Conventional
Changelog Standards** initially inspired by **Angular**.

https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines

Probably setup with [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)

---


## Commit Style Linting

**KI/KD** will have its own style for commits that is not exactly **Angular's**
style. Why? Because I think their Changelog can actually look better for human
consumption. Better **Developer Experience** can be achieved. To accomplish this
we will probably use something like
[**Commitlint**](https://github.com/marionebl/commitlint) in a githook.


### Git hooks setup

Git hooks ensure that developers have a rapid check system locally before it
gets to the CI/CD system. Git hooks will probably be setup with
[**Husky**](https://github.com/typicode/husky).

---


## Semantic Versioning with modification

**Semantic Versioning** is required for the automated changelog system to work
properly as it designates when a feature is added, when a bug is fixed, or when
a breaking change is introduced. However the current spec of **Semantic
Versioning** doesn't properly promote rapid development. From
[**Semver.org**](https://semver.org/):

---

***4. Major version zero (0.y.z) is for initial development. Anything may change
at any time. The public API should not be considered stable.***

<details><summary><b>Related FAQ Questions</b></summary>

 > **How should I deal with revisions in the 0.y.z initial development phase?**

 > *The simplest thing to do is start your initial development release at 0.1.0 and
 > then increment the minor version for each subsequent release.*

 > **How do I know when to release 1.0.0?**

 > *If your software is being used in production, it should probably already be
 > 1.0.0. If you have a stable API on which users have come to depend, you should
 > be 1.0.0. If you’re worrying a lot about backwards compatibility, you should
 > probably already be 1.0.0.*


 > **Doesn’t this discourage rapid development and fast iteration?**

 > *Major version zero is all about rapid development. If you’re changing the API
 > every day you should either still be in version 0.y.z or on a separate
 > development branch working on the next major version.*
</details>

---


Most NPM packages are in the `0.x.y` phase however many are relied upon in
various environments. So instead I have one change. Instead of `0.y.z` initial
development is done at `0.0.z`. Anything with double `0`s should be considered
in initial development and release should happen at `0.1.0` instead.

---


## Relevant Github documents

There are several documents that Github is able to recognize that should be
filled in for each project:

 - **CONTRIBUTING** - [Users will see a link that says `Please review the
   guidelines for contributing to this
repository`](https://help.github.com/articles/setting-guidelines-for-repository-contributors/)
 - **CODE_OF_CONDUCT** - [It is solid practice to have a code of conduct for
   your
project](https://help.github.com/articles/adding-a-code-of-conduct-to-your-project/)
 - **SUPPORT** - [The contributing link will also include a support guidelines
   link in
issues](https://help.github.com/articles/adding-support-resources-to-your-project/)
 - **LICENSE** - [Github will highlight your **LICENSE** file in your repo
   root](https://help.github.com/articles/adding-a-license-to-a-repository/)
 - **CODEOWNERS** - [Github can block pull requests from merging if not reviewed
   by a Code Owner](https://help.github.com/articles/about-codeowners/)
 - **ISSUE_TEMPLATE** - [Github will prefill issues with this template for
   you](https://help.github.com/articles/creating-an-issue-template-for-your-repository/)
 - **PULL_REQUEST_TEMPLATE** - [Github will prefill pull requests for
   you](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/)

---


## Auto publishing to NPM

We are assuming that developers are using **Travis** for CI as it is free to use
for open source. So the appropriate settings should be in place to automatically
publish to NPM on each `master` update (or `develop` branch update).

---


## Boostrap a new project

We should be able to ***EASILY*** spin up a **KI/KD** certified project using a
project generation tool (perhaps Slush/Gulp early on). This will take parameters
on the project as well as install all dependencies and assist in adding tokens
like a Github and NPM token to be used in build processes and what not. There
should be an option for adding **PRO** certification features.

---


## Monorepo management

We should assume that an open source project could get big enough to be managed
as a monorepo. There should be tools that assist in converting to a monorepo as
well as maintaining dependency management and versioning and publishing for a
monorepo. While `lerna` does do this, its independent mode does not seem to be
flexible enough to make this work well. It is very "fixed" versioning centric
where all packages are on the same version. By default we assume that each
package has its own version. I was also thinking that it should be fairly easy
to determine what packages are in the repo based on `package.json` files that
exist in the repo.

---


## Linting Standards

Linting/Style guides are such a powerful tool and standardize the way you write
code across all repos would be really nice. Having `eslint` setup is the only
real requirement that will be needed here. The particular style might just be a
**PRO** certification type thing. I personally prefer 4 spaces vs the typical 2
in the javascript community. Perhaps I should look into editorconfig? Not sure
yet... anyway, I am also a HUGE fan of the [**Airbnb style
guide**](https://github.com/airbnb/javascript) as it is fully ES6 aware.

---


## Badges galore

Something about readme badges really make a project feel more "official", that
psychological aspect of it alone should encourage developers to have them. There
is a [**Badges**](https://www.npmjs.com/package/badges) package that handles
that generation and a bunch of standard ones really well and I might end up
using something like that.

---


## Readme/Markdown Generation

Readme's have a LOT of information in them and a lot of more standardized
sections are showing up everywhere in projects. There is actually an interesting
project that tries to handle all of the meta files in your project called
[**Projectz**](https://github.com/bevry/projectz). It looks interesting, but
without a plugin system for Readme generation it just doesn't feel like it is
powerful/flexible enough to meet the needs that would be needed. Something to
look at in the future.

---


## Rough Quick List

 - MIT License - bundling inclusions
 - git tag management including mono-repo
 - git issue labeling and management
 - Neighborly requirements for issues (otherwise probono listed)
 - security checking with snyk
 - size checking
 - bundling with roll-up including dependencies
 - babel env support
