% The power set of [H|T] is the power set of T, plus each of those
% subsets with H added back in; a 2^0-sized base case doubles at each step.
power_set([], [[]]).
power_set([H|T], PowerSet) :-
    power_set(T, WithoutH),
    findall([H|Sub], member(Sub, WithoutH), WithH),
    append(WithoutH, WithH, PowerSet).

:- power_set([1, 2, 3], PS), writeln(PS), length(PS, N), writeln(N).
