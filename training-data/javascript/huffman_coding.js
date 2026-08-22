class Node {
  constructor(char, freq, left = null, right = null) {
    this.char = char;
    this.freq = freq;
    this.left = left;
    this.right = right;
  }
}

function buildTree(text) {
  const counts = new Map();
  for (const ch of text) counts.set(ch, (counts.get(ch) || 0) + 1);
  let heap = [...counts.entries()].map(([ch, freq]) => new Node(ch, freq));

  while (heap.length > 1) {
    heap.sort((a, b) => a.freq - b.freq);
    const a = heap.shift();
    const b = heap.shift();
    heap.push(new Node(null, a.freq + b.freq, a, b));
  }
  return heap[0];
}

function buildCodes(node, prefix = '', codes = {}) {
  if (node.char !== null) {
    codes[node.char] = prefix || '0';
    return codes;
  }
  buildCodes(node.left, prefix + '0', codes);
  buildCodes(node.right, prefix + '1', codes);
  return codes;
}

function encode(text) {
  const codes = buildCodes(buildTree(text));
  return [...text].map((ch) => codes[ch]).join('');
}

console.log(encode('abracadabra'));
module.exports = { encode };
