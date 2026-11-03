def countVowels(String s) {
    s.toLowerCase().findAll { it in ['a', 'e', 'i', 'o', 'u'] }.countBy { it }.sort()
}
println countVowels("Education is beautiful")
