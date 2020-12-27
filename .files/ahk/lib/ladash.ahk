; https://www.autohotkey.com/boards/viewtopic.php?p=109173#p109173
ArrayContains(haystack, needle)
{
    if !(IsObject(haystack)) || (haystack.Length() = 0)
        return 0
    for index, value in haystack
        if (value = needle)
            return index
    return 0
}

IndexOf(obj, item, case_sensitive:=false)
{
    for i, val in obj {
        if (case_sensitive ? (val == item) : (val = item))
            return i
    }
}

