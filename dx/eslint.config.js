module.exports = {
    extends: ['airbnb', 'prettier'],
    plugins: ['react', 'jsx-a11y', 'import', 'prettier'],
    rules: {
        'prettier/prettier': 1,
        'import/no-extraneous-dependencies': 0,
        'import/no-resolve': 0,
        indent: ['error', 4, { SwitchCase: 1 }],
        'no-plusplus': 0,
        'no-mixed-operators': 0,
        'no-param-reassign': 0,
        'no-continue': 0,
        'max-lines': [
            'warn',
            {
                max: 50,
                skipBlankLines: true,
                skipComments: true,
            },
        ],
        'comma-dangle': [
            'error',
            {
                arrays: 'always-multiline',
                objects: 'always-multiline',
                imports: 'always-multiline',
                exports: 'always-multiline',
                functions: 'always-multiline',
            },
        ],
    },
};
