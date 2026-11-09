-module(supervisor_one_for_one).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() -> supervisor:start_link(?MODULE, []).

init([]) ->
    Child = #{id => worker, start => {gen_server_stack, start_link, []}},
    {ok, {#{strategy => one_for_one, intensity => 3, period => 10}, [Child]}}.
