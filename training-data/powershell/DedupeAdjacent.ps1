# Remove consecutive duplicate characters with a regex replace.
'aabbbcdd' -replace '(.)\1+', '$1'
