// GoF Interpreter: represent grammar rules as an expression tree of
// objects that each know how to evaluate themselves against a context.
class NumberExpr {
  constructor(value) {
    this.value = value;
  }
  interpret(context) {
    return this.value;
  }
}

class VariableExpr {
  constructor(name) {
    this.name = name;
  }
  interpret(context) {
    if (!(this.name in context)) throw new Error(`undefined variable: ${this.name}`);
    return context[this.name];
  }
}

class AddExpr {
  constructor(left, right) {
    this.left = left;
    this.right = right;
  }
  interpret(context) {
    return this.left.interpret(context) + this.right.interpret(context);
  }
}

class MulExpr {
  constructor(left, right) {
    this.left = left;
    this.right = right;
  }
  interpret(context) {
    return this.left.interpret(context) * this.right.interpret(context);
  }
}

// Builds an expression tree for "(x + 3) * y"
const expr = new MulExpr(
  new AddExpr(new VariableExpr('x'), new NumberExpr(3)),
  new VariableExpr('y')
);

console.log(expr.interpret({ x: 2, y: 5 }));
console.log(expr.interpret({ x: 10, y: 2 }));

module.exports = { NumberExpr, VariableExpr, AddExpr, MulExpr };
