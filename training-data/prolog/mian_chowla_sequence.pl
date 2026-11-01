% Greedy sequence whose pairwise sums are all distinct.
build(Seq, _, _, Seq) :- length(Seq, 8), !.
build(Seq, Sums, Cand, Result) :-
    append(Seq, [Cand], All),
    findall(S, (member(X, All), S is X + Cand), Fresh),
    sort(Fresh, Sorted),
    length(Fresh, L), length(Sorted, L),
    \+ (member(S, Fresh), memberchk(S, Sums)), !,
    append(Sums, Fresh, Sums1),
    C1 is Cand + 1,
    build(All, Sums1, C1, Result).
build(Seq, Sums, Cand, Result) :-
    C1 is Cand + 1,
    build(Seq, Sums, C1, Result).

main :-
    build([], [], 1, Seq),
    atomic_list_concat(Seq, ' ', Out),
    writeln(Out).

:- initialization(main).
