# zlib checksums and compression (Tcl 8.6+)
set text "The quick brown fox jumps over the lazy dog"

puts "crc32:   [format %08x [zlib crc32 $text]]"
puts "adler32: [format %08x [zlib adler32 $text]]"

# Incremental checksum: feed the previous value back in
set crc [zlib crc32 "The quick brown fox "]
set crc [zlib crc32 "jumps over the lazy dog" $crc]
puts "chunked: [format %08x $crc]"

# Compress and decompress a repetitive string
set data [string repeat "abcabcabc" 50]
set packed [zlib compress $data]
set restored [zlib decompress $packed]
puts "original: [string length $data] bytes"
puts "packed:   [expr {[string length $packed] < [string length $data]}] (smaller)"
puts "roundtrip ok: [expr {$restored eq $data}]"

# gzip format via zlib gzip / gunzip
set gz [zlib gzip $text]
puts "gunzip: [zlib gunzip $gz]"
