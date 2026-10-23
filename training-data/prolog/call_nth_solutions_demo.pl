:- use_module(library(solution_sequences)).

color(red).
color(green).
color(blue).
color(yellow).
color(purple).

% call_nth/2 yields the Nth solution together with its index
:- call_nth(color(C), 3), format("third color: ~w~n", [C]).

% enumerate every solution with its position
:- forall(call_nth(color(C), N), format("~w: ~w~n", [N, C])).

% limit/2 and offset/2 give SQL-like paging over a nondeterministic goal
:- findall(C, limit(2, color(C)), L), format("limit 2: ~w~n", [L]).
:- findall(C, offset(3, color(C)), L), format("offset 3: ~w~n", [L]).
:- findall(C, limit(2, offset(1, color(C))), L), format("page: ~w~n", [L]).

% distinct/1 removes duplicate answers
n(1). n(2). n(1). n(3). n(2).
:- findall(X, distinct(X, n(X)), L), format("distinct: ~w~n", [L]).

% order_by/2 sorts solutions without findall + sort boilerplate
:- findall(C, order_by([desc(C)], color(C)), L), format("sorted desc: ~w~n", [L]).
