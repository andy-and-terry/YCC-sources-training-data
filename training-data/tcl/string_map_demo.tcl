set template "Hello NAME, your balance is AMOUNT dollars."
set replacements {NAME "Ada" AMOUNT "150"}

set result [string map $replacements $template]
puts $result

set caesarMap {a b b c c d}
puts [string map $caesarMap "abc"]

set htmlEscape {< &lt; > &gt; & &amp;}
puts [string map $htmlEscape "if a < b && b > c"]
