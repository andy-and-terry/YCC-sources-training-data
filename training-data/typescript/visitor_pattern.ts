interface Visitor {
  visitNumber(node: Num): number;
  visitAdd(node: Add): number;
}

interface Expr {
  accept(visitor: Visitor): number;
}

class Num implements Expr {
  constructor(public value: number) {}
  accept(visitor: Visitor): number {
    return visitor.visitNumber(this);
  }
}

class Add implements Expr {
  constructor(public left: Expr, public right: Expr) {}
  accept(visitor: Visitor): number {
    return visitor.visitAdd(this);
  }
}

class EvalVisitor implements Visitor {
  visitNumber(node: Num): number {
    return node.value;
  }
  visitAdd(node: Add): number {
    return node.left.accept(this) + node.right.accept(this);
  }
}

const expr = new Add(new Num(1), new Add(new Num(2), new Num(3)));
console.log(expr.accept(new EvalVisitor()));
