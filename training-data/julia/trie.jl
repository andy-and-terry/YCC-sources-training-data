mutable struct TrieNode
    children::Dict{Char, TrieNode}
    is_end::Bool
    TrieNode() = new(Dict{Char, TrieNode}(), false)
end

function trie_insert!(root::TrieNode, word::String)
    node = root
    for c in word
        if !haskey(node.children, c)
            node.children[c] = TrieNode()
        end
        node = node.children[c]
    end
    node.is_end = true
end

function trie_contains(root::TrieNode, word::String)
    node = root
    for c in word
        if !haskey(node.children, c)
            return false
        end
        node = node.children[c]
    end
    return node.is_end
end

trie = TrieNode()
trie_insert!(trie, "cat")
trie_insert!(trie, "car")
println(trie_contains(trie, "cat"))
println(trie_contains(trie, "ca"))
