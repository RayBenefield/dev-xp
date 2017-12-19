# KLI Configuration

[**KLI**](https://github.com/RayBenefield/kikd/tree/master/src/node_modules/kli)
should be acting as a DX friendly CLI creator. This includes the ability to
handle command aliases, but also incorporating configuration super easily for
devs. Pushing a pattern of configuration by default will result in much more
powerful CLI tools. Most functionality in a library should be customizable and
this should come from the CLI first. So a main CLI tool should look something
like:

```js
import defaultFirstFunction from '@scope/function-name'

const cli = kli((config) => [
    {
        name: 'command',
        run: () => config.firstFunction(config.value),
    }
]);

const defaultConfigValue = 20;

cli.run(process.argv.slice(2), {
    firstFunction: defaultFirstFunction,
    value: defaultConfigValue,
});
```

This way any developer can configure any portion of the configuration including
the functionality using a config file like so:

```js
// overrides.config.js

module.exports = {
    firstFunction: () => console.log('Do this instead!'),
    value: 42,
};
```

I think we could go even further with
[**Transmutation**](https://github.com/RayBenefield/transmutation). This is only
configurable at a CLI level, but if we wanted to encourage a pattern of config
for **CLI** AND the **Library** then we can push for the following pattern:

```js
import defaultDependency from 'dependency'; // like `lodash.get` or something
import defaultFirstFunction from '@scope/function-name'
import defaultSecondFunction from '@scope/function-name'
import defaultThirdFunction from '@scope/function-name'

const cli = kli((config) => [
    {
        name: 'command',
        run: transmute()
			.extend(config.firstFunction(config))
			.extend(config.secondFunction(config))
			.then(config.thirdFunction(config)),
    }
]);

cli.run(process.argv.slice(2), {
    firstFunction: defaultFirstFunction,
    secondFunction: defaultSecondFunction,
    thirdFunction: defaultThirdFunction,
    dependency: defaultDependency,
});
```

This encourages a library that accepts a top level configuration where all
dependencies are injected in at the top level and any individual function that
is published that is used takes in the same dependencies. Synchronizing the
dependency use across the "namespace" is a powerful idea that can also make
library usage more intuitive because now all functions that use something like
`lodash.get` can all be replaced with some new dependency that fulfills the same
contract.

Inspiration for configuration should come from
[**Liftoff**](https://bocoup.com/blog/building-command-line-tools-in-node-with-liftoff).
