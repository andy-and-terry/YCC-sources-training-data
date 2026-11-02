-module(gen_server_counter_x2).
-behaviour(gen_server).
-export([start/0, inc/1, get/1]).
-export([init/1, handle_call/3, handle_cast/2]).

start() -> gen_server:start_link(?MODULE, 0, []).
inc(P) -> gen_server:cast(P, inc).
get(P) -> gen_server:call(P, get).

init(N) -> {ok, N}.
handle_call(get, _F, N) -> {reply, N, N}.
handle_cast(inc, N) -> {noreply, N + 1}.
