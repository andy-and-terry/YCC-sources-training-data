% Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bouncy(N) :-
    number_codes(N, Cs),
    msort(Cs, Up), reverse(Up, Down),
    Cs \== Up, Cs \== Down.

main :-
    aggregate_all(count, (between(1, 999, N), bouncy(N)), C),
    writeln(C).

:- initialization((main, halt)).
