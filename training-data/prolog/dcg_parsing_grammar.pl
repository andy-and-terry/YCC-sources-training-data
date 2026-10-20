:- use_module(library(dcg/basics)).

expr(V) --> term(T), expr_rest(T, V).
expr_rest(Acc, V) --> "+", !, term(T), { A1 is Acc + T }, expr_rest(A1, V).
expr_rest(Acc, V) --> "-", !, term(T), { A1 is Acc - T }, expr_rest(A1, V).
expr_rest(V, V) --> [].
term(V) --> factor(F), term_rest(F, V).
term_rest(Acc, V) --> "*", !, factor(F), { A1 is Acc * F }, term_rest(A1, V).
term_rest(V, V) --> [].
factor(V) --> integer(V).
factor(V) --> "(", expr(V), ")".

greeting --> [hello], name.
name --> [world].
name --> [prolog].

calc(S, V) :- string_codes(S, Cs), phrase(expr(V), Cs).

:- initialization(main).
main :-
    calc("2+3*4", A), calc("(2+3)*4", B), calc("10-4-3", C),
    format("~w ~w ~w~n", [A, B, C]),
    ( phrase(greeting, [hello, world]) -> writeln(yes) ; writeln(no) ),
    ( phrase(greeting, [bye, world]) -> writeln(yes) ; writeln(no) ).
