function wherein
    set LINK (status -f)
    set FILE (file -b $LINK | string replace 'symbolic link to ' '')
    set DIR (dirname $FILE)
    bass source $DIR/wherein.sh --no-use ';' wherein $argv
end
