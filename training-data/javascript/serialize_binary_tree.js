class Node {
  constructor(val, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

function serialize(node) {
  if (!node) return "#";
  return `${node.val},${serialize(node.left)},${serialize(node.right)}`;
}

function deserialize(text) {
  const tokens = text.split(",");
  const build = () => {
    const t = tokens.shift();
    if (t === "#") return null;
    return new Node(Number(t), build(), build());
  };
  return build();
}

const tree = new Node(1, new Node(2), new Node(3, new Node(4), null));
const s = serialize(tree);
console.log(s);
console.log(serialize(deserialize(s)) === s);
