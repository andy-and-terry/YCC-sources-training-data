% A DCG that both parses and evaluates arithmetic expressions with +, -, *
% and parentheses, using the hidden difference-list argument DCGs thread
% through automatically (contrast with expression_evaluator.pl's manual
% token-list recursion).
expr(V) --> term(V1), expr_rest(V1, V).

expr_rest(Acc, V) --> [+], term(V1), { Acc1 is Acc + V1 }, expr_rest(Acc1, V).
expr_rest(Acc, V) --> [-], term(V1), { Acc1 is Acc - V1 }, expr_rest(Acc1, V).
expr_rest(V, V) --> [].

term(V) --> factor(V1), term_rest(V1, V).

term_rest(Acc, V) --> [*], factor(V1), { Acc1 is Acc * V1 }, term_rest(Acc1, V).
term_rest(V, V) --> [].

factor(V) --> ['('], expr(V), [')'].
factor(V) --> [N], { number(N), V = N }.

evaluate(Tokens, Value) :- phrase(expr(Value), Tokens).

:- evaluate([3, +, 4, *, 2], V), writeln(V).
:- evaluate(['(', 3, +, 4, ')', *, 2], V), writeln(V).
:- evaluate([10, -, 2, -, 3], V), writeln(V).
