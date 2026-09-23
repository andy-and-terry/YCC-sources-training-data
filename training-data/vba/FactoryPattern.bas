' Class module: IVehicle
Public Function Describe() As String
End Function

' Class module: Car
Implements IVehicle

Private Function IVehicle_Describe() As String
    IVehicle_Describe = "Car"
End Function

' Class module: Truck
Implements IVehicle

Private Function IVehicle_Describe() As String
    IVehicle_Describe = "Truck"
End Function

' Class module: VehicleFactory
Public Function Create(kind As String) As IVehicle
    Select Case LCase(kind)
        Case "car"
            Set Create = New Car
        Case "truck"
            Set Create = New Truck
        Case Else
            Err.Raise 5, , "Unknown vehicle kind: " & kind
    End Select
End Function

' The following would live in a standard module
Sub Main()
    Dim factory As New VehicleFactory
    Debug.Print factory.Create("car").Describe
    Debug.Print factory.Create("truck").Describe
End Sub
