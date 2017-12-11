module.exports = {
    '*.js': [
        'prettier --with-node-modules --write',
        'eslint --fix --config ./dx/eslint.config.js',
        'git add',
    ],
};
