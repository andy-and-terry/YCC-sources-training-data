Private Type Employee
    Name As String
    Salary As Double
    Dept As String
End Type

Sub Main()
    Dim staff(2) As Employee
    staff(0).Name = "Ann": staff(0).Salary = 5200: staff(0).Dept = "IT"
    staff(1).Name = "Bob": staff(1).Salary = 4100: staff(1).Dept = "HR"
    staff(2).Name = "Cy": staff(2).Salary = 6300: staff(2).Dept = "IT"

    Dim i As Long, itTotal As Double
    For i = 0 To UBound(staff)
        If staff(i).Dept = "IT" Then itTotal = itTotal + staff(i).Salary
    Next i
    Debug.Print "IT payroll: " & Format$(itTotal, "#,##0.00")

    Dim top As Employee
    top = staff(0)
    For i = 1 To UBound(staff)
        If staff(i).Salary > top.Salary Then top = staff(i)
    Next i
    Debug.Print "Top earner: " & top.Name
End Sub
