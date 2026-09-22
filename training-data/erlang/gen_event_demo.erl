-module(gen_event_demo).
-behaviour(gen_event).
-export([run/0, start/0, add_handler/2, notify/2]).
-export([init/1, handle_event/2, handle_call/2, handle_info/2, terminate/2,
         code_change/3]).

%% A gen_event handler that accumulates notified events in its state. This
%% is the Gang-of-Four Observer pattern via OTP's built-in event-manager
%% behaviour: any number of handlers can be attached to one manager, each
%% independently reacting to the same stream of `notify/2` events.

start() ->
    gen_event:start_link().

add_handler(Manager, InitialState) ->
    gen_event:add_handler(Manager, ?MODULE, InitialState).

notify(Manager, Event) ->
    gen_event:notify(Manager, Event).

init(InitialState) ->
    {ok, InitialState}.

handle_event(Event, State) ->
    io:format("handled event: ~p~n", [Event]),
    {ok, [Event | State]}.

handle_call(get_events, State) ->
    {ok, lists:reverse(State), State}.

handle_info(_Info, State) ->
    {ok, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

run() ->
    {ok, Manager} = start(),
    add_handler(Manager, []),
    notify(Manager, {temperature, 72}),
    notify(Manager, {temperature, 75}),
    Events = gen_event:call(Manager, ?MODULE, get_events),
    io:format("collected: ~p~n", [Events]),
    gen_event:stop(Manager).
