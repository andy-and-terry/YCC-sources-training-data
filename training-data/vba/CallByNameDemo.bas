Option Explicit

' Assumes a class module named Person (Name property, Greet method,
' Birthday method that increments Age). Shown inline for reference:
'
'   Public Name As String
'   Public Age As Long
'   Public Function Greet(ByVal other As String) As String
'       Greet = "Hi " & other & ", I am " & Name
'   End Function
'   Public Sub Birthday()
'       Age = Age + 1
'   End Sub

Sub Main()
    Dim p As Object
    Set p = New Person

    ' Set a property by name
    CallByName p, "Name", VbLet, "Ada"
    CallByName p, "Age", VbLet, 36

    ' Get a property by name
    Debug.Print "Name: " & CallByName(p, "Name", VbGet)

    ' Call a method that returns a value
    Debug.Print CallByName(p, "Greet", VbMethod, "Bob")

    ' Call a method chosen at runtime
    Dim actions As Variant, i As Long
    actions = Array("Birthday", "Birthday")
    For i = LBound(actions) To UBound(actions)
        CallByName p, CStr(actions(i)), VbMethod
    Next i
    Debug.Print "Age after birthdays: " & CallByName(p, "Age", VbGet)
End Sub
