expr(Tokens, Rest, Value) :- term(Tokens, Rest1, V1), expr_rest(Rest1, Rest, V1, Value).

expr_rest([+|T], Rest, Acc, Value) :- term(T, Rest1, V), NewAcc is Acc + V, expr_rest(Rest1, Rest, NewAcc, Value).
expr_rest([-|T], Rest, Acc, Value) :- term(T, Rest1, V), NewAcc is Acc - V, expr_rest(Rest1, Rest, NewAcc, Value).
expr_rest(Rest, Rest, Acc, Acc).

term(Tokens, Rest, Value) :- factor(Tokens, Rest1, V1), term_rest(Rest1, Rest, V1, Value).

term_rest([*|T], Rest, Acc, Value) :- factor(T, Rest1, V), NewAcc is Acc * V, term_rest(Rest1, Rest, NewAcc, Value).
term_rest(Rest, Rest, Acc, Acc).

factor([N|Rest], Rest, N) :- number(N).

evaluate(Tokens, Value) :- expr(Tokens, [], Value).

:- evaluate([3, +, 4, *, 2], V), writeln(V).
:- evaluate([10, -, 2, -, 3], V), writeln(V).
:- evaluate([2, *, 3, +, 4, *, 5], V), writeln(V).
