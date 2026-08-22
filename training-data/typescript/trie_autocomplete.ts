class TrieNode {
  children: Map<string, TrieNode> = new Map();
  isWord = false;
}

class Autocomplete {
  private root = new TrieNode();

  constructor(words: string[] = []) {
    for (const word of words) this.insert(word);
  }

  insert(word: string): void {
    let node = this.root;
    for (const ch of word) {
      if (!node.children.has(ch)) node.children.set(ch, new TrieNode());
      node = node.children.get(ch)!;
    }
    node.isWord = true;
  }

  suggestions(prefix: string): string[] {
    let node = this.root;
    for (const ch of prefix) {
      const next = node.children.get(ch);
      if (!next) return [];
      node = next;
    }

    const results: string[] = [];
    function collect(n: TrieNode, path: string): void {
      if (n.isWord) results.push(prefix + path);
      for (const [ch, child] of n.children) collect(child, path + ch);
    }
    collect(node, '');
    return results.sort();
  }
}

const ac = new Autocomplete(['cat', 'car', 'card', 'care', 'dog']);
console.log(ac.suggestions('ca'));
