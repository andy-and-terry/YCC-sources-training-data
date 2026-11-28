expr(V) --> term(T), expr_rest(T, V).
expr_rest(A, V) --> "+", term(T), { B is A + T }, expr_rest(B, V).
expr_rest(V, V) --> [].
term(N) --> digits(Ds), { Ds \= [], number_codes(N, Ds) }.
digits([D|T]) --> [D], { code_type(D, digit) }, digits(T).
digits([]) --> [].

:- phrase(expr(V), `12+30+4`), format("~w~n", [V]).
