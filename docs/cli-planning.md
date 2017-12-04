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
 - **watch root (kd w)**: `k <right> | d <left> | SPACE <either> | w <left>`

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


## Cross project ependency management

***COMING SOON***


## Benefits over `lerna`

 - Automatically detect ***monorepo*** vs ***single project***
 - Easier to type CLI tool command
 - Wrapper over `yarn`/`npm` for managing dependencies
