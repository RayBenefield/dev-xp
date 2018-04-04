module.exports = {
    '*.js': [
        'prettier --with-node-modules --write --config ./dx/prettier.config.js',
        'eslint --fix --config ./dx/eslint.config.js',
        'git add',
    ],
}
