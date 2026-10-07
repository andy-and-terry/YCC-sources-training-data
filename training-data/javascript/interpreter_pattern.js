// Interpreter: model a tiny arithmetic grammar as a tree of expression
// objects, each of which knows how to evaluate itself against a context.
class NumberExpr {
  constructor(value) {
    this.value = value;
  }

  interpret() {
    return this.value;
  }
}

class VariableExpr {
  constructor(name) {
    this.name = name;
  }

  interpret(context) {
    if (!(this.name in context)) throw new Error(`unbound variable: ${this.name}`);
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

class MultiplyExpr {
  constructor(left, right) {
    this.left = left;
    this.right = right;
  }

  interpret(context) {
    return this.left.interpret(context) * this.right.interpret(context);
  }
}

// (x + 3) * y
const expression = new MultiplyExpr(
  new AddExpr(new VariableExpr('x'), new NumberExpr(3)),
  new VariableExpr('y'),
);

console.log(expression.interpret({ x: 2, y: 5 }));
console.log(expression.interpret({ x: 10, y: 1 }));

module.exports = { NumberExpr, VariableExpr, AddExpr, MultiplyExpr };
