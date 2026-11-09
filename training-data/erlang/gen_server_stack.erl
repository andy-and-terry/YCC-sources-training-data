-module(gen_server_stack).
-behaviour(gen_server).
-export([start_link/0, push/1, pop/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link() -> gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
push(X) -> gen_server:cast(?MODULE, {push, X}).
pop() -> gen_server:call(?MODULE, pop).

init([]) -> {ok, []}.
handle_call(pop, _From, [H | T]) -> {reply, H, T};
handle_call(pop, _From, []) -> {reply, empty, []}.
handle_cast({push, X}, S) -> {noreply, [X | S]}.
