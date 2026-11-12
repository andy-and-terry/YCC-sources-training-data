rev(L, R) :- rev(L, [], R).
rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).
len([], 0).
len([_|T], N) :- len(T, M), N is M + 1.
:- initialization(main).
main :- rev([1,2,3], R), writeln(R), len(R, N), writeln(N).
