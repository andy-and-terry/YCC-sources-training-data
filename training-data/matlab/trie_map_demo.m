function trie = trie_new()
    trie = struct('children', containers.Map(), 'is_end', false);
end

function trie = trie_insert(trie, word)
    node = trie;
    path = {};
    for i = 1:length(word)
        c = word(i);
        path{end+1} = c;
        if ~isKey(node.children, c)
            node.children(c) = trie_new();
        end
        node = node.children(c);
    end
    node.is_end = true;
end

trie = trie_new();
trie = trie_insert(trie, 'cat');
disp(trie.children.isKey('c'))
