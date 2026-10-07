% Relational arithmetic helpers and common evaluable functions.
:- initialization(main).

main :-
    succ(3, X), succ(Y, 10),
    format("succ(3,X)=~w succ(Y,10)=~w~n", [X, Y]),
    plus(2, 3, P), plus(2, Q, 10), plus(R, 4, 9),
    format("plus: ~w ~w ~w~n", [P, Q, R]),
    ( catch(succ(_, 0), E, (print_message(silent, E), fail)) -> true ; writeln("succ(_, 0) has no solution") ),
    A is 17 mod 5, B is -17 mod 5, C is -17 rem 5, D is 17 // 5, F is -17 // 5, G is -17 div 5,
    format("mod=~w mod(-)=~w rem=~w //=~w //(-)=~w div(-)=~w~n", [A, B, C, D, F, G]),
    H is 2 ** 10, I is 2 ^ 100, J is 2 ** -1, K is 7 / 2, L is 8 / 2,
    format("~w ~w ~w ~w ~w~n", [H, I, J, K, L]),
    M is max(3, 7) + min(2, 9) + abs(-4) + sign(-8),
    N is truncate(3.7) + round(2.5) + ceiling(1.2) + floor(-1.2),
    format("~w ~w~n", [M, N]),
    O is gcd(84, 36), S is msb(1000), T is 5 xor 3, U is 1 << 5, V is \ 5,
    format("gcd=~w msb=~w xor=~w shl=~w not=~w~n", [O, S, T, U, V]),
    W is sqrt(2) * sqrt(2),
    ( W =:= 2 -> writeln("exactly 2") ; Diff is abs(W - 2), format("float error ~e~n", [Diff]) ),
    Z is cot(1.0) + atan2(1, 1) + pi + e,
    format("~4f~n", [Z]),
    Rand is random(10), ( between(0, 9, Rand) -> writeln("random in range") ; true ).
