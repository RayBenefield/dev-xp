module.exports = {
    extends: ['airbnb', 'prettier'],
    plugins: ['react', 'jsx-a11y', 'import', 'prettier'],
    rules: {
        'no-plusplus': 'off',
        'no-continue': 'off',
        'no-param-reassign': 'off',
        'import/no-resolve': 'off',
        'no-mixed-operators': 'off',
        'import/no-extraneous-dependencies': 'off',
        indent: ['error', 4, { SwitchCase: 1 }],
        'arrow-parens': ['error', 'as-needed', { requireForBlockBody: false }],
        'prettier/prettier': [
            'error',
            {
                printWidth: 80,
                tabWidth: 4,
                useTabs: false,
                semi: true,
                singleQuote: true,
                trailingComma: 'all',
                bracketSpacing: true,
                arrowParens: 'avoid',
            },
        ],
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
