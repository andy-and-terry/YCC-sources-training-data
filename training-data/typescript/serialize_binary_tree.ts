interface BNode {
  val: number;
  left?: BNode;
  right?: BNode;
}

function serialize(root: BNode | undefined): string {
  const parts: string[] = [];
  const walk = (n: BNode | undefined): void => {
    if (!n) {
      parts.push("#");
      return;
    }
    parts.push(String(n.val));
    walk(n.left);
    walk(n.right);
  };
  walk(root);
  return parts.join(",");
}

function deserialize(data: string): BNode | undefined {
  const tokens = data.split(",");
  let pos = 0;
  const build = (): BNode | undefined => {
    const tok = tokens[pos++];
    if (tok === "#") return undefined;
    return { val: Number(tok), left: build(), right: build() };
  };
  return build();
}

const original: BNode = { val: 1, left: { val: 2 }, right: { val: 3, left: { val: 4 } } };
const text = serialize(original);
console.log(text);
console.log(serialize(deserialize(text)) === text);
