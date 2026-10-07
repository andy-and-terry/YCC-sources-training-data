oo::class create Animal {
    variable name

    constructor {n} {
        set name $n
    }

    method speak {} {
        return "$name makes a sound"
    }

    method describe {} {
        return "I am $name"
    }
}

oo::class create Dog {
    superclass Animal

    method speak {} {
        set base [next]
        return "$base, specifically a bark"
    }
}

oo::class create Cat {
    superclass Animal

    method speak {} {
        return "[my describe] and says meow"
    }
}

set animals [list [Dog new "Rex"] [Cat new "Milo"]]

foreach a $animals {
    puts [$a speak]
}

foreach a $animals {
    $a destroy
}
