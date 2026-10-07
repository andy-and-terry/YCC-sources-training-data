func groupAnagrams(_ words: [String]) -> [[String]] {
    var groups: [String: [String]] = [:]
    for word in words {
        let key = String(word.sorted())
        groups[key, default: []].append(word)
    }
    return Array(groups.values)
}

let words = ["eat", "tea", "tan", "ate", "nat", "bat"]
let groups = groupAnagrams(words)
for group in groups {
    print(group)
}
