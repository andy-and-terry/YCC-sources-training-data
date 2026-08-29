my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).

my_reverse([], []).
my_reverse([H|T], R) :- my_reverse(T, RT), my_append(RT, [H], R).

:- my_append([1,2,3], [4,5], R), writeln(R).
:- my_reverse([1,2,3,4,5], R), writeln(R).
