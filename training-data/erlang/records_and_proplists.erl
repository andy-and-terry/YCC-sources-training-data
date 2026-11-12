-module(rec_props).
-export([main/0]).
-record(user, {name, age = 0}).
main() ->
    U = #user{name = "ann"},
    U2 = U#user{age = 31},
    io:format("~p ~p~n", [U2#user.name, U2#user.age]),
    io:format("~p~n", [proplists:get_value(b, [{a, 1}, {b, 2}])]).
