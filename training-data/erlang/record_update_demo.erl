-module(record_update_demo).
-export([run/0]).

-record(user, {name, age = 0, email = undefined}).

run() ->
    U = #user{name = "ann", age = 30},
    U2 = U#user{age = 31, email = "ann@example.com"},
    io:format("~p~n", [U2]),
    io:format("~s ~p~n", [U2#user.name, U2#user.age]),
    #user{name = N} = U2,
    io:format("~s~n", [N]),
    io:format("~p~n", [record_info(fields, user)]),
    io:format("~p~n", [is_record(U, user)]).
