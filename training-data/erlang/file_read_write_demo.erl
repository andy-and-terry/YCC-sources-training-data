-module(file_read_write_demo).
-export([run/0]).

%% Basic file API: write_file, read_file, append, open/read_line.
run() ->
    Path = "/tmp/erl_file_read_write_demo.txt",
    ok = file:write_file(Path, "first\nsecond\n"),
    ok = file:write_file(Path, "third\n", [append]),

    {ok, Bin} = file:read_file(Path),
    io:format("~p~n", [Bin]),

    {ok, Fd} = file:open(Path, [read]),
    Lines = read_lines(Fd, []),
    ok = file:close(Fd),
    io:format("~p~n", [Lines]),

    Words = string:tokens(binary_to_list(Bin), "\n"),
    io:format("~p~n", [Words]),

    io:format("size: ~p~n", [filelib:file_size(Path)]),
    ok = file:delete(Path),
    io:format("missing: ~p~n", [file:read_file(Path)]).

read_lines(Fd, Acc) ->
    case file:read_line(Fd) of
        {ok, Line} -> read_lines(Fd, [string:trim(Line) | Acc]);
        eof -> lists:reverse(Acc)
    end.
