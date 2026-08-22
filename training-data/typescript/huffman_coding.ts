class HuffmanNode {
  constructor(
    public char: string | null,
    public freq: number,
    public left: HuffmanNode | null = null,
    public right: HuffmanNode | null = null
  ) {}
}

function buildTree(text: string): HuffmanNode {
  const counts = new Map<string, number>();
  for (const ch of text) counts.set(ch, (counts.get(ch) ?? 0) + 1);
  let heap: HuffmanNode[] = [...counts.entries()].map(([ch, freq]) => new HuffmanNode(ch, freq));

  while (heap.length > 1) {
    heap.sort((a, b) => a.freq - b.freq);
    const a = heap.shift()!;
    const b = heap.shift()!;
    heap.push(new HuffmanNode(null, a.freq + b.freq, a, b));
  }
  return heap[0];
}

function buildCodes(node: HuffmanNode, prefix = '', codes: Record<string, string> = {}): Record<string, string> {
  if (node.char !== null) {
    codes[node.char] = prefix || '0';
    return codes;
  }
  buildCodes(node.left!, prefix + '0', codes);
  buildCodes(node.right!, prefix + '1', codes);
  return codes;
}

function encode(text: string): string {
  const codes = buildCodes(buildTree(text));
  return [...text].map((ch) => codes[ch]).join('');
}

console.log(encode('abracadabra'));
