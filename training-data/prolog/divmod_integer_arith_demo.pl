% divmod/4 returns quotient and remainder (floor division) in one call
:- divmod(17, 5, Q, R), format("17 divmod 5 = ~w r ~w~n", [Q, R]).
:- divmod(-17, 5, Q, R), format("-17 divmod 5 = ~w r ~w~n", [Q, R]).

% compare the different integer division operators on negative values
show(A, B) :-
    X1 is A // B,
    X2 is A div B,
    X3 is A rem B,
    X4 is A mod B,
    format("~w, ~w: // ~w  div ~w  rem ~w  mod ~w~n", [A, B, X1, X2, X3, X4]).

:- show(17, 5).
:- show(-17, 5).
:- show(17, -5).

% nth_integer_root_and_remainder/4 and gcd/msb for number theory helpers
:- nth_integer_root_and_remainder(3, 100, Root, Rem),
   format("cube root of 100: ~w remainder ~w~n", [Root, Rem]).
:- X is gcd(84, 36), format("gcd: ~w~n", [X]).
:- X is msb(1000), format("msb(1000): ~w~n", [X]).
:- X is truncate(7.9), Y is ceiling(7.1), Z is cot(1.0), format("~w ~w ~w~n", [X, Y, Z]).

% convert seconds to h:m:s with chained divmod
hms(Total, H, M, S) :-
    divmod(Total, 3600, H, R1),
    divmod(R1, 60, M, S).
:- hms(7384, H, M, S), format("7384s = ~wh ~wm ~ws~n", [H, M, S]).
