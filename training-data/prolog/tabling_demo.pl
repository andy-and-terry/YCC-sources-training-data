% :- table declares that a predicate's calls and answers should be
% cached (SLG resolution) instead of re-derived by plain SLD resolution.
% This both turns exponential naive recursion into linear work and lets
% predicates over cyclic data terminate where plain backtracking would
% recurse forever.
:- table fib/2.

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

:- fib(30, F), writeln(F).

% edge/2 has a cycle (a -> b -> c -> a), so without tabling, exhausting
% every choice point of reachable/2 via findall would recurse around the
% cycle forever looking for further solutions. Tabling recognizes the
% repeated call and reuses the answers already being computed for it,
% so the query below still terminates with the complete finite answer.
:- table reachable/2.

edge(a, b).
edge(b, c).
edge(c, a).
edge(c, d).

reachable(X, Y) :- edge(X, Y).
reachable(X, Y) :- edge(X, Z), reachable(Z, Y).

:- findall(Y, reachable(a, Y), Nodes),
   sort(Nodes, SortedNodes),
   writeln(SortedNodes).
