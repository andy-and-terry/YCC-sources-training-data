class TrieNode {
  children = new Map<string, TrieNode>();
  word?: string;
}

/** Finds all dictionary words in a letter grid using a trie-guided DFS. */
export function findWords(board: string[][], words: string[]): string[] {
  const root = new TrieNode();
  for (const w of words) {
    let node = root;
    for (const ch of w) {
      if (!node.children.has(ch)) node.children.set(ch, new TrieNode());
      node = node.children.get(ch)!;
    }
    node.word = w;
  }
  const found = new Set<string>();
  const dfs = (r: number, c: number, parent: TrieNode): void => {
    const ch = board[r]?.[c];
    const node = ch !== undefined ? parent.children.get(ch) : undefined;
    if (!node) return;
    if (node.word) found.add(node.word);
    board[r][c] = "#";
    dfs(r + 1, c, node);
    dfs(r - 1, c, node);
    dfs(r, c + 1, node);
    dfs(r, c - 1, node);
    board[r][c] = ch!;
  };
  board.forEach((row, r) => row.forEach((_, c) => dfs(r, c, root)));
  return [...found].sort();
}

const board = ["oaan", "etae", "ihkr", "iflv"].map((s) => [...s]);
console.log(findWords(board, ["oath", "pea", "eat", "rain", "hike", "flik"]));
