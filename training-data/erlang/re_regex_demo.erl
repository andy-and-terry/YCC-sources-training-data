-module(re_regex_demo).
-export([run/0]).

run() ->
    {match, [Whole]} = re:run("order-1234", "[0-9]+", [{capture, first, list}]),
    io:format("~s~n", [Whole]),
    nomatch = re:run("abc", "^[0-9]+$"),
    Replaced = re:replace("a1b22c333", "[0-9]+", "#", [global, {return, list}]),
    io:format("~s~n", [Replaced]),
    Parts = re:split("one, two,three", ",\\s*", [{return, list}]),
    io:format("~p~n", [Parts]),
    {match, [Y, M, D]} = re:run("2024-03-15", "(\\d+)-(\\d+)-(\\d+)",
                                [{capture, all_but_first, list}]),
    io:format("~s/~s/~s~n", [D, M, Y]).
