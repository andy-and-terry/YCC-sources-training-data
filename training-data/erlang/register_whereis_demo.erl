-module(register_whereis_demo).
-export([run/0]).

run() ->
    Pid = spawn(fun() -> loop() end),
    register(echo_server, Pid),
    Pid = whereis(echo_server),
    echo_server ! {self(), hello},
    receive
        {echo, Msg} -> io:format("got ~p~n", [Msg])
    after 1000 -> io:format("timeout~n")
    end,
    echo_server ! stop,
    timer:sleep(50),
    io:format("~p~n", [whereis(echo_server)]).

loop() ->
    receive
        {From, Msg} ->
            From ! {echo, Msg},
            loop();
        stop ->
            ok
    end.
