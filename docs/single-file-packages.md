# Single File Packages

## Original Twitter Thread

> Alright here comes a large thread... I'm getting back into coding after
> VueConf finally. While there I had several realizations. Right now with the
> single person monorepo tool I'm building, I'm running into what I'm deeming
> "The Readme Problem". Every package needs a readme...

> And readmes take a lot of time. Even if I'm at 60+ packages in a single repo
> right now, making them publishable isn't exactly simple because even though I
> can flip a switch technically, I still need to fill out a readme for the
> package. This has been slowing me down a tad...

> Since the goal of this is to scale an entire company with a single person, I
> need to solve this. While at VueConf I remembered a concept dubbed Literate
> Programming (LP) by Donald Knuth. A primitive version of LP exists in node.js
> right now where a markdown (MD) file is used...

> Basically you can write a MD document, and intersperse code blocks throughout
> that are extracted into your final source file. Not full LP, but good enough.
> Similar to doc generation, but not really as the doc comes first, not last.
> That was piece #1 in my solution...

> So I wrote a quick plugin for KI/KD to support bundling markdown files using
> this form of LP. The next piece clicked the night before I left. MD files are
> used in static generation a lot and that has introduced a concept of "Front
> Matter", basically YAML metadata at the top...

> If I combine the "Front Matter" concept with LP in MD files then I'm able to
> essentially replicate a package.json file in the same file that is the Readme
> AND the source. This results in - wait for it - Single File Packages (SFP)
> like Single File Components (SFC) from Vue.js...

> SFCs are a powerful way in Vue to isolate a component and is a great
> demonstration of proper separation of concerns by domain and counters the
> wrong approach of separation of type (MVC, Backend/Frontend, etc.) which
> result in painful scaling and organization of projects...

> SFPs could result in a very similar effect in the monorepo space. LP concepts
> mixed with Single Responsibility splitting of packages will force thinking
> about packages in a different way around the API and usage of the package
> instead of just "a function"...

> This can have HUGE effects on the design of functions as a major component,
> especially when concepts like Functions as a Service exists. In addition this
> speeds up my development as now the readme is built WITH the source, not as an
> after thought...

> So now instead of each package folder in my monorepo having an index.js,
> package.json, and `http://readme.md , they will now have a single http://index.md` that has front matter for version, description, etc. and has
> source interspersed between the docs. BLAM!

> My focus for my KI/KD project will now attempt to focus on making this work to
> its fullest extent and from now on I'll be able to develop projects through
> LP. I've got a couple of pieces, but making them work seamless like with
> Babel, will be fun. AWAY!!!

## What is needed

To make this work well I need several different things. To start with it needs
to work seamlessly with [**Babel**](https://babeljs.io/), essentially the core
of javascript at this point. I want to make sure that it works with `babel-node`
so local execution is still simple and trivial. On top of that I need to build a
[**Rollup**](https://rollupjs.org/) plugin which will result in the splitting of
the front matter into a `package.json`, copying the whole file as the
`readme.md`, and extracting the code as the `index.js`.

The [**Babel**](https://babeljs.io/) plugin needs to allow the following:

* Importing as just the package-name like `import pkg from 'package-name'`
  should be smart enough to look for a single `readme.md` and attempt to parse
  that as the code for the package
* Incremental steps to pull this off:
  * Have an import statement load a `readme.md` instead of `index.js` if no
    `index.js` exists or `package.json` with a `main` property
  * Once imports are handled, then extract the javascript of the `readme.md`
    and set that as the AST that needs to be run through the rest of babel
