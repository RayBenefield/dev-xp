// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
    config: {
        // Choose either "stable" for receiving highly polished,
        // or "canary" for less polished but more frequent updates
        updateChannel: 'stable',

        // default font size in pixels for all tabs
        fontSize: 16,

        // font family with optional fallbacks
        fontFamily:
            '"SauceCodePro NF", "Source Code Pro", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#ccc',

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BLOCK',

        // set to true for blinking cursor
        cursorBlink: true,

        // color of the text
        foregroundColor: '#fff',

        // terminal background color
        backgroundColor: '#000',

        // custom css to embed in the main window
        css: `
      .term_wrapper {
        opacity: 0.4;
      } 

      .term_active .term_wrapper {
        opacity: 1.0;
        transition: opacity 0.12s ease-in-out;
        will-change: opacity;
      }
    `,

        // custom css to embed in the terminal window
        termCSS: '',

        // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
        // default: `false` on Linux, `true` on Windows (ignored on macOS)
        showHamburgerMenu: '',

        // set to `false` if you want to hide the minimize, maximize and close buttons
        // additionally, set to `'left'` if you want them on the left, like in Ubuntu
        // default: `true` on windows and Linux (ignored on macOS)
        showWindowControls: false,

        // custom padding (css format, i.e.: `top right bottom left`)
        padding: '2px 2px',

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#000000',
            red: '#c91b00',
            green: '#00c200',
            yellow: '#c7c400',
            blue: '#0225c7',
            magenta: '#c930c7',
            cyan: '#009db4',
            white: '#c7c7c7',
            lightBlack: '#676767',
            lightRed: '#ff6d67',
            lightGreen: '#5ff967',
            lightYellow: '#fffc67',
            lightBlue: '#6871ff',
            lightMagenta: '#ff77ff',
            lightCyan: '#5ffdff',
            lightWhite: '#ffffff',
        },

        // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
        // if left empty, your system's login shell will be used by default
        //
        // Windows
        // - Make sure to use a full path if the binary name doesn't work
        // - Remove `--login` in shellArgs
        //
        // Bash on Windows
        // - Example: `C:\\Windows\\System32\\bash.exe`
        //
        // Powershell on Windows
        // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
        shell: 'C:\\Windows\\System32\\bash.exe',

        // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
        // by default ['--login'] will be used
        shellArgs: ['--login'],

        // for environment variables
        env: {},

        // set to false for no bell
        bell: false,

        // if true, selected text will automatically be copied to the clipboard
        copyOnSelect: true,

        // if true, on right click selected text will be copied or pasted if no
        // selection is present (true by default on Windows)
        // quickEdit: true

        // URL to custom bell
        // bellSoundURL: 'http://example.com/bell.mp3',

        // for advanced config flags please refer to https://hyper.is/#cfg
        paneNavigation: {
            hotkeys: {
                navigation: {
                    up: 'ctrl+alt+k',
                    down: 'ctrl+alt+j',
                    left: 'ctrl+alt+h',
                    right: 'ctrl+alt+l',
                },
                maximize: 'ctrl+alt+f',
            },
            showIndicators: false,
        },
    },

    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: ['hyper-pane'],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],

    keymaps: {
        'pane:splitVertical': "ctrl+alt+'",
        'pane:splitHorizontal': 'ctrl+alt+n',
        'pane:close': 'ctrl+alt+w',
    },
}
