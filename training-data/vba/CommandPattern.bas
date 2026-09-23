' Class module: ICommand
Public Sub Execute()
End Sub

Public Sub Undo()
End Sub

' Class module: Light
Public IsOn As Boolean

Public Sub TurnOn()
    IsOn = True
    Debug.Print "Light is ON"
End Sub

Public Sub TurnOff()
    IsOn = False
    Debug.Print "Light is OFF"
End Sub

' Class module: TurnOnCommand
Implements ICommand

Public TargetLight As Light

Private Sub ICommand_Execute()
    TargetLight.TurnOn
End Sub

Private Sub ICommand_Undo()
    TargetLight.TurnOff
End Sub

' Class module: TurnOffCommand
Implements ICommand

Public TargetLight As Light

Private Sub ICommand_Execute()
    TargetLight.TurnOff
End Sub

Private Sub ICommand_Undo()
    TargetLight.TurnOn
End Sub

' Class module: RemoteControl
Private history As New Collection

Public Sub Perform(cmd As ICommand)
    cmd.Execute
    history.Add cmd
End Sub

Public Sub UndoLast()
    If history.Count = 0 Then Exit Sub
    Dim last As ICommand
    Set last = history(history.Count)
    history.Remove history.Count
    last.Undo
End Sub

' The following would live in a standard module
Sub Main()
    Dim light As New Light
    Dim remote As New RemoteControl

    Dim onCmd As New TurnOnCommand
    Set onCmd.TargetLight = light

    Dim offCmd As New TurnOffCommand
    Set offCmd.TargetLight = light

    remote.Perform onCmd
    remote.Perform offCmd
    remote.UndoLast

    Debug.Print "final state IsOn=" & light.IsOn
End Sub
