def normalize(String s) {
    return s.toLowerCase().replaceAll(' ', '').toCharArray().sort().join()
}

def isAnagram(String a, String b) {
    return normalize(a) == normalize(b)
}

println isAnagram("listen", "silent")
println isAnagram("hello", "world")
