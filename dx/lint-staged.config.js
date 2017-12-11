module.exports = {
    '*.js': [
        'prettier --write',
        'eslint --fix --config ./dx/eslint.config.js',
        'git add',
    ],
};
