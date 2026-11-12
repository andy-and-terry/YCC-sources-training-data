:- initialization(main).
main :- append(X, [3], [1,2,3]), print(X), nl,
        ( member(2, [1,2,3]) -> writeln(yes) ; writeln(no) ),
        nth0(1, [a,b,c], E), writeln(E).
