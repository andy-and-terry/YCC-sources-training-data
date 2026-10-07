namespace eval ::app {
    variable version "1.0"

    namespace eval ::app::util {
        proc double {x} {
            return [expr {$x * 2}]
        }
    }

    proc show_version {} {
        variable version
        puts "app version $version"
        puts [namespace current]
    }
}

puts [::app::util::double 21]
::app::show_version
puts [namespace children ::app]
puts [namespace parent ::app::util]
