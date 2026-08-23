def isPalindrome(String s) {
    def normalized = s.toLowerCase().findAll { it.isLetterOrDigit() }.join()
    return normalized == normalized.reverse()
}

println isPalindrome("A man, a plan, a canal: Panama")
println isPalindrome("hello")
