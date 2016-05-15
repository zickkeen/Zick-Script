Private Sub Workbook_Open()
Dim sHostName As String
' Get Host Name / Get Computer Name
sHostName = Environ$("computername")
Set CodeiParengan = Sheets("Sheet1")
CodeiParengan.Range("A1").Value = CreateObject("Scripting.FileSystemObject").GetDrive("C:\").SerialNumber
Sheets("Sheet1").Range("A2").Value = sHostName
If CodeiParengan.Range("B1").Value = "" Then
CodeiParengan.Range("B1").Value = CodeiParengan.Range("A1").Value
Else
Exit Sub
End If

If CodeiParengan.Range("A1").Value = CodeiParengan.Range("B1").Value Then
CodeiParengan.Range("C1").Value = "TRUE"
Else
CodeiParengan.Range("A1").Value = "FALSE"
End If
If CodeiParengan.Range("C1").Value = "TRUE" Then
Exit Sub
Else
Call HAPUSDATA
End If
End Sub
Sub HAPUSDATA()
Cells.Select
Selection.Delete Shift:=xlUp
Sheets("Sheet3").Select
Cells.Select
Selection.Delete Shift:=xlUp
Sheets("Sheet2").Select
Cells.Select
Selection.Delete Shift:=xlUp
Sheets("Sheet1").Select
End Sub
