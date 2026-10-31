:- initialization(main).

self_describing(N) :-
    number_codes(N, Cs),
    length(Cs, Len),
    Last is Len - 1,
    forall(between(0, Last, I),
           ( nth0(I, Cs, C),
             Expected is C - 0'0,
             Target is 0'0 + I,
             include(==(Target), Cs, Matches),
             length(Matches, Expected) )).

main :-
    forall(member(N, [1210, 2020, 21200, 1211]),
           ( self_describing(N) -> format("~w true~n", [N]) ; format("~w false~n", [N]) )).
