Public Function SHA(ByVal sTextToHash As String)

    Dim asc As Object
    Dim enc As Object
    Dim TextToHash() As Byte
    Dim SharedSecretKey() As Byte
    Dim bytes() As Byte
    Const cutoff As Integer = 28

    Set asc = CreateObject("System.Text.UTF8Encoding")
    Set enc = CreateObject("System.Security.Cryptography.HMACSHA1")

    TextToHash = asc.GetBytes_4(sTextToHash)
    SharedSecretKey = asc.GetBytes_4(sTextToHash)
    enc.Key = SharedSecretKey

    bytes = enc.ComputeHash_2((TextToHash))
    SHA = EncodeBase64(bytes)
    SHA = Left(SHA, cutoff)

    Set asc = Nothing
    Set enc = Nothing

End Function

Private Function EncodeBase64(ByRef arrData() As Byte) As String

    Dim objXML As Object
    Dim objNode As Object

    Set objXML = CreateObject("MSXML2.DOMDocument")
    Set objNode = objXML.createElement("b64")

    objNode.DataType = "bin.base64"
    objNode.nodeTypedValue = arrData
    EncodeBase64 = objNode.Text

    Set objNode = Nothing
    Set objXML = Nothing

End Function

Public Function CekSerial()
    Dim SerialNumb As String
    SerialNumb = Sheets("MCI").Range("B7")
    If SerialNumb = False Then
        MsgBox ("Maaf, Anda tidak memiliki lisensi pada Komputer ini / Sekolah anda ")
        Sheet4.Activate
    End If
End Function
