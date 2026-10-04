:- initialization(main).

main :-
    findall(X, member(X, [a, b, c]), All), writeln(All),
    ( memberchk(b, [a, b, c]) -> writeln(found) ; writeln(missing) ),
    findall(X-Y, (member(X, [1, 2]), member(Y, [a, b])), Pairs), writeln(Pairs),
    nth0(1, [x, y, z], E0), nth1(1, [x, y, z], E1), writeln(E0/E1),
    last([1, 2, 3], L), writeln(L).
