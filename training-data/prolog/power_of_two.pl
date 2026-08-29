is_power_of_two(N) :-
    N > 0,
    X is N /\ (N - 1),
    X =:= 0.

:- (is_power_of_two(16) -> writeln(true) ; writeln(false)).
:- (is_power_of_two(18) -> writeln(true) ; writeln(false)).
