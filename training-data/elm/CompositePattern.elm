module CompositePattern exposing (FileSystemItem(..), itemCount, totalSize)

{-| The Gang-of-Four Composite pattern needs no shared base class for
leaves and containers in Elm: both cases are just variants of one custom
type, and any operation that must treat "a single file" and "a whole tree
of files" the same way is simply a recursive function pattern matching on
it.
-}


type FileSystemItem
    = File Int
    | Directory (List FileSystemItem)


totalSize : FileSystemItem -> Int
totalSize item =
    case item of
        File size ->
            size

        Directory children ->
            children
                |> List.map totalSize
                |> List.sum


itemCount : FileSystemItem -> Int
itemCount item =
    case item of
        File _ ->
            1

        Directory children ->
            1 + (children |> List.map itemCount |> List.sum)
