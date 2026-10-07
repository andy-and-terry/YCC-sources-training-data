% Negation as failure (\+) and the if-then-else construct (Cond -> Then ;
% Else), Prolog's non-backtracking control-flow idiom.
even(N) :- 0 is N mod 2.

describe(N, Description) :-
    ( even(N)
    -> Description = even
    ;  Description = odd
    ).

not_a_member(X, List) :- \+ member(X, List).

:- describe(4, D), writeln(D).
:- describe(7, D), writeln(D).

:- ( not_a_member(5, [1, 2, 3])
   -> writeln('5 is not in the list')
   ;  writeln('5 is in the list')
   ).

:- ( not_a_member(2, [1, 2, 3])
   -> writeln('2 is not in the list')
   ;  writeln('2 is in the list')
   ).
