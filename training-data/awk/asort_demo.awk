#!/usr/bin/awk -f
# Uses gawk's asort/asorti to sort array values and indices.
BEGIN {
    n = split("pear apple fig banana", fruit, " ")
    m = asort(fruit, sorted)
    for (i = 1; i <= m; i++) printf "%s ", sorted[i]
    print ""
    ages["carol"] = 31; ages["alice"] = 29; ages["bob"] = 40
    k = asorti(ages, names)
    for (i = 1; i <= k; i++) print names[i], ages[names[i]]
}
