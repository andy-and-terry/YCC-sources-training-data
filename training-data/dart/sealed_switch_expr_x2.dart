sealed class Expr {}
class Num extends Expr { final int n; Num(this.n); }
class Add extends Expr { final Expr l, r; Add(this.l, this.r); }

int eval(Expr e) => switch (e) {
      Num(n: var n) => n,
      Add(l: var l, r: var r) => eval(l) + eval(r),
    };

void main() => print(eval(Add(Num(2), Add(Num(3), Num(4)))));
