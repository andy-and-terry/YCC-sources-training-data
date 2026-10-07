-module(message_ring_demo).
-export([run/0]).

run() ->
    N = 5,
    Self = self(),
    Last = lists:foldl(fun(_, Next) -> spawn(fun() -> node_loop(Next) end) end, Self, lists:seq(1, N)),
    Last ! {token, 0},
    receive
        {token, Hops} -> io:format("token travelled ~p hops~n", [Hops])
    after 1000 -> io:format("lost token~n")
    end.

node_loop(Next) ->
    receive
        {token, Hops} -> Next ! {token, Hops + 1}
    end.
