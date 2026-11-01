module RecordUpdateEx exposing (birthday, user)


type alias User =
    { name : String, age : Int }


user : User
user =
    { name = "ann", age = 30 }


birthday : User -> User
birthday u =
    { u | age = u.age + 1 }
