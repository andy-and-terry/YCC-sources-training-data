-module(gen_server_counter_module).
-behaviour(gen_server).
-export([main/0, init/1, handle_call/3, handle_cast/2]).

init(N) -> {ok, N}.
handle_call(get, _From, N) -> {reply, N, N}.
handle_cast(inc, N) -> {noreply, N + 1}.

main() ->
    {ok, Pid} = gen_server:start_link(?MODULE, 5, []),
    [gen_server:cast(Pid, inc) || _ <- lists:seq(1, 3)],
    io:format("~p~n", [gen_server:call(Pid, get)]).
