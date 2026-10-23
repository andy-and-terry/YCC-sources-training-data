-module(spec_type_demo).
-export([run/0, area/1, safe_div/2]).

-type shape() :: {circle, number()} | {rect, number(), number()}.
-type result(T) :: {ok, T} | {error, atom()}.

-export_type([shape/0, result/1]).

-spec area(shape()) -> number().
area({circle, R}) -> 3.14159 * R * R;
area({rect, W, H}) -> W * H.

-spec safe_div(number(), number()) -> result(float()).
safe_div(_, 0) -> {error, div_by_zero};
safe_div(A, B) -> {ok, A / B}.

run() ->
    io:format("~p~n", [area({rect, 3, 4})]),
    io:format("~p~n", [safe_div(1, 4)]),
    io:format("~p~n", [safe_div(1, 0)]).
