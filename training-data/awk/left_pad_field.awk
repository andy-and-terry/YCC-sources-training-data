#!/usr/bin/awk -f
# Left-pads the first field to a fixed width of 6 characters with zeros.
{
    field = $1
    while (length(field) < 6) {
        field = "0" field
    }
    print field
}
