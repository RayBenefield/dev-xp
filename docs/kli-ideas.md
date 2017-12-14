# KLI Ideas


## Inception

Yesterday I was exploring how do I make the CLI tool for
[**KI/KD**](https://github.com/RayBenefield/kikd) much easier to use. I really
wanted a system that would automatically "generate" all of the potential aliases
that you could use for a single command. Like I should be able to do `kd b`, `kd
bu`, `kd bui`, etc. in order to run the build command. But I also don't want to
have to generate all of those every one of those manually. So I started doing
research and I remembered that I saw something that generated those aliases.
Well I couldn't find that, but I did find the `trie` search concept. It would
allow a search over a set of tokens to determine what command to use. And I
found just the repo to pull it off and played around in a sandbox to make sure
it was a viable idea and it totally is.


## Overview

**KLI** (based on **Kommand Line Interface**) will be a package that allows you
to define commands with aliases and then will parse out the `process.argv` for
you and determine what commands your users are trying to run. While this will be
very simple to begin with, we can improve how CLI tools are created as a whole.
[**Meow**](https://www.npmjs.com/package/meow) from **Sindre** is a great
reference for simple things that can be done to ease the development of CLI
tools. But we can do more than that with the right structure.


## Features

So I want to do at least what [**Meow**](https://github.com/sindresorhus/meow)
does. Which is:

 - Parses arguments
 - Converts flags to camelCase
 - Outputs version when --version
 - Outputs description and supplied help text when --help
 - Makes unhandled rejected promises fail loudly instead of the default silent fail
 - Sets the process title to the binary name defined in package.json

In addition I want to add:

 - Auto-complete commands if unique
     - `a` should resolve `add` if only `add` and `build` exist as commands
 - Suggest potential commands based on ambiguous command string
     - `a` given with `add` and `app` commands
 - Determine command wanted based on flags send
     - `add` selected if given `a` with a flag of `--dev` when another command
       of `app` exists that does not support that flag
 - Generate list of viable aliases
     - if `add` and `app` exist the aliases would be:
         - `ad`
         - `add`
         - `ap`
         - `app`
     - Ambiguous aliases are basically removed
 - Generate `BREAKING CHANGES` based on commands going from concrete to
   ambiguous
     - if we only have `add` then `a`, `ad`, and `add` works, but when we add
       `app` then `a` is now ambiguous and can't be determined automatically


## Configuration Structure

The main configuration will be the list of commands given, which will look like
so:

```js
{
    commands: [
        {
            name: 'list',
            aliases: ['ls'],
            run: () => {},
        },
        {
            name: 'build',
            aliases: ['distribution', 'generate'],
            run: () => {},
        },
        {
            name: 'remove',
            aliases: ['uninstall'],
            run: () => {},
        },
        {
            name: 'add',
            aliases: ['install'],
            run: () => {},
        },
        {
            name: 'publish'
            aliases: ['deploy'],
            run: () => {},
        }
    ]
}
```

The above commands will automatically be used to create a [**Trie
Search**](https://www.npmjs.com/package/trie-search) and the `name` and
`aliases` will be joined appropriately to match a structure that works. Then
when the run command is used, it will determine which one to run and then run
that command.  If it can't decide which one (like `d` is given which refers to
`deploy` and `distribute`) then it will run an
[**Inquirer**](https://www.npmjs.com/package/inquirer) prompt to help the user
decide.

In the future we will add flags as well and also generate a [**Trie
Search**](https://www.npmjs.com/package/trie-search) for each flag so a
shortflag can be used without being specified if it isn't ambiguous.
