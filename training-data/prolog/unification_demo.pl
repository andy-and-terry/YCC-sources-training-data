point(X, Y) = point(X, Y).

describe_point(point(0, 0), origin) :- !.
describe_point(point(X, 0), on_x_axis(X)) :- !.
describe_point(point(0, Y), on_y_axis(Y)) :- !.
describe_point(point(X, Y), generic(X, Y)).

:- describe_point(point(0, 0), D), writeln(D).
:- describe_point(point(5, 0), D), writeln(D).
:- describe_point(point(3, 4), D), writeln(D).
