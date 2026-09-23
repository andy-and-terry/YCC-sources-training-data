' Class module: IOrderState
Public Function StateName() As String
End Function

Public Sub AdvanceState(order As Object)
End Sub

' Class module: NewState
Implements IOrderState

Private Function IOrderState_StateName() As String
    IOrderState_StateName = "New"
End Function

Private Sub IOrderState_AdvanceState(order As Object)
    Set order.CurrentState = New PaidState
End Sub

' Class module: PaidState
Implements IOrderState

Private Function IOrderState_StateName() As String
    IOrderState_StateName = "Paid"
End Function

Private Sub IOrderState_AdvanceState(order As Object)
    Set order.CurrentState = New ShippedState
End Sub

' Class module: ShippedState
Implements IOrderState

Private Function IOrderState_StateName() As String
    IOrderState_StateName = "Shipped"
End Function

Private Sub IOrderState_AdvanceState(order As Object)
    Debug.Print "already shipped, no further transitions"
End Sub

' Class module: OrderContext
Public CurrentState As IOrderState

Public Sub ResetState()
    Set CurrentState = New NewState
End Sub

Public Sub Advance()
    CurrentState.AdvanceState Me
End Sub

Public Function Status() As String
    Status = CurrentState.StateName
End Function

' The following would live in a standard module
Sub Main()
    Dim order As New OrderContext
    order.ResetState

    Debug.Print order.Status
    order.Advance
    Debug.Print order.Status
    order.Advance
    Debug.Print order.Status
    order.Advance
    Debug.Print order.Status
End Sub
