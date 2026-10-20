-module(pattern_match_tuple_records).
-export([main/0]).
-record(user, {name, age = 0, roles = []}).

describe(#user{name = N, age = A}) when A >= 18 -> io_lib:format("~s adult", [N]);
describe(#user{name = N}) -> io_lib:format("~s minor", [N]).

main() ->
    U = #user{name = "ada", age = 36},
    U2 = U#user{age = 10, roles = [admin]},
    io:format("~s~n~s~n", [describe(U), describe(U2)]),
    io:format("~p ~p~n", [U2#user.roles, element(2, U2)]),
    {A, [H | T]} = {1, [2, 3, 4]},
    io:format("~p ~p ~p~n", [A, H, T]).
