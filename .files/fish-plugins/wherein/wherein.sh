function wherein () {
    for i in $(find "$1" -type f 2> /dev/null);
    do
        if grep --color=auto -inI "$2" "$i" 2> /dev/null; then
            echo -e "\033[0;32mFound in: $i \033[0m\n";
        fi;
    done
}
