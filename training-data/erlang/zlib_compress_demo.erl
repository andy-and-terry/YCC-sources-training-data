-module(zlib_compress_demo).
-export([run/0]).

%% zlib compresses binaries; repetitive data shrinks a lot.
run() ->
    Data = binary:copy(<<"hello world ">>, 100),
    Packed = zlib:compress(Data),
    io:format("original: ~p bytes~n", [byte_size(Data)]),
    io:format("compressed smaller: ~p~n", [byte_size(Packed) < byte_size(Data)]),

    Restored = zlib:uncompress(Packed),
    io:format("round trip ok: ~p~n", [Restored =:= Data]),

    %% gzip format has a different header
    Gz = zlib:gzip(Data),
    io:format("gzip magic: ~p~n", [binary:part(Gz, 0, 2)]),
    io:format("gunzip ok: ~p~n", [zlib:gunzip(Gz) =:= Data]),

    %% crc32 and adler32 checksums
    io:format("crc32: ~p~n", [erlang:crc32(<<"abc">>)]),
    io:format("adler32: ~p~n", [zlib:adler32(<<"abc">>)]).
