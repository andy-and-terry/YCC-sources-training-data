function* walk(node) {
  if (!node) return;
  yield* walk(node.left);
  yield node.value;
  yield* walk(node.right);
}

const tree = { value: 2, left: { value: 1 }, right: { value: 3 } };
console.log([...walk(tree)]);
