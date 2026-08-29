Type Employee
    name As String
    salary As Double
End Type

Function GiveRaise(emp As Employee, amount As Double) As Employee
    emp.salary = emp.salary + amount
    GiveRaise = emp
End Function

Sub Main()
    Dim e As Employee
    e.name = "Alice"
    e.salary = 50000
    e = GiveRaise(e, 5000)
    Debug.Print e.name, e.salary
End Sub
