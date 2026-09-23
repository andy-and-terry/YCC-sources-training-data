-module(timeout_receive_demo).
-export([run/0]).

%% A `receive` with a non-zero `after` clause blocks waiting for a
%% matching message for up to that many milliseconds before giving up,
%% which is how a process avoids hanging forever on a reply that may
%% never arrive -- unlike `after 0`, which never actually waits.

wait_for_reply() ->
    receive
        {reply, Value} -> {ok, Value}
    after 100 ->
        {error, timeout}
    end.

run() ->
    io:format("~p~n", [wait_for_reply()]),
    self() ! {reply, 42},
    io:format("~p~n", [wait_for_reply()]).
