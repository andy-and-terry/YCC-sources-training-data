module RecordUpdateDemo exposing (Person, birthday, greet)


type alias Person =
    { name : String
    , age : Int
    }


birthday : Person -> Person
birthday person =
    { person | age = person.age + 1 }


greet : Person -> String
greet { name, age } =
    "Hello " ++ name ++ ", age " ++ String.fromInt age
