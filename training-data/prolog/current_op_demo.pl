:- op(700, xfx, ===>).
:- op(200, xfy, **).

:- current_op(P, T, ===>), format("===> is ~w ~w~n", [P, T]).
:- current_op(P, T, mod), format("mod is ~w ~w~n", [P, T]).
:- current_op(P, yfx, +), format("+ has priority ~w~n", [P]).

rule(a ===> b).
rule(b ===> c).

:- forall(rule(X ===> Y), format("~w implies ~w~n", [X, Y])).
:- X = (a ===> b), X =.. L, writeln(L).
