' Class module: BurgerBuilder
Public Bun As String
Public Patty As String
Public Toppings As String

Public Function InitBuilder() As Object
    Me.Bun = "plain"
    Me.Patty = "none"
    Me.Toppings = ""
    Set InitBuilder = Me
End Function

Public Function WithBun(bunType As String) As Object
    Me.Bun = bunType
    Set WithBun = Me
End Function

Public Function WithPatty(pattyType As String) As Object
    Me.Patty = pattyType
    Set WithPatty = Me
End Function

Public Function AddTopping(topping As String) As Object
    If Me.Toppings = "" Then
        Me.Toppings = topping
    Else
        Me.Toppings = Me.Toppings & ", " & topping
    End If
    Set AddTopping = Me
End Function

Public Function Describe() As String
    Describe = Me.Bun & " bun, " & Me.Patty & " patty, toppings: " & Me.Toppings
End Function

' The following would live in a standard module
Sub Main()
    Dim builder As New BurgerBuilder
    builder.InitBuilder
    builder.WithBun "sesame"
    builder.WithPatty "veggie"
    builder.AddTopping "lettuce"
    builder.AddTopping "tomato"

    Debug.Print builder.Describe
End Sub
