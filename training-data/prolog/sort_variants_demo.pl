% sort/2 removes duplicates, msort/2 keeps them, sort/4 picks key and order,
% and keysort/2 is a stable sort on Key-Value pairs.
:- initialization(main).

main :-
    L = [c, a, b, a, d, c],
    sort(L, S1), writeln(sort(S1)),
    msort(L, S2), writeln(msort(S2)),
    sort(0, @>=, L, S3), writeln(desc_keep_duplicates(S3)),
    sort(0, @>, L, S4), writeln(desc_unique(S4)),
    Pairs = [3-c, 1-a, 2-b, 1-z],
    keysort(Pairs, S5), writeln(keysort(S5)),
    sort(1, @>=, Pairs, S6), writeln(by_key_desc(S6)),
    People = [person(ann, 31), person(bob, 25), person(cy, 31)],
    sort(2, @>=, People, S7), writeln(by_age_desc(S7)),
    predsort([O, A, B]>>(compare(O, A, B)), [3, 1, 2, 1], S8), writeln(predsort(S8)),
    list_to_set([a, b, a, c, b], Set), writeln(list_to_set(Set)),
    sort(0, @=<, [2, 1.0, a, "s", f(x), 1], Mixed), writeln(standard_order(Mixed)).
