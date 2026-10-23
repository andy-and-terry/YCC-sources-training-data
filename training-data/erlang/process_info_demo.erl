-module(process_info_demo).
-export([run/0]).

run() ->
    Pid = spawn(fun() ->
        receive stop -> ok end
    end),
    timer:sleep(10),

    {status, Status} = process_info(Pid, status),
    io:format("status: ~p~n", [Status]),

    Pid ! hello,
    Pid ! world,
    {message_queue_len, N} = process_info(Pid, message_queue_len),
    io:format("queued: ~p~n", [N]),
    {messages, Msgs} = process_info(Pid, messages),
    io:format("messages: ~p~n", [Msgs]),

    {registered_name, []} = process_info(Pid, registered_name),
    register(worker, Pid),
    io:format("registered: ~p~n", [process_info(Pid, registered_name)]),
    io:format("whereis: ~p~n", [whereis(worker) =:= Pid]),

    Pid ! stop,
    timer:sleep(10),
    io:format("alive: ~p~n", [is_process_alive(Pid)]),
    io:format("info after exit: ~p~n", [process_info(Pid)]).
