-module(binary_split_demo).
-export([main/0]).

main() ->
    Csv = <<"alpha,beta,gamma,delta">>,
    io:format("~p~n", [binary:split(Csv, <<",">>)]),
    io:format("~p~n", [binary:split(Csv, <<",">>, [global])]),
    io:format("~p~n", [binary:split(Csv, [<<",">>, <<"a">>], [global, trim_all])]),
    io:format("~p~n", [binary:match(Csv, <<"gamma">>)]),
    io:format("~p~n", [binary:matches(<<"abcabc">>, <<"bc">>)]),
    io:format("~p~n", [binary:replace(Csv, <<",">>, <<";">>, [global])]),
    io:format("~p~n", [binary:part(Csv, 6, 4)]),
    io:format("~p~n", [binary:at(Csv, 0)]),
    io:format("~p~n", [binary:copy(<<"ab">>, 3)]),
    io:format("~p~n", [binary:longest_common_prefix([<<"interview">>, <<"internet">>, <<"interval">>])]),
    io:format("~p~n", [binary:bin_to_list(<<"hi">>)]).
