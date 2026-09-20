-module(gen_statem_traffic_light).
-behaviour(gen_statem).
-export([start_link/0, advance/1, current_color/1]).
-export([init/1, callback_mode/0, red/3, green/3, yellow/3]).

start_link() ->
    gen_statem:start_link(?MODULE, [], []).

advance(Pid) -> gen_statem:cast(Pid, advance).

current_color(Pid) -> gen_statem:call(Pid, current_color).

init([]) -> {ok, red, undefined}.

callback_mode() -> state_functions.

red(cast, advance, Data) -> {next_state, green, Data};
red({call, From}, current_color, Data) -> {keep_state, Data, [{reply, From, red}]}.

green(cast, advance, Data) -> {next_state, yellow, Data};
green({call, From}, current_color, Data) -> {keep_state, Data, [{reply, From, green}]}.

yellow(cast, advance, Data) -> {next_state, red, Data};
yellow({call, From}, current_color, Data) -> {keep_state, Data, [{reply, From, yellow}]}.
