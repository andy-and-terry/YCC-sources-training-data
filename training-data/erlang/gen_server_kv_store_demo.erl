-module(gen_server_kv_store_demo).
-behaviour(gen_server).
-export([start/0, put/3, get/2, run/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start() -> gen_server:start_link(?MODULE, #{}, []).
put(P, K, V) -> gen_server:cast(P, {put, K, V}).
get(P, K) -> gen_server:call(P, {get, K}).

init(S) -> {ok, S}.
handle_cast({put, K, V}, S) -> {noreply, S#{K => V}}.
handle_call({get, K}, _From, S) -> {reply, maps:get(K, S, undefined), S}.

run() ->
    {ok, P} = start(),
    put(P, a, 1),
    io:format("~p~n", [get(P, a)]).
