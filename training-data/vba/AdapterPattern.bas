' Class module: IModernPrinter
Public Sub PrintDocument(text As String)
End Sub

' Class module: LegacyPrinter (incompatible interface)
Public Sub OldPrint(content As String)
    Debug.Print "[legacy] " & content
End Sub

' Class module: LegacyPrinterAdapter
Implements IModernPrinter
Dim legacy As LegacyPrinter

Public Sub InitAdapter(target As LegacyPrinter)
    Set legacy = target
End Sub

Private Sub IModernPrinter_PrintDocument(text As String)
    legacy.OldPrint text
End Sub

' The following would live in a standard module
Sub RunPrinter(printer As IModernPrinter)
    printer.PrintDocument "Quarterly report"
End Sub

Sub Main()
    Dim legacyPrinter As New LegacyPrinter
    Dim adapter As New LegacyPrinterAdapter
    adapter.InitAdapter legacyPrinter

    RunPrinter adapter
End Sub
