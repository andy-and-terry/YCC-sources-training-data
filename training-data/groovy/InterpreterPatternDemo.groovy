interface Expression {
    int interpret()
}

class Num implements Expression {
    int value
    Num(int value) { this.value = value }
    int interpret() { value }
}

class Add implements Expression {
    Expression left, right
    Add(Expression left, Expression right) { this.left = left; this.right = right }
    int interpret() { left.interpret() + right.interpret() }
}

class Subtract implements Expression {
    Expression left, right
    Subtract(Expression left, Expression right) { this.left = left; this.right = right }
    int interpret() { left.interpret() - right.interpret() }
}

// (5 + 3) - 2
def expr = new Subtract(new Add(new Num(5), new Num(3)), new Num(2))
println "result: ${expr.interpret()}"
