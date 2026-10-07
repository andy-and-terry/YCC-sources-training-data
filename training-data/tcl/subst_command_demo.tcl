set name "World"
set n 3

puts [subst {Hello, $name!}]
puts [subst {n squared is [expr {$n * $n}]}]
puts [subst -nocommands {no commands: [expr 1+1] $name}]
puts [subst -novariables {no vars: $name [string toupper abc]}]
puts [subst -nobackslashes {tab\there $name}]
puts [subst {tab\there}]

set template {Dear $user, you owe $$amount.}
proc render {tpl vars} {
    dict for {k v} $vars {set $k $v}
    return [subst $tpl]
}
puts [render $template {user Ann amount 42}]

set cmd {puts "inside: $name"}
eval $cmd

set varname name
puts [set $varname]
puts [subst "\$$varname is [set $varname]"]

set expr_text {2 + 3 * 4}
puts "$expr_text = [expr $expr_text]"

array set colors {red #f00 green #0f0}
set which green
puts [subst {$which -> $colors($which)}]
puts "${name}ly"
puts "aéb"
puts {literal $name [no] \n}
puts "multi\nline"
