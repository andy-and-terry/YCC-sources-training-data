module RecordUpdateTypeAlias exposing (Person, birthday, fullName, initial, rename)


type alias Person =
    { first : String
    , last : String
    , age : Int
    , tags : List String
    }


initial : Person
initial =
    { first = "Ada", last = "Lovelace", age = 36, tags = [] }


birthday : Person -> Person
birthday p =
    { p | age = p.age + 1 }


rename : String -> String -> Person -> Person
rename f l p =
    { p | first = f, last = l, tags = "renamed" :: p.tags }


fullName : Person -> String
fullName { first, last } =
    first ++ " " ++ last
