Private Enum Weekday
    Mon = 1
    Tue
    Wed
End Enum

Private Type Person
    Name As String * 20
    Age As Integer
    Tags(1 To 3) As String
End Type

Sub TypesAndEnums()
    Dim p As Person
    p.Name = "Ada"
    p.Age = 36
    p.Tags(2) = "math"
    Debug.Print Trim(p.Name), p.Age, p.Tags(2)
    Dim q As Person: q = p
    q.Age = 40
    Debug.Print p.Age, q.Age, Len(p) > 0
    Debug.Print Wed, Tue + 1, Mon
    Const PI As Double = 3.14159
    Static calls As Long: calls = calls + 1
    Dim s As String * 5: s = "toolongvalue"
    Debug.Print s, Len(s)
    Dim v As Variant: v = Empty: Debug.Print IsEmpty(v), IsNull(Null), IsObject(Nothing)
End Sub
