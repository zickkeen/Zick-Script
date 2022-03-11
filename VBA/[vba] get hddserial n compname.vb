Option Explicit

Private Sub Workbook_Activate()
    Sheet4.Activate
End Sub

Private Sub Workbook_Open()
    Dim CompName As String
    Dim HddSerial As String
    Dim SheetCode As String
	
	'Get Com Name & Partition Serial
    CompName = Environ$("computername")
    HddSerial = CreateObject("Scripting.FileSystemObject").GetDrive("C:\").SerialNumber
    
	'Set Data information
	Sheets("MCI").Range("B1").Value = HddSerial
    Sheets("MCI").Range("B2").Value = CompName
    Sheets("Sekolah").Range("L4").Value = HddSerial
    Sheets("Sekolah").Range("L5").Value = CompName
    MsgBox ("Selamat Datang di Aplikasi sekolah " + Sheets("Sekolah").Range("H4").Value) 
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
