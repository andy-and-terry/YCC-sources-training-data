:- list_to_set([a, b, a, c, b, d], Set), writeln(Set).
:- sort([c, a, b, a], Sorted), writeln(Sorted).
:- sort(0, @>=, [3, 1, 3, 2], Desc), writeln(Desc).

% list_to_set keeps first occurrences in order; sort/2 reorders.
:- list_to_set([1, 1.0, 1], S), writeln(S).

count_distinct(List, N) :- list_to_set(List, Set), length(Set, N).
:- count_distinct([x, y, x, z, y], N), writeln(N).

:- sumlist([1, 2, 3], S), writeln(S).
