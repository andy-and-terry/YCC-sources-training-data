-module(gen_server_stack).
-behaviour(gen_server).
-export([start/0, push/2, pop/1]).
-export([init/1, handle_call/3, handle_cast/2]).

start() -> gen_server:start_link(?MODULE, [], []).
push(P, X) -> gen_server:cast(P, {push, X}).
pop(P) -> gen_server:call(P, pop).

init(_) -> {ok, []}.
handle_call(pop, _F, [H | T]) -> {reply, {ok, H}, T};
handle_call(pop, _F, []) -> {reply, empty, []}.
handle_cast({push, X}, S) -> {noreply, [X | S]}.
