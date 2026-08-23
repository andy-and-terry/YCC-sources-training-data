-module(pattern_matching_advanced).
-export([describe/1]).

describe({point, X, Y}) when X =:= 0, Y =:= 0 -> "origin";
describe({point, X, 0}) -> io_lib:format("on x-axis at ~p", [X]);
describe({point, 0, Y}) -> io_lib:format("on y-axis at ~p", [Y]);
describe({point, X, Y}) -> io_lib:format("point at (~p, ~p)", [X, Y]);
describe([H | _T]) when is_integer(H) -> "list starting with integer";
describe([]) -> "empty list";
describe(_) -> "unknown".
