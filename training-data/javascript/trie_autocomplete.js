class TrieNode {
  constructor() {
    this.children = new Map();
    this.isWord = false;
  }
}

class Autocomplete {
  constructor(words = []) {
    this.root = new TrieNode();
    for (const word of words) this.insert(word);
  }

  insert(word) {
    let node = this.root;
    for (const ch of word) {
      if (!node.children.has(ch)) node.children.set(ch, new TrieNode());
      node = node.children.get(ch);
    }
    node.isWord = true;
  }

  suggestions(prefix) {
    let node = this.root;
    for (const ch of prefix) {
      if (!node.children.has(ch)) return [];
      node = node.children.get(ch);
    }

    const results = [];
    function collect(n, path) {
      if (n.isWord) results.push(prefix + path);
      for (const [ch, child] of n.children) collect(child, path + ch);
    }
    collect(node, '');
    return results.sort();
  }
}

const ac = new Autocomplete(['cat', 'car', 'card', 'care', 'dog']);
console.log(ac.suggestions('ca'));
module.exports = { Autocomplete };
