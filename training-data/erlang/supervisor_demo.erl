-module(supervisor_demo).
-behaviour(supervisor).
-export([run/0, start_link/0, init/1, start_worker/0, bump/0]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    ChildSpec = #{
        id => worker,
        start => {?MODULE, start_worker, []},
        restart => permanent,
        shutdown => 1000,
        type => worker,
        modules => [?MODULE]
    },
    {ok, {#{strategy => one_for_one, intensity => 5, period => 10}, [ChildSpec]}}.

start_worker() ->
    Pid = spawn_link(fun() -> worker_loop(0) end),
    register(counter_worker, Pid),
    {ok, Pid}.

worker_loop(Count) ->
    receive
        {bump, From} ->
            From ! {ok, Count + 1},
            worker_loop(Count + 1);
        crash ->
            erlang:error(boom)
    end.

bump() ->
    counter_worker ! {bump, self()},
    receive
        {ok, Value} -> Value
    end.

run() ->
    {ok, _Sup} = start_link(),
    io:format("~p~n", [bump()]),
    io:format("~p~n", [bump()]),
    PidBefore = whereis(counter_worker),
    counter_worker ! crash,
    timer:sleep(50),
    PidAfter = whereis(counter_worker),
    io:format("~p~n", [PidBefore =/= PidAfter]),
    io:format("~p~n", [bump()]).
