trait Visitor {
    fn visit_number(&self, n: &Number) -> i32;
    fn visit_add(&self, a: &Add) -> i32;
}

trait Expr {
    fn accept(&self, visitor: &dyn Visitor) -> i32;
}

struct Number {
    value: i32,
}

impl Expr for Number {
    fn accept(&self, visitor: &dyn Visitor) -> i32 {
        visitor.visit_number(self)
    }
}

struct Add {
    left: Box<dyn Expr>,
    right: Box<dyn Expr>,
}

impl Expr for Add {
    fn accept(&self, visitor: &dyn Visitor) -> i32 {
        visitor.visit_add(self)
    }
}

struct EvalVisitor;

impl Visitor for EvalVisitor {
    fn visit_number(&self, n: &Number) -> i32 {
        n.value
    }
    fn visit_add(&self, a: &Add) -> i32 {
        a.left.accept(self) + a.right.accept(self)
    }
}

fn main() {
    let expr = Add {
        left: Box::new(Number { value: 1 }),
        right: Box::new(Add { left: Box::new(Number { value: 2 }), right: Box::new(Number { value: 3 }) }),
    };
    println!("{}", expr.accept(&EvalVisitor));
}
