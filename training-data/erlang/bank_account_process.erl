-module(bank_account_process).
-export([start/1, deposit/2, withdraw/2, balance/1, stop/1, loop/1]).

%% A hand-rolled gen_server-style process: a single recursive `loop/1`
%% carries the account balance as its state and blocks in `receive`
%% between messages, replying to the caller and looping with the
%% updated state -- the same shape gen_server hides behind callbacks.

start(Initial) ->
    spawn(?MODULE, loop, [Initial]).

deposit(Pid, Amount) ->
    Pid ! {deposit, Amount}.

withdraw(Pid, Amount) ->
    Pid ! {withdraw, Amount, self()},
    receive
        Reply -> Reply
    end.

balance(Pid) ->
    Pid ! {balance, self()},
    receive
        {balance, Value} -> Value
    end.

stop(Pid) ->
    Pid ! stop.

loop(Balance) ->
    receive
        {deposit, Amount} ->
            loop(Balance + Amount);
        {withdraw, Amount, From} when Amount > Balance ->
            From ! {error, insufficient_funds},
            loop(Balance);
        {withdraw, Amount, From} ->
            From ! {ok, Balance - Amount},
            loop(Balance - Amount);
        {balance, From} ->
            From ! {balance, Balance},
            loop(Balance);
        stop ->
            ok
    end.

run() ->
    Pid = start(100),
    deposit(Pid, 50),
    io:format("~p~n", [withdraw(Pid, 30)]),
    io:format("~p~n", [balance(Pid)]),
    io:format("~p~n", [withdraw(Pid, 1000)]),
    stop(Pid).
