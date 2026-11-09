' Class module: Person
Private mName As String

Public Property Get Name() As String
    Name = mName
End Property

Public Property Let Name(ByVal v As String)
    mName = v
End Property

Public Function Greet() As String
    Greet = "Hi, " & mName
End Function
