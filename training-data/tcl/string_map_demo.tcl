set s "the cat sat on the mat"

puts [string map {cat dog mat rug} $s]
puts [string map -nocase {THE a} $s]

proc escape_html {text} {
    string map {& &amp; < &lt; > &gt; \" &quot;} $text
}
puts [escape_html "<a href=\"x\">fish & chips</a>"]

puts [string toupper $s 0 2]
puts [string totitle "hello world"]
puts [string repeat "ab" 3]
puts [string reverse "stressed"]
puts [string first "at" $s]
puts [string last "at" $s]
