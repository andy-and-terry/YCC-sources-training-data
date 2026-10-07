% bagof/3 backtracks over each distinct binding of a free variable,
% giving a natural group-by; ^ existentially quantifies a variable so it
% no longer causes separate groups; unlike findall/3, bagof/3 fails
% outright when there are no solutions instead of returning [].
fruit(apple, red).
fruit(banana, yellow).
fruit(cherry, red).
fruit(grape, green).
fruit(lemon, yellow).

:- findall(Color-Fruits, bagof(Fruit, fruit(Fruit, Color), Fruits), Groups), writeln(Groups).

:- bagof(Fruit, Color^fruit(Fruit, Color), All), writeln(All).

:- ( bagof(X, fruit(X, purple), _) -> writeln(found) ; writeln(no_solutions) ).
:- findall(X, fruit(X, purple), Empty), writeln(Empty).
