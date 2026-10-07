module FunctionComposition exposing (cleanup, compose3, slugify)


slugify : String -> String
slugify =
    String.toLower
        >> String.words
        >> String.join "-"


cleanup : String -> String
cleanup =
    String.trim << String.toLower


compose3 : (c -> d) -> (b -> c) -> (a -> b) -> a -> d
compose3 f g h =
    f << g << h
