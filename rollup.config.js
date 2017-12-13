import path from 'path';
import babel from 'rollup-plugin-babel';
import resolve from 'rollup-plugin-node-resolve';
import { minify } from 'uglify-es';
import uglify from 'rollup-plugin-uglify';
import filesize from 'rollup-plugin-filesize';
import executable from 'rollup-plugin-executable';
import pkg from './package.json';

const babelConfig = {
    babelrc: false,
    presets: [['env', { modules: false, targets: { node: '6' } }], 'stage-0'],
    plugins: ['external-helpers'],
    exclude: ['node_modules/**'],
};

export default [
    {
        input: 'src/node_modules/kikd/cli.js',
        external: [...Object.keys(pkg.dependencies), 'fs', 'path'],
        output: [
            {
                file: path.resolve('dist', pkg.bin.kd),
                format: 'cjs',
            },
        ],
        banner: '#!/usr/bin/env node',
        plugins: [
            resolve({
                customResolveOptions: {
                    moduleDirectory: 'src/node_modules',
                },
                preferBuiltins: true,
            }),
            babel(babelConfig),
            uglify({}, minify),
            executable(),
            filesize(),
        ],
    },
];
