-module(supervisor_demo).
-behaviour(supervisor).
-export([start_link/0, start_worker/0, worker_loop/1]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_worker() ->
    {ok, spawn_link(?MODULE, worker_loop, [0])}.

worker_loop(State) ->
    receive
        {get, From} ->
            From ! {ok, State},
            worker_loop(State);
        {set, NewState} ->
            worker_loop(NewState)
    end.

init([]) ->
    ChildSpec = #{id => worker,
                  start => {?MODULE, start_worker, []},
                  restart => permanent,
                  shutdown => 5000,
                  type => worker,
                  modules => [?MODULE]},
    {ok, {#{strategy => one_for_one, intensity => 5, period => 10}, [ChildSpec]}}.
