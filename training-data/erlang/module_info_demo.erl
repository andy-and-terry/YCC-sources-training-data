-module(module_info_demo).
-export([run/0, add/2, double/1]).

add(A, B) -> A + B.
double(X) -> add(X, X).

run() ->
    Exports = module_info(exports),
    io:format("exports: ~p~n", [lists:sort(Exports)]),
    io:format("has add/2: ~p~n", [lists:member({add, 2}, Exports)]),
    io:format("module: ~p~n", [module_info(module)]),

    F = fun add/2,
    {arity, A} = erlang:fun_info(F, arity),
    {name, N} = erlang:fun_info(F, name),
    io:format("fun ~p/~p~n", [N, A]),

    io:format("exported: ~p ~p~n",
              [erlang:function_exported(?MODULE, double, 1),
               erlang:function_exported(?MODULE, missing, 0)]).
