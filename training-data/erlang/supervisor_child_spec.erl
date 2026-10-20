-module(supervisor_child_spec).
-behaviour(supervisor).
-export([main/0, init/1, start_worker/0]).

start_worker() -> {ok, spawn_link(fun() -> receive stop -> ok end end)}.

init([]) ->
    Child = #{id => w1, start => {?MODULE, start_worker, []}, restart => permanent},
    {ok, {#{strategy => one_for_one, intensity => 3, period => 10}, [Child]}}.

main() ->
    {ok, Sup} = supervisor:start_link(?MODULE, []),
    io:format("~p~n", [length(supervisor:which_children(Sup))]),
    [{_, Pid, _, _}] = supervisor:which_children(Sup),
    exit(Pid, kill),
    timer:sleep(50),
    io:format("~p~n", [length(supervisor:which_children(Sup))]).
