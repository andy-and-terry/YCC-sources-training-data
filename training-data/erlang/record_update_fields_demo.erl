-module(record_update_fields_demo).
-export([run/0]).
-record(user, {name, age = 0}).

run() ->
    U = #user{name = "ann"},
    U2 = U#user{age = 31},
    io:format("~p ~p~n", [U2#user.name, U2#user.age]).
