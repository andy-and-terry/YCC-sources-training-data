type TrieNode() =
    member val Children = System.Collections.Generic.Dictionary<char, TrieNode>()
    member val IsEnd = false with get, set

let insert (root: TrieNode) (word: string) =
    let mutable node = root
    for c in word do
        if not (node.Children.ContainsKey c) then
            node.Children.[c] <- TrieNode()
        node <- node.Children.[c]
    node.IsEnd <- true

let contains (root: TrieNode) (word: string) =
    let mutable node = root
    let mutable found = true
    for c in word do
        if found then
            if node.Children.ContainsKey c then node <- node.Children.[c]
            else found <- false
    found && node.IsEnd

let trie = TrieNode()
insert trie "cat"
insert trie "car"
printfn "%b" (contains trie "cat")
printfn "%b" (contains trie "ca")
