function autoload-nvmrc --on-variable PWD
    set currentVersion (nvm version)
    set defaultVersion (nvm version default)

    if test -f .nvmrc
        and test -r .nvmrc
        nvm use
    else if test "$currentVersion" != "$defaultVersion"
        echo "Reverting to nvm default version"
        nvm use default
    end
end
