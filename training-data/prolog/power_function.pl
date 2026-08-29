my_power(_, 0, 1) :- !.
my_power(Base, Exp, Result) :-
    Exp mod 2 =:= 0, !,
    Exp1 is Exp // 2,
    my_power(Base, Exp1, Half),
    Result is Half * Half.
my_power(Base, Exp, Result) :-
    Exp1 is Exp - 1,
    my_power(Base, Exp1, Sub),
    Result is Base * Sub.

:- my_power(2, 10, R), writeln(R).
:- my_power(3, 5, R), writeln(R).
