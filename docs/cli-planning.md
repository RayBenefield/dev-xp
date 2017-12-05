# CLI Planning

The CLI should be your go to for project setup and management as a whole. It
should be able to bootstrap a project, add a dependency, manually push a
release, manually tag things, manually check things, etc. It should be just as
easy to manually use it as it is to add it to an npm script for automation.


## Configuration file

The configuration file should be automatically settable by a flag so it can be
stored wherever we want it to be. By default we look for the following root
level files:

 - **./dx/kikd.config.js**
     - *This one is where we will expect it since storing all config files in
       the same place is one of the certification goals of kikd.*
 - **kikd.config.js**
 - **.kikdrc.js**
 - **.kikdrc.json**
 - **.kikdrc.yml**


## Easy of typing use

So while the CLI tool could be `kikd` instead I'm going to make it `kd`. It is
SUPER easy to type since it is typed with two separate hands and they are both
done with your middle finger. This will improve the developer experience subtly
and speed up developers slightly. In addition, a lot of the commands that I
would want start with a vowel on the right hand, so the patterns would be:

 - **initialize project (kd)**: `k <right> | d <left>`
 - **initialize project (kd in)**: `k <right> | d <left> | SPACE <either> | i <right> | n <right>`
 - **install dependency (kd i)**: `k <right> | d <left> | SPACE <either> | i <right>`
 - **install dev dependency (kd id)**: `k <right> | d <left> | SPACE <either> | i <right> | d <left>`
 - **upgrade dependency (kd u)**: `k <right> | d <left> | SPACE <either> | u <right>`
 - **upgrade dev dependency (kd ud)**: `k <right> | d <left> | SPACE <either> | u <right> | d <left>`
 - **remove dependency (kd r)**: `k <right> | d <left> | SPACE <either> | r <left>`
 - **remove dev dependency (kd r)**: `k <right> | d <left> | SPACE <either> | r <left> | d <left>`
 - **prepare publish projects (kd p)**: `k <right> | d <left> | SPACE <either> | p <right>`

Removing a dependency is a tad more weighted, but since that is done less often
and should be done with caution, that is fine. Also initializing a project also
takes a bit more weight, but it is done rarely. The default action `kd` of the CLI
tool will be to check certification requirements and report on project details.


## Auto-detect single project or monorepo

When deciding on what to publish and what shouldn't be published we don't need a
config file to determine what projects are where. The base assumption is that if
a directory has a `package.json` then we will publish that directory as a
project itself. We can grab the `version`, the `name`, and the `dir` from that
search and use it to determine everything else. We should never have to
configure **KI/KD** to be aware of that by default. We should be able to exclude
projects, but there is no reason to have to point to where the packages are or
force a particular repository structure.

If there is only one `package.json` in the entire repo it will consider the repo
a single project repo and git tagging will be based on a normal `v0.0.0`
semantic version based on the single `package.json`.

If there are two or more `package.json` files in the entire repo it will assume
we are working with a **monorepo**, the `package.json` file in the root directory of
the repo will be used exclusively for **dev-dependencies** and any
**dev-dependency** binaries will be symlinked to all other projects.

If we are working with a **monorepo**, we will handle versioning a tad
differently. If all projects are scoped, their project name minus the scope will
be used as a prefix for the git tag. So for project `@kikd/cli` the git tag will
be `cli-v.0.0.0`. If one of the projects is not scoped, it will associate with
tags without a prefix `v0.0.0` no matter what the name. If there are multiple
projects without a scope then tags will be prefixed with the project name so
`kikd` and `other-project` will be `kikd-v0.0.0` and `other-project-v0.0.0`
respectively.


## Cross project dependency management

**KI/KD** will manage your cross project dependencies for you and be context
aware of where you are in your directory structure. This is how it should handle
the various commands:

 - If you just `install/update/delete` a normal app dependency, it will find the
   closest upwards `package.json` and handle it on that project. And ensure that
all of the symlink'd dev-dependency binaries from the root remain in the
`node_modules/.bin` folder.
 - If you `install/update/delete` a dev-dependency, it will find the root
   `package.json` and handle it on that, and then symlink new
`node_modules/.bin` binaries to each project's `node_modules/.bin` folder.


## Benefits over `lerna`

 - Automatically detect ***monorepo*** vs ***single project***
 - Easier to type CLI tool command
 - Wrapper over `yarn`/`npm` for managing dependencies
 - Context aware no matter what directory you are in
