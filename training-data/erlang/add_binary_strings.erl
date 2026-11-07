-module(add_binary_strings).
-export([run/0, add_binary/2]).

add_binary(A, B) ->
    Sum = list_to_integer(A, 2) + list_to_integer(B, 2),
    integer_to_list(Sum, 2).

run() ->
    io:format("~s~n", [add_binary("1010", "1011")]).
