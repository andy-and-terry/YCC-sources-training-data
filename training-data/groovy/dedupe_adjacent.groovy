// Remove consecutive duplicates via a regex.
println "aabbbcdd".replaceAll(/(.)\1+/, '$1')
