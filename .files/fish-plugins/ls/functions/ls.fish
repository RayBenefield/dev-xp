function ls --description 'alias ls=exa'
    if command -v exa >/dev/null 2>&1
        exa  $argv;
    else
        command ls $argv;
    end
end
