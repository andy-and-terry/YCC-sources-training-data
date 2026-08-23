-module(gen_server_counter).
-behaviour(gen_server).
-export([start_link/1, increment/1, value/1]).
-export([init/1, handle_call/3, handle_cast/2]).

start_link(Initial) -> gen_server:start_link(?MODULE, Initial, []).

increment(Pid) -> gen_server:cast(Pid, increment).
value(Pid) -> gen_server:call(Pid, value).

init(Initial) -> {ok, Initial}.

handle_cast(increment, State) -> {noreply, State + 1}.

handle_call(value, _From, State) -> {reply, State, State}.
