' Class module: Person
Private pName As String
Public Property Get Name() As String
    Name = pName
End Property
Public Property Let Name(v As String)
    pName = v
End Property
