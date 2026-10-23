# TclOO mixins add behaviour from another class without inheritance.
oo::class create Loggable {
    variable log
    method note {msg} { lappend log $msg }
    method history {} {
        if {![info exists log]} { return {} }
        return $log
    }
}

oo::class create Account {
    variable balance
    constructor {} { set balance 0 }
    method deposit {n} {
        incr balance $n
        my note "deposit $n"
        return $balance
    }
}

# Mix Loggable into the Account class definition.
oo::define Account mixin Loggable

set acct [Account new]
$acct deposit 50
$acct deposit 25
puts [$acct history]

# Per-object mixin via oo::objdefine.
set other [Account new]
oo::objdefine $other method greet {} { return "hello from [self]" }
puts [string match "hello from ::oo::Obj*" [$other greet]]
puts [info class mixins Account]
