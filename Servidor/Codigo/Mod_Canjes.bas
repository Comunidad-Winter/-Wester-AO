Attribute VB_Name = "Mod_Canjes"
'Sistema de Canjes.
 
 
 
'Comando que ejecuta el Canje:
 
'Arriba de:
'    Case "USE"
'Ponemos:
'Case "EJC"
'rdata = Right$(rdata, Len(rdata) - 3)
'Canjear userindex,Val(Rdata)
'
 
Type Canje
    Obj As Obj
    Valor As Integer
    Grh As Integer
End Type
 
Public MaxCanjes As Integer
Public OBJCopa As Integer
Public Canjes_list() As Canje
 
 
 
Public Sub CargarCanjes()
 
Dim Path As String
 
 
Path = DatPath & "\Canjes.Siam"
MaxCanjes = val(GetVar(Path, "INIT", "MaxCanjes"))
OBJCopa = val(GetVar(Path, "INIT", "OBJCopa"))
ReDim Canjes_list(MaxCanjes) As Canje
 
If MaxCanjes <= 0 Then Exit Sub
Dim i As Integer
For i = 1 To MaxCanjes
 
    With Canjes_list(i)
   
        .Valor = val(GetVar(Path, val(i), "Valor"))
        .Obj.Amount = val(GetVar(Path, val(i), "OBJCantidad"))
        .Obj.OBJIndex = val(GetVar(Path, val(i), "OBJIndex"))
        .Grh = ObjData(.Obj.OBJIndex).GrhIndex
       
    End With
   
 
Next i
 
 
End Sub
 
 
Public Sub EnviarCanjes(UI As Integer)
 
If MaxCanjes <= 0 Then Exit Sub
 
Dim i As Integer
 
'Redmencionamos canjes en el cliente
SendData ToIndex, UI, 0, "RMC" & MaxCanjes
 
'Enviamos Los canjes
 
For i = 1 To MaxCanjes
 
    With Canjes_list(i)
   
        SendData ToIndex, UI, 0, "ACL" & i _
        & "," & .Valor _
        & "," & .Grh _
        & "," & .Obj.Amount _
        & "," & ObjData(.Obj.OBJIndex).Name
 
    End With
   
 
Next i
 
 
End Sub
 
Public Sub Canjear(UI As Integer, CI As Integer)
 
If CI <= 0 Then Exit Sub
If CI > MaxCanjes Then Exit Sub
 
With Canjes_list(CI)
 
    Dim ob As Obj
    ob = .Obj
    Dim obji As Obj
    obji.Amount = .Valor
    obji.OBJIndex = OBJCopa
    If Not TieneObjetos(obji.OBJIndex, obji.Amount, UI) Then
   
        SendData ToIndex, UI, 0, "||No tienes suficientes copas." & FONTTYPE_TALK
        Exit Sub
   
   Else
       
       
    obji.Amount = .Valor
    obji.OBJIndex = OBJCopa
   
        QuitarObjetos obji.OBJIndex, obji.Amount, UI
       
        If Not MeterItemEnInventario(UI, ob) Then _
        Call TirarItemAlPiso(UserList(UI).pos, ob)
 
    End If
   
End With
 
SendData ToIndex, UI, 0, "||El Canje Fue Realizado." & FONTTYPE_TALK
 
 
End Sub
 
 

