% Generate-and-test with between/3: find right triangles with integer sides.
triple(Max, A, B, C) :-
    between(1, Max, A),
    between(A, Max, B),
    A2B2 is A * A + B * B,
    C is truncate(sqrt(A2B2)),
    C =< Max,
    C * C =:= A2B2.

coprime(A, B, C) :- gcd(A, B) =:= 1, gcd(B, C) =:= 1.

:- initialization(main).

main :-
    findall(A-B-C, triple(30, A, B, C), All),
    length(All, N),
    format("~w triples with sides up to 30~n", [N]),
    forall(member(A-B-C, All), format("  ~w^2 + ~w^2 = ~w^2~n", [A, B, C])),
    findall(A-B-C, (member(A-B-C, All), coprime(A, B, C)), Primitive),
    format("primitive: ~w~n", [Primitive]),
    aggregate_all(max(C), member(_-_-C, All), MaxC),
    format("largest hypotenuse: ~w~n", [MaxC]).
