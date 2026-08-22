class Num {
  constructor(value) {
    this.value = value;
  }
  accept(visitor) {
    return visitor.visitNumber(this);
  }
}

class Add {
  constructor(left, right) {
    this.left = left;
    this.right = right;
  }
  accept(visitor) {
    return visitor.visitAdd(this);
  }
}

class EvalVisitor {
  visitNumber(node) {
    return node.value;
  }
  visitAdd(node) {
    return node.left.accept(this) + node.right.accept(this);
  }
}

const expr = new Add(new Num(1), new Add(new Num(2), new Num(3)));
console.log(expr.accept(new EvalVisitor()));
module.exports = { Num, Add, EvalVisitor };
