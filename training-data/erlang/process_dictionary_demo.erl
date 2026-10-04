-module(process_dictionary_demo).
-export([main/0]).

main() ->
    put(user, "ada"),
    put(visits, 0),
    increment(),
    increment(),
    io:format("user=~p visits=~p~n", [get(user), get(visits)]),
    io:format("missing=~p~n", [get(nothing)]),
    io:format("keys=~p~n", [lists:sort(get_keys())]),
    Parent = self(),
    spawn(fun() ->
        Parent ! {child_sees, get(user)},
        put(user, "child"),
        Parent ! {child_has, get(user)}
    end),
    receive {child_sees, V1} -> io:format("child initially sees ~p~n", [V1]) end,
    receive {child_has, V2} -> io:format("child sets ~p~n", [V2]) end,
    io:format("parent still ~p~n", [get(user)]),
    io:format("erased ~p~n", [erase(user)]),
    io:format("rest ~p~n", [get()]).

increment() ->
    put(visits, get(visits) + 1).
