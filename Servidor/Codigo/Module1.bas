Attribute VB_Name = "Module1"
Public Function EsMalaPalabra(ByVal rdata As String)
If ReconocerPalabra("CHIT", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("CHEAT", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("TDN", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Austria", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("WWW.", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Zwitter", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Arwen", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Aofrost", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Blazzer", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Seventh", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("Skyserv", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("IMPERIUM", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("TDS", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("RELIGION", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("BLOSAM", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("FURIUS", UCase$(rdata)) Then EsMalaPalabra = True
If ReconocerPalabra("FSAO", UCase$(rdata)) Then EsMalaPalabra = True
 
 
End Function
 
Public Function HayAdminsOnline() As Boolean
    Dim i As Integer
        For i = 1 To LastUser
            If UserList(i).flags.Privilegios > 0 Then HayAdminsOnline = True
        Next i
End Function
Private Function ReconocerPalabra(ByVal Palabra As String, ByVal Donde As String) As Boolean
Dim i As Integer
For i = 1 To (Len(Donde) - Len(Palabra) + 1)
 If UCase(Mid(Donde, i, 1)) = UCase(Mid(Palabra, 1, 1)) Then
       If UCase(Mid(Donde, i, Len(Palabra))) = UCase(Mid(Palabra, 1, Len(Palabra))) Then
         ReconocerPalabra = True
         Exit Function 'Gracias Rheniek
       Else
         ReconocerPalabra = False
        End If
  Else
        ReconocerPalabra = False
  End If
Next
End Function
