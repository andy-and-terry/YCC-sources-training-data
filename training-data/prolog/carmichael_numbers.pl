% Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
pow_mod(_, 0, _, 1) :- !.
pow_mod(B, E, M, R) :-
    E2 is E // 2, pow_mod(B, E2, M, H),
    Sq is H * H mod M,
    ( E mod 2 =:= 1 -> R is Sq * B mod M ; R = Sq ).

prime(N) :- N > 1, \+ ( between(2, N, P), P * P =< N, N mod P =:= 0 ).

carmichael(N) :-
    \+ prime(N),
    N1 is N - 1,
    \+ ( between(2, N1, A), gcd(A, N) =:= 1, pow_mod(A, N1, N, R), R =\= 1 ).

main :-
    findall(N, (between(3, 2999, N), N mod 2 =:= 1, carmichael(N)), L),
    atomic_list_concat(L, ' ', A), writeln(A).

:- initialization((main, halt)).
