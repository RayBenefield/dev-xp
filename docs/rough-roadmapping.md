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

This means it passes the given checks by the certification.

---


## Checks

### Automated Changelog Generation

A changelog is automatically generated for every release that happens. In order
for this to be possible the project must meet implement the **Conventional
Changelog Standards** initially inspired by **Angular**.

https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines

Probably setup with [**Conventional
Changelog**](https://github.com/conventional-changelog/conventional-changelog)


### Commit Style Linting

**KI/KD** will have its own style for commits that is not exactly **Angular's**
style. Why? Because I think their Changelog can actually look better for human
consumption. Better **Developer Experience** can be achieved. To accomplish this
we will probably use something like
[**Commitlint**](https://github.com/marionebl/commitlint) in a githook.


### Git hooks setup

Git hooks ensure that developers have a rapid check system locally before it
gets to the CI/CD system. Git hooks will probably be setup with
[**Husky**](https://github.com/typicode/husky).


### Semantic Versioning with modification

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


## Rough Quick List

 - CONTRIBUTING Document
 - CODEOWNERS Document
 - Auto deploy to NPM
 - Bootstrapping of new project
 - independent versioning monorepo
 - Linting configuration
 - readme generation with badges
 - MIT License - bundling inclusions
 - git tag management including mono-repo
 - git issue labeling and management
 - Neighborly requirements for issues (otherwise probono listed)
 - security checking with snyk
 - size checking
 - bundling with roll-up including dependencies
 - babel env support
 - Has ISSUE_TEMPLATE
 - Has PULL_REQUEST_TEMPLATE
