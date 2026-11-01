-module(record_update_ex).
-export([main/0]).
-record(user, {name, age = 0, tags = []}).

main() ->
    U = #user{name = "ann"},
    U2 = U#user{age = 31, tags = [admin]},
    io:format("~p ~p~n", [U2#user.age, U2]).
