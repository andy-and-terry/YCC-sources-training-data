-module(gen_statem_traffic_light).
-behaviour(gen_statem).
-export([start_link/0, advance/1, which_state/1]).
-export([init/1, callback_mode/0]).
-export([red/3, green/3, yellow/3]).

%% A traffic light modeled as a gen_statem in `state_functions` callback
%% mode: each state is its own function, and `advance` cycles
%% red -> green -> yellow -> red.

start_link() ->
    gen_statem:start_link(?MODULE, [], []).

advance(Pid) ->
    gen_statem:call(Pid, advance).

which_state(Pid) ->
    gen_statem:call(Pid, which_state).

init([]) ->
    {ok, red, no_data}.

callback_mode() ->
    state_functions.

red({call, From}, advance, Data) ->
    {next_state, green, Data, [{reply, From, ok}]};
red({call, From}, which_state, Data) ->
    {keep_state, Data, [{reply, From, red}]}.

green({call, From}, advance, Data) ->
    {next_state, yellow, Data, [{reply, From, ok}]};
green({call, From}, which_state, Data) ->
    {keep_state, Data, [{reply, From, green}]}.

yellow({call, From}, advance, Data) ->
    {next_state, red, Data, [{reply, From, ok}]};
yellow({call, From}, which_state, Data) ->
    {keep_state, Data, [{reply, From, yellow}]}.
