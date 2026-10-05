# string map performs all replacements in one pass, left to right.
set template {Hello {name}, you have {count} new messages.}
puts [string map {{{name}} Ada {{count}} 3} $template]

# Order matters when keys overlap: first matching key wins.
puts [string map {a 1 aa 2} "aaa"]
puts [string map {aa 2 a 1} "aaa"]

# Escape HTML special characters.
proc html_escape {s} {
    string map {& &amp; < &lt; > &gt; \" &quot;} $s
}
puts [html_escape {<a href="x">Tom & Jerry</a>}]

puts [string map -nocase {HELLO bye} "Hello hello"]
