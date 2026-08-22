class TrieNode {
  constructor() {
    this.children = new Map();
    this.isWord = false;
  }
}

class Trie {
  constructor() {
    this.root = new TrieNode();
  }

  insert(word) {
    let node = this.root;
    for (const ch of word) {
      if (!node.children.has(ch)) node.children.set(ch, new TrieNode());
      node = node.children.get(ch);
    }
    node.isWord = true;
  }

  search(word) {
    const node = this.#find(word);
    return node !== null && node.isWord;
  }

  startsWith(prefix) {
    return this.#find(prefix) !== null;
  }

  #find(s) {
    let node = this.root;
    for (const ch of s) {
      if (!node.children.has(ch)) return null;
      node = node.children.get(ch);
    }
    return node;
  }
}

const trie = new Trie();
['cat', 'car', 'card', 'care'].forEach((w) => trie.insert(w));
console.log(trie.search('car'), trie.search('ca'), trie.startsWith('ca'));
module.exports = { Trie };
