-module(custom_exception_demo).
-export([withdraw/2, run/0]).

withdraw(Balance, Amount) when Amount > Balance ->
    throw({insufficient_funds, Balance, Amount});
withdraw(Balance, Amount) ->
    Balance - Amount.

run() ->
    try
        withdraw(100, 200)
    catch
        throw:{insufficient_funds, Balance, Amount} ->
            io:format("Cannot withdraw ~p, balance is ~p~n", [Amount, Balance])
    end,
    io:format("~p~n", [withdraw(100, 50)]).
