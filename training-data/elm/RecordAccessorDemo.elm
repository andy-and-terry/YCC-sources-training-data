module RecordAccessorDemo exposing (Employee, names, totalSalary, oldest)


type alias Employee =
    { name : String
    , age : Int
    , salary : Float
    }


names : List Employee -> List String
names =
    List.map .name


totalSalary : List Employee -> Float
totalSalary =
    List.map .salary >> List.sum


oldest : List Employee -> Maybe Employee
oldest =
    List.sortBy .age >> List.reverse >> List.head
