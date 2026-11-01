' Class module: Person
Private pName As String
Private pAge As Integer

Public Property Get Name() As String
    Name = pName
End Property
Public Property Let Name(v As String)
    pName = v
End Property
Public Function Describe() As String
    Describe = pName & " (" & pAge & ")"
End Function
