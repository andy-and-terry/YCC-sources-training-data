-module(selective_receive_demo).
-export([run/0]).

%% Erlang's `receive` scans the process mailbox for the first message that
%% matches one of its clauses, not simply the oldest message. Sending two
%% `low` messages around a `high` one, but matching on `high` first below,
%% shows that a matching message is plucked out of the mailbox regardless
%% of arrival order -- no explicit priority queue needed.

run() ->
    self() ! {low, "background job"},
    self() ! {high, "urgent alert"},
    self() ! {low, "cleanup task"},
    Urgent = take_high(),
    io:format("handled first: ~p~n", [Urgent]),
    drain().

take_high() ->
    receive
        {high, Msg} -> Msg
    end.

drain() ->
    receive
        {Priority, Msg} ->
            io:format("draining ~p: ~p~n", [Priority, Msg]),
            drain()
    after 0 ->
        ok
    end.
