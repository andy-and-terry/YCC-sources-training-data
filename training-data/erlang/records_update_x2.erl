-module(records_update_x2).
-export([demo/0]).
-record(user, {name, age = 0}).

demo() ->
    U = #user{name = "ann"},
    U2 = U#user{age = 31},
    {U2#user.name, U2#user.age}.
