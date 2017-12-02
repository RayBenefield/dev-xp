module.exports = {
    rules: {
        'body-leading-blank': [1, 'always'],
        'footer-leading-blank': [1, 'always'],
        'header-max-length': [2, 'always', 72],
        'scope-case': [2, 'always', 'lower-case'],
        'scope-enum': [
            2,
            'always',
            [
                // Relates to the whole package
                'transmutation',
                // Parts of Transmutation
                'transmute',
                'extend',
                'if',
                'ifNo',
                'do',
                'switch',
                'extendEach',
                'doEach',
                'under',
                'catch',
                'isolate',
                // Developer Experience/Docs Scopes
                'worklog',
                'build',
                'version',
                'quality',
                'todo',
            ],
        ],
        'subject-case': [2, 'always', 'sentence-case'],
        'subject-empty': [2, 'never'],
        'subject-full-stop': [2, 'always', '.'],
        'type-case': [2, 'always', 'lower-case'],
        'type-empty': [2, 'never'],
        'type-enum': [
            2,
            'always',
            [
                'feat',
                'fix',
                'docs',
                'style',
                'refactor',
                'test',
                'dx',
            ],
        ],
    },
};
