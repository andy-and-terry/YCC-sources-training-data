# Remove consecutive duplicate characters with regsub.
regsub -all {(.)\1+} "aabbbcdd" {\1} out
puts $out
