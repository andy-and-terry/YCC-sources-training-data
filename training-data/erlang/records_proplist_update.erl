-module(records_proplist_update).
-export([main/0]).
-record(user, {name, age = 0}).

main() ->
    U = #user{name = "ann"},
    U2 = U#user{age = 30},
    io:format("~p ~p~n", [U2#user.name, U2#user.age]).
