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

' The following would live in a standard module
Function VehicleFactory(vehicleType As String) As IVehicle
    Select Case vehicleType
        Case "car"
            Set VehicleFactory = New Car
        Case "truck"
            Set VehicleFactory = New Truck
        Case Else
            Set VehicleFactory = Nothing
    End Select
End Function

Sub Main()
    Dim v As IVehicle
    Set v = VehicleFactory("car")
    Debug.Print v.Describe

    Set v = VehicleFactory("truck")
    Debug.Print v.Describe
End Sub
