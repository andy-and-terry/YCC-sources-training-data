#!/usr/bin/awk -f
# Right-pads the first field to a fixed width with spaces, for aligned columns.
{
    field = $1
    pad = ""
    for (i = length(field); i < 10; i++) {
        pad = pad " "
    }
    print field pad "|", $2
}
