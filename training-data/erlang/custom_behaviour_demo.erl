-module(custom_behaviour_demo).
-export([run_plugin/2]).

%% Defines a custom OTP-style behaviour contract via `-callback` specs. Any
%% module that implements `init_state/0` and `handle_event/2`, and declares
%% `-behaviour(custom_behaviour_demo).`, can be passed to `run_plugin/2`,
%% which drives it without knowing its concrete type.

-callback init_state() -> term().
-callback handle_event(Event :: term(), State :: term()) -> {ok, term()}.

run_plugin(Module, Event) ->
    State = Module:init_state(),
    Module:handle_event(Event, State).
