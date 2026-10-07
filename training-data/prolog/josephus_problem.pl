% The Josephus problem: N people stand in a circle and every Kth one is
% eliminated until a single survivor remains. Each round removes the
% Kth element and rotates the list so counting resumes right after it.
josephus(N, K, Survivor) :-
    numlist(1, N, People),
    josephus_(People, K, Survivor).

josephus_([X], _, X) :- !.
josephus_(People, K, Survivor) :-
    length(People, Len),
    Idx is (K - 1) mod Len,
    nth0(Idx, People, _, Rest),
    length(Front, Idx),
    append(Front, Back, Rest),
    append(Back, Front, Rotated),
    josephus_(Rotated, K, Survivor).

:- josephus(7, 3, Survivor), writeln(Survivor).
