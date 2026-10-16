:- use_module(library(clpfd)).

:- X in 1..5, X #> 2, fd_dom(X, Dom), writeln(Dom).
:- X in 1..10, X mod 3 #= 0, findall(X, label([X]), Xs), writeln(Xs).

:- X in 0..9, Y in 0..9, X + Y #= 10, X - Y #= 4, label([X, Y]), writeln(X-Y).

:- Vs = [A, B, C], Vs ins 1..3, all_different(Vs), A #< B, B #< C, label(Vs), writeln(Vs).

:- X in 1..100, X * X #= 49, label([X]), writeln(X).

:- X in 1..5, labeling([max(X)], [X]), writeln(X).
:- X in 1..5, findall(X, labeling([down], [X]), Down), writeln(Down).
:- Vs = [P, Q], Vs ins 0..5, P + Q #= 5, labeling([ff], Vs), writeln(Vs).
:- length(Qs, 3), Qs ins 0..1, sum(Qs, #=, 2), findall(Qs, label(Qs), Sols), writeln(Sols).
