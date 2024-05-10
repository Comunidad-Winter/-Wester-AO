Attribute VB_Name = "Handledata_2"
'FénixAO 1.0
'
'Based on Argentum Online 0.99z
'Copyright (C) 2002 Márquez Pablo Ignacio
'
'This program is free software; you can redistribute it and/or modify
'it under the terms of the GNU General Public License as published by
'the Free Software Foundation; either version 2 of the License, or
'any later version.
'
'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.
'
'You should have received a copy of the Affero General Public License
'along with this program; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
'
'You can contact the original creator of Argentum Online at:
'morgolock@speedy.com.ar
'www.geocities.com/gmorgolock
'Calle 3 número 983 piso 7 dto A
'La Plata - Pcia, Buenos Aires - Republica Argentina
'Código Postal 1900
'Pablo Ignacio Márquez
'
'Argentum Online is based on Baronsoft's VB6 Online RPG
'You can contact the original creator of ORE at aaron@baronsoft.com
'for more information about ORE please visit http://www.baronsoft.com/
'
'You can contact me at:
'elpresi@fenixao.com.ar
'www.fenixao.com.ar

Public Sub HandleData2(UserIndex As Integer, rdata As String, Procesado As Boolean)
Dim LoopC As Integer, TIndex As Integer, N As Integer, X As Integer, Y As Integer, tInt As Integer
Dim nPos As WorldPos
Dim tStr As String
Dim tLong As Long

Procesado = True

Select Case Left$(UCase$(rdata), 2)
    Case "#&"
        If UserList(UserIndex).flags.Muerto Then
        Dim DeDonde As WorldPos
        Select Case UCase$(UserList(UserIndex).Hogar)
            Case "LINDOS"
                DeDonde = LINDOS
            Case "NIX"
                DeDonde = NIX
            Case "BANDERBILL"
                DeDonde = BANDERBILL
            Case Else
                DeDonde = ULLATHORPE
            End Select
        Call WarpUserChar(UserIndex, DeDonde.Map, DeDonde.X, DeDonde.Y, True)
    Else
        Call SendData(ToIndex, UserIndex, 0, "||Debes estar muerto para utilizar el comando" & FONTTYPE_INFO)
        End If
    Exit Sub
    Case "#*"
        rdata = Right$(rdata, Len(rdata) - 2)
        TIndex = NameIndex(rdata)
        If TIndex Then
            If UserList(TIndex).flags.Privilegios < 2 Then
                Call SendData(ToIndex, UserIndex, 0, "||El jugador " & UserList(TIndex).Name & " se encuentra online." & FONTTYPE_INFO)
            Else: Call SendData(ToIndex, UserIndex, 0, "1A")
            End If
        Else: Call SendData(ToIndex, UserIndex, 0, "1A")
        End If
        Exit Sub
    Case "#]"
        rdata = Right$(rdata, Len(rdata) - 2)
        Call TirarRuleta(UserIndex, rdata)
    
        Exit Sub
    Case "#}"
        UserList(UserIndex).flags.MesaCasino = 0
        Call SendUserORO(UserIndex)
        Exit Sub
        
    Case "^A"
        rdata = Right$(rdata, Len(rdata) - 2)
        Call SendData(ToAdmins, 0, 0, "||" & UserList(UserIndex).Name & ": " & rdata & FONTTYPE_FIGHT)
        Exit Sub
    
    Case "#$"
        rdata = Right$(rdata, Len(rdata) - 2)
        If UserList(UserIndex).flags.Privilegios < 2 Then Exit Sub
        X = ReadField(1, rdata, 44)
        Y = ReadField(2, rdata, 44)
        N = MapaPorUbicacion(X, Y)
        If N Then Call WarpUserChar(UserIndex, N, 50, 50, True)
        Call LogGM(UserList(UserIndex).Name, "Se transporto por mapa a Mapa" & mapa & " X:" & X & " Y:" & Y, (UserList(UserIndex).flags.Privilegios = 1))
        Exit Sub
    
    Case "#A"
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
            Exit Sub
        End If
        If Not UserList(UserIndex).flags.Meditando And UserList(UserIndex).Stats.MinMAN = UserList(UserIndex).Stats.MaxMAN Then Exit Sub
        Call SendData(ToIndex, UserIndex, 0, "MEDOK")
        If Not UserList(UserIndex).flags.Meditando Then
           Call SendData(ToIndex, UserIndex, 0, "7M")
        Else
           Call SendData(ToIndex, UserIndex, 0, "D9")
        End If
        UserList(UserIndex).flags.Meditando = Not UserList(UserIndex).flags.Meditando
        
        If UserList(UserIndex).flags.Meditando Then
            UserList(UserIndex).Counters.tInicioMeditar = Timer
            Call SendData(ToIndex, UserIndex, 0, "8M" & TIEMPO_INICIOMEDITAR)


            UserList(UserIndex).Char.loops = LoopAdEternum
        If UserList(UserIndex).Stats.ELV < 15 Then
                Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "CFX" & UserList(UserIndex).Char.CharIndex & "," & FXMEDITARCHICO & "," & LoopAdEternum)
                UserList(UserIndex).Char.FX = FXMEDITARCHICO
            ElseIf UserList(UserIndex).Stats.ELV < 30 Then
                Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "CFX" & UserList(UserIndex).Char.CharIndex & "," & FXMEDITARMEDIANO & "," & LoopAdEternum)
                UserList(UserIndex).Char.FX = FXMEDITARMEDIANO
            ElseIf UserList(UserIndex).Stats.ELV < 45 Then
                Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "CFX" & UserList(UserIndex).Char.CharIndex & "," & FXMEDITARGRANDE & "," & LoopAdEternum)
                UserList(UserIndex).Char.FX = FXMEDITARGRANDE
            ElseIf UserList(UserIndex).Stats.ELV < 46 Then
                Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "CFX" & UserList(UserIndex).Char.CharIndex & "," & FXMEDITARGIGANTE & "," & LoopAdEternum)
                UserList(UserIndex).Char.FX = FXMEDITARGIGANTE
        End If
            Else
                UserList(UserIndex).Char.FX = 0
                UserList(UserIndex).Char.loops = 0
                Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "CFX" & UserList(UserIndex).Char.CharIndex & "," & 0 & "," & 0)
        End If
        Exit Sub
    Case "#B"
        If UserList(UserIndex).flags.Paralizado Then Exit Sub
        If UserList(UserIndex).pos.Map = 195 Or UserList(UserIndex).pos.Map = 197 Then
            Call SendData(ToIndex, UserIndex, 0, "||No Puedes desloguear estando en este Mapa." & FONTTYPE_WARNING)
            Exit Sub
        End If
        
        If (Not MapInfo(UserList(UserIndex).pos.Map).Pk And TiempoTranscurrido(UserList(UserIndex).Counters.LastRobo) > 10) Or UserList(UserIndex).flags.Privilegios > 1 Then
            Call SendData(ToIndex, UserIndex, 0, "FINOK")
            Call CloseSocket(UserIndex)
            Exit Sub
        End If
    
        Call Cerrar_Usuario(UserIndex)
        
        Exit Sub

    Case "#C"
        If CanCreateGuild(UserIndex) Then Call SendData(ToIndex, UserIndex, 0, "SHOWFUN" & UserList(UserIndex).Faccion.Bando)
        Exit Sub
    
    Case "#D"
        Call SendData(ToIndex, UserIndex, 0, "7L")
        Exit Sub
    
    Case "#G"
        
        If UserList(UserIndex).flags.Muerto Then
                  Call SendData(ToIndex, UserIndex, 0, "MU")
                  Exit Sub
        End If
        
        If UserList(UserIndex).flags.TargetNpc = 0 Then
              Call SendData(ToIndex, UserIndex, 0, "ZP")
              Exit Sub
        End If
        If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 3 Then
                  Call SendData(ToIndex, UserIndex, 0, "DL")
                  Exit Sub
        End If
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_BANQUERO _
        Or UserList(UserIndex).flags.Muerto Then Exit Sub

        Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "Tenes " & UserList(UserIndex).Stats.Banco & " monedas de oro en tu cuenta." & "°" & Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex)
        Exit Sub
        
    Case "#H"
         
         If UserList(UserIndex).flags.Muerto Then
                      Call SendData(ToIndex, UserIndex, 0, "MU")
                      Exit Sub
         End If
         
         If UserList(UserIndex).flags.TargetNpc = 0 Then
                  Call SendData(ToIndex, UserIndex, 0, "ZP")
                  Exit Sub
         End If
         If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 10 Then
                      Call SendData(ToIndex, UserIndex, 0, "DL")
                      Exit Sub
         End If
         If Npclist(UserList(UserIndex).flags.TargetNpc).MaestroUser <> _
            UserIndex Then Exit Sub
         Npclist(UserList(UserIndex).flags.TargetNpc).Movement = ESTATICO
         Call Expresar(UserList(UserIndex).flags.TargetNpc, UserIndex)
         Exit Sub
    Case "#I"
        
        If UserList(UserIndex).flags.Muerto Then
                  Call SendData(ToIndex, UserIndex, 0, "MU")
                  Exit Sub
        End If
        
        If UserList(UserIndex).flags.TargetNpc = 0 Then
              Call SendData(ToIndex, UserIndex, 0, "ZP")
              Exit Sub
        End If
        If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 10 Then
                  Call SendData(ToIndex, UserIndex, 0, "DL")
                  Exit Sub
        End If
        If Npclist(UserList(UserIndex).flags.TargetNpc).MaestroUser <> _
          UserIndex Then Exit Sub
        Call FollowAmo(UserList(UserIndex).flags.TargetNpc)
        Call Expresar(UserList(UserIndex).flags.TargetNpc, UserIndex)
        Exit Sub
    Case "#J"
        
        If UserList(UserIndex).flags.Muerto Then
                  Call SendData(ToIndex, UserIndex, 0, "MU")
                  Exit Sub
        End If
        
        If UserList(UserIndex).flags.TargetNpc = 0 Then
              Call SendData(ToIndex, UserIndex, 0, "ZP")
              Exit Sub
        End If
        If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 10 Then
                  Call SendData(ToIndex, UserIndex, 0, "DL")
                  Exit Sub
        End If
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_ENTRENADOR Then Exit Sub
        Call EnviarListaCriaturas(UserIndex, UserList(UserIndex).flags.TargetNpc)
        Exit Sub
    Case "#K"
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
            Exit Sub
        End If
        If HayOBJarea(UserList(UserIndex).pos, FOGATA) Then
                Call SendData(ToIndex, UserIndex, 0, "DOK")
                If Not UserList(UserIndex).flags.Descansar Then
                    Call SendData(ToIndex, UserIndex, 0, "3M")
                Else
                    Call SendData(ToIndex, UserIndex, 0, "4M")
                End If
                UserList(UserIndex).flags.Descansar = Not UserList(UserIndex).flags.Descansar
        Else
                If UserList(UserIndex).flags.Descansar Then
                    Call SendData(ToIndex, UserIndex, 0, "4M")
                    
                    UserList(UserIndex).flags.Descansar = False
                    Call SendData(ToIndex, UserIndex, 0, "DOK")
                    Exit Sub
                End If
                Call SendData(ToIndex, UserIndex, 0, "6M")
        End If
        Exit Sub

    Case "#L"
       
       If UserList(UserIndex).flags.TargetNpc = 0 Then
           Call SendData(ToIndex, UserIndex, 0, "ZP")
           Exit Sub
       End If
       
       If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_REVIVIR _
       Or UserList(UserIndex).flags.Muerto <> 1 Then Exit Sub
       If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 10 Then
           Call SendData(ToIndex, UserIndex, 0, "DL")
           Exit Sub
       End If

       Call RevivirUsuarioNPC(UserIndex)
       Call SendData(ToIndex, UserIndex, 0, "RZ")
       Exit Sub
    Case "#M"
       
       If UserList(UserIndex).flags.TargetNpc = 0 Then
           Call SendData(ToIndex, UserIndex, 0, "ZP")
           Exit Sub
       End If
       If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_REVIVIR _
       Or UserList(UserIndex).flags.Muerto Then Exit Sub
       If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 10 Then
           Call SendData(ToIndex, UserIndex, 0, "DL")
           Exit Sub
       End If
       UserList(UserIndex).Stats.MinHP = UserList(UserIndex).Stats.MaxHP
       Call SendUserHP(UserIndex)
       Exit Sub
    Case "#N"
        If UserList(UserIndex).flags.Muerto Then Exit Sub
        Call EnviarSubclase(UserIndex)
        Exit Sub
    Case "#O"
        If PuedeRecompensa(UserIndex) And Not UserList(UserIndex).flags.Muerto Then _
        Call SendData(ToIndex, UserIndex, 0, "RELON" & UserList(UserIndex).Clase & "," & PuedeRecompensa(UserIndex))
    Exit Sub
    
    Case "#/" ' /RECOMPENSA BY BURNS
    If UserList(UserIndex).flags.EstaMision = False Then
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡No estas en una misión!" & FONTTYPE_INFO)
Exit Sub
End If
 
If UserList(UserIndex).flags.TDead = UserList(UserIndex).flags.TDead + 10 Then
Call SendData(ToIndex, UserIndex, 0, "||Felicidades! Has completado la misión 1! ¿Podras con las demas?" & FONTTYPE_INFO)
UserList(UserIndex).flags.Canje = UserList(UserIndex).flags.Canje + 3
UserList(UserIndex).flags.EstaMision = False
Else
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡Aún no has completado la misión!" & FONTTYPE_INFO)
End If
Exit Sub
 
Case "#°"
    If UserList(UserIndex).flags.EstaMision = False Then
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡No estas en una misión!" & FONTTYPE_INFO)
Exit Sub
End If
 
If UserList(UserIndex).flags.TDead = UserList(UserIndex).flags.TDead + 20 Then
Call SendData(ToIndex, UserIndex, 0, "||Felicidades! Has completado la misión 2! ¿Podras con las demas?" & FONTTYPE_INFO)
UserList(UserIndex).flags.Canje = UserList(UserIndex).flags.Canje + 6
UserList(UserIndex).flags.EstaMision = False
Else
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡Aún no has completado la misión!" & FONTTYPE_INFO)
End If
Exit Sub
   
    Case "#)"
        If UserList(UserIndex).flags.EstaMision = False Then
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡No estas en una misión!" & FONTTYPE_INFO)
Exit Sub
End If
 
If UserList(UserIndex).flags.TDead = UserList(UserIndex).flags.TDead + 40 Then
Call SendData(ToIndex, UserIndex, 0, "||Felicidades! Has completado la misión 3! ¿Podras con las demas?" & FONTTYPE_INFO)
UserList(UserIndex).flags.Canje = UserList(UserIndex).flags.Canje + 9
UserList(UserIndex).flags.EstaMision = False
Else
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡Aún no has completado la misión!" & FONTTYPE_INFO)
End If
Exit Sub
 
Case "#("
    If UserList(UserIndex).flags.EstaMision = False Then
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡No estas en una misión!" & FONTTYPE_INFO)
Exit Sub
End If
 
If UserList(UserIndex).flags.TDead = UserList(UserIndex).flags.TDead + 50 Then
Call SendData(ToIndex, UserIndex, 0, "||Felicidades! Has completado la misión 4! ¿Podras con las demas?" & FONTTYPE_INFO)
UserList(UserIndex).flags.Canje = UserList(UserIndex).flags.Canje + 13
UserList(UserIndex).flags.EstaMision = False
Else
Call SendData(ToIndex, UserIndex, 0, "||Mision> ¡Aún no has completado la misión!" & FONTTYPE_INFO)
End If
Exit Sub
    
    Case "#P"
        
        If UserList(UserIndex).flags.Privilegios > 0 Then
            For LoopC = 1 To LastUser
                If Len(UserList(LoopC).Name) > 0 And UserList(LoopC).flags.Privilegios <= 1 Then
                    tStr = tStr & UserList(LoopC).Name & ", "
                End If
            Next
            If Len(tStr) > 0 Then
                tStr = Left$(tStr, Len(tStr) - 2)
                Call SendData(ToIndex, UserIndex, 0, "||" & tStr & FONTTYPE_INFO)
                Call SendData(ToIndex, UserIndex, 0, "4L" & NumNoGMs)
            Else
                Call SendData(ToIndex, UserIndex, 0, "6L")
            End If
        Else
           Call SendData(ToIndex, UserIndex, 0, "4L" & NumNoGMs)
        End If
        Exit Sub

    Case "#Q"
        Call SendUserSTAtsTxt(UserIndex, UserIndex)
        Exit Sub
    Case "#R"
        If UserList(UserIndex).Counters.Pena Then
            Call SendData(ToIndex, UserIndex, 0, "9M" & CalcularTiempoCarcel(UserIndex))
        Else
            Call SendData(ToIndex, UserIndex, 0, "2N")
        End If
        Exit Sub
    Case "#S"
        If UserList(UserIndex).flags.TargetUser Then
            If MapData(UserList(UserList(UserIndex).flags.TargetUser).pos.Map, UserList(UserList(UserIndex).flags.TargetUser).pos.X, UserList(UserList(UserIndex).flags.TargetUser).pos.Y).OBJInfo.OBJIndex > 0 And _
            UserList(UserList(UserIndex).flags.TargetUser).flags.Muerto Then
                Call SendData(ToAdmins, 0, 0, "8T" & UserList(UserIndex).Name & "," & UserList(UserList(UserIndex).flags.TargetUser).Name)
                Call SendData(ToIndex, UserList(UserIndex).flags.TargetUser, 0, "!!Fuiste echado por mantenerte sobre un item estando muerto.")
                Call SendData(ToIndex, UserList(UserIndex).flags.TargetUser, 0, "FINOK")
                Call CloseSocket(UserList(UserIndex).flags.TargetUser)
            End If
        End If
        Exit Sub

     Case "#§" '/AGITE
     
  If UserList(UserIndex).flags.Invisible = 1 Then
    Call SendData(ToIndex, UserIndex, 0, "||¡No puedes ir a la Sala De Agite invisible!" & FONTTYPE_INFO)
    Exit Sub
    End If
 
  If UserList(UserIndex).flags.Paralizado = 1 Then
    Call SendData(ToIndex, UserIndex, 0, "||Estás paralizado" & FONTTYPE_INFO)
    Exit Sub
    End If
 
  If UserList(UserIndex).pos.Map = 66 Then
    Call SendData(ToIndex, UserIndex, 0, "||No puedes ir a la Sala De Agite en la carcel." & FONTTYPE_INFO)
    Exit Sub
    End If
    
    If UserList(UserIndex).pos.Map = 66 Then
    Call SendData(ToIndex, UserIndex, 0, "||No puedes ir a la Sala De Agite Estando en Torneo." & FONTTYPE_INFO)
    Exit Sub
    End If
       
  If UserList(UserIndex).pos.Map = 192 Then
    Call SendData(ToIndex, UserIndex, 0, "||No puedes ir a la Sala De Agite en 2 vs 2." & FONTTYPE_INFO)
    Exit Sub
    End If
       
  If UserList(UserIndex).flags.Muerto = 1 Then
    Call SendData(ToIndex, UserIndex, 0, "||¡Estás muerto!" & FONTTYPE_INFO)
    Exit Sub
    End If
 
  If EsNewbie(UserIndex) Then
    Call SendData(ToIndex, UserIndex, 0, "||Los newbies no pueden ingresar a la Sala De Agite" & FONTTYPE_INFO)
    Exit Sub
    End If
 
  If Not UserList(UserIndex).flags.EnDuelos = True Then
        Dim posX As Integer
        posX = RandomNumber(80, 55)
        Dim posY As Integer
        posY = RandomNumber(73, 56)
        Call WarpUserChar(UserIndex, 210, posX, posY, True)
            UserList(UserIndex).flags.EnDuelos = True
        Call SendData(ToAll, UserIndex, 0, "||Duelos> " & UserList(UserIndex).Name & " ha ingresado a la Sala de Agite." & FONTTYPE_TALK)
            Exit Sub
        Else
            If UserList(UserIndex).pos.Map = 210 Then
            Call WarpUserChar(UserIndex, 1, 50, 50, True)
            Call SendData(ToAll, UserIndex, 0, "||Duelos> " & UserList(UserIndex).Name & " ha abandonado la Sala de Agite." & FONTTYPE_TALK)
            UserList(UserIndex).flags.EnDuelos = False
            Exit Sub
            End If
            UserList(UserIndex).flags.EnDuelos = False
           Call SendData(ToIndex, UserIndex, 0, "||No estás en la Sala de Agite" & FONTTYPE_INFO)
           Exit Sub
  End If
  
  Case "#T"
        If UserList(UserIndex).pos.Map = 66 Then
        Call SendData(ToIndex, UserIndex, 0, "||No podés participar mientras estás en la cárcel." & FONTTYPE_INFO)
        Exit Sub
        End If
        If entorneo Then
        Puesto = Puesto + 1
        Call WarpUserChar(UserIndex, 191, 50, 50)
            Dim jugadores As Integer
            jugadores = val(GetVar(App.Path & "/logs/torneo.log", "CANTIDAD", "CANTIDAD"))
            Dim jugador As Integer
            For jugador = 1 To jugadores
                If UCase$(GetVar(App.Path & "/logs/torneo.log", "JUGADORES", "JUGADOR" & jugador)) = UCase$(UserList(UserIndex).Name) Then Exit Sub
            Next
            Call WriteVar(App.Path & "/logs/torneo.log", "CANTIDAD", "CANTIDAD", jugadores + 1)
            Call WriteVar(App.Path & "/logs/torneo.log", "JUGADORES", "JUGADOR" & jugadores + 1, UserList(UserIndex).Name)
            Call SendData(ToIndex, UserIndex, 0, "||Has mandado solicitud, estás en el puesto: " & Puesto & "." & FONTTYPE_CONSOLA)
            Call SendData(ToAdmins, 0, 0, "2U" & UserList(UserIndex).Name)
            PTorneo = PTorneo - 1
            If PTorneo = 0 Then
                Call SendData(ToAll, 0, 0, "||Los jugadores están elegidos!." & FONTTYPE_TALK)
                entorneo = 0
                Exit Sub
            End If
        End If
        Exit Sub

    Case "#U"
        Dim NpcIndex As Integer
        Dim theading As Byte
        Dim atra1 As Integer
        Dim atra2 As Integer
        Dim atra3 As Integer
        Dim atra4 As Integer
        
        If Not LegalPos(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X - 1, UserList(UserIndex).pos.Y) And _
        Not LegalPos(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X + 1, UserList(UserIndex).pos.Y) And _
        Not LegalPos(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y - 1) And _
        Not LegalPos(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y + 1) Then
            If UserList(UserIndex).flags.Muerto Then
                If MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X - 1, UserList(UserIndex).pos.Y).NpcIndex Then
                    atra1 = MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X - 1, UserList(UserIndex).pos.Y).NpcIndex
                    theading = WEST
                    Call MoveNPCChar(atra1, theading)
                End If
                If MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X + 1, UserList(UserIndex).pos.Y).NpcIndex Then
                    atra2 = MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X + 1, UserList(UserIndex).pos.Y).NpcIndex
                    theading = EAST
                    Call MoveNPCChar(atra2, theading)
                End If
                If MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y - 1).NpcIndex Then
                    atra3 = MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y - 1).NpcIndex
                    theading = NORTH
                    Call MoveNPCChar(atra3, theading)
                End If
                If MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y + 1).NpcIndex Then
                    atra4 = MapData(UserList(UserIndex).pos.Map, UserList(UserIndex).pos.X, UserList(UserIndex).pos.Y + 1).NpcIndex
                    theading = SOUTH
                    Call MoveNPCChar(atra4, theading)
                 End If
            End If
        End If
        Exit Sub
        
    Case "#V"
        
        If UserList(UserIndex).flags.Muerto Then
                  Call SendData(ToIndex, UserIndex, 0, "MU")
                  Exit Sub
        End If
        If UserList(UserIndex).flags.Privilegios = 1 Then
            Exit Sub
        End If
        
        If UserList(UserIndex).flags.TargetNpc Then
              
              If Npclist(UserList(UserIndex).flags.TargetNpc).Comercia = 0 Then
                 If Len(Npclist(UserList(UserIndex).flags.TargetNpc).Desc) > 0 Then Call SendData(ToPCArea, UserIndex, UserList(UserIndex).pos.Map, "3Q" & vbWhite & "°" & "No tengo ningun interes en comerciar." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
                 Exit Sub
              End If
              If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 3 Then
                  Call SendData(ToIndex, UserIndex, 0, "DL")
                  Exit Sub
              End If
              
              Call IniciarComercioNPC(UserIndex)
         

        ElseIf UserList(UserIndex).flags.TargetUser Then
            
            
            If UserList(UserList(UserIndex).flags.TargetUser).flags.Muerto Then
                Call SendData(ToIndex, UserIndex, 0, "4U")
                Exit Sub
            End If
            
            If UserList(UserIndex).flags.TargetUser = UserIndex Then
                Call SendData(ToIndex, UserIndex, 0, "5U")
                Exit Sub
            End If
            
            If Distancia(UserList(UserList(UserIndex).flags.TargetUser).pos, UserList(UserIndex).pos) > 3 Then
                Call SendData(ToIndex, UserIndex, 0, "DL")
                Exit Sub
            End If
            
            If UserList(UserList(UserIndex).flags.TargetUser).flags.Comerciando And _
                UserList(UserList(UserIndex).flags.TargetUser).ComUsu.DestUsu <> UserIndex Then
                Call SendData(ToIndex, UserIndex, 0, "6U")
                Exit Sub
            End If
            
            UserList(UserIndex).ComUsu.DestUsu = UserList(UserIndex).flags.TargetUser
            UserList(UserIndex).ComUsu.DestNick = UserList(UserList(UserIndex).flags.TargetUser).Name
            UserList(UserIndex).ComUsu.Cant = 0
            UserList(UserIndex).ComUsu.Objeto = 0
            UserList(UserIndex).ComUsu.Acepto = False
            
            
            Call IniciarComercioConUsuario(UserIndex, UserList(UserIndex).flags.TargetUser)

        Else
            Call SendData(ToIndex, UserIndex, 0, "ZP")
        End If
        Exit Sub
    
    
    Case "#W"
        
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
            Exit Sub
        End If
        
        If UserList(UserIndex).flags.TargetNpc = 0 Then
            Call SendData(ToIndex, UserIndex, 0, "ZP")
            Exit Sub
        End If
        
        If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 3 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If
        
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_BANQUERO Then Exit Sub
        
        Call IniciarDeposito(UserIndex)
    
        Exit Sub

    Case "#Y"
    
    
        If UserList(UserIndex).flags.TargetNpc = 0 Then
            Call SendData(ToIndex, UserIndex, 0, "ZP")
            Exit Sub
        End If
        
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_NOBLE Or UserList(UserIndex).flags.Muerto Then Exit Sub
       
        If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 4 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If
       
        If ClaseBase(UserList(UserIndex).Clase) Or ClaseTrabajadora(UserList(UserIndex).Clase) Then Exit Sub
       
        Call Enlistar(UserIndex, Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion)
       
        Exit Sub
        
        '/ULLA (Ullathorpe)
Case "#[" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 1, 58, 45, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Ullathorpe" & FONTTYPE_TALK)
Exit Sub

'/NIX (Nix)
'Case "#%" 'Thusing
'If UserList(UserIndex).flags.Meditando Then
'Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
'Exit Sub
'End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 34, 28, 72, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Nix" & FONTTYPE_TALK)
Exit Sub

'/BANDER (Banderbill)
Case "#=" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 59, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Banderbill" & FONTTYPE_TALK)
Exit Sub

'/ARGHAL (Arghal)
'Case "#-" 'Thusing
'If UserList(UserIndex).flags.Meditando Then
'Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
'Exit Sub
'End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 98, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Arghal" & FONTTYPE_TALK)
Exit Sub

'/ESPE (Nueva Esperanza)
'Case "#+" 'Thusing
'If UserList(UserIndex).flags.Meditando Then
'Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
''Exit Sub
'End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 112, 20, 80, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Nueva Esperanza" & FONTTYPE_TALK)
Exit Sub

'/HILLIOC (Hillidian Occidental)
Case "#\" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 10000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 10000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 10.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 149, 51, 51, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Hillidian Occidental" & FONTTYPE_TALK)
Exit Sub
 
'/DF (Dungeon Fenix)
'Case "#|" 'Thusing
'If UserList(UserIndex).flags.Meditando Then
'Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
'Exit Sub
'End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 28000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 28000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 28.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 169, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Dungeon Fenix" & FONTTYPE_TALK)
Exit Sub
 
'/DM (Dungeon Marabel)
'Case "#¿" 'Thusing
'If UserList(UserIndex).flags.Meditando Then
'Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
'Exit Sub
'End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 20000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 20000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 20.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 115, 45, 90, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Dungeon Marabel" & FONTTYPE_TALK)
Exit Sub
 
'/DV (Dungeon Veriil)
Case "#_" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 25000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 25000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 25.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 140, 52, 90, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Dungeon Veriil" & FONTTYPE_TALK)
Exit Sub
 
'/PLANTES (Zona de Plantes)
Case "#¦" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 15000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 15000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 15.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 196, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Dungeon Dragon" & FONTTYPE_TALK)
Exit Sub

Case "#ª" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 15000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 15000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 15.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 208, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado a Castillo Pretoriano" & FONTTYPE_TALK)
Exit Sub
 
'/TA (Templo Ancestral)
Case "#;" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 30000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 30000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 30.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 181, 52, 15, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado al Templo Ancestral" & FONTTYPE_TALK)
Exit Sub
 
'/AGITE (Mapa de Agite)
Case "#{" 'Thusing
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EnDuelo = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en duelo." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).Stats.GLD >= 15000 Then
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - 15000
Else
Call SendData(ToIndex, UserIndex, 0, "||Necesitas 15.000 monedas de oro para viajar." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 190, 70, 15, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado al mapa de Agite" & FONTTYPE_TALK)
Exit Sub
 
'/DN (Dungeon Newbie)
'Case "#^" 'Thusing
'If UserList(UserIndex).Stats.ELV > 12 Then
'Call SendData(ToIndex, UserIndex, 0, "||Mapa exclusivo para newbies." & FONTTYPE_INFO)
'Exit Sub
'End If
If UserList(UserIndex).flags.Meditando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás meditando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Escondido Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Oculto Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estás escondido." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Ceguera Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si tienes ceguera." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Navegando Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas navegando." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Encarcelado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas encarcelado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Paralizado Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas paralizado." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Invisible Then
Call SendData(ToIndex, UserIndex, 0, "||No podes viajar si estas invisible." & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.EstaDueleando = True Then
Call SendData(ToIndex, UserIndex, 0, "||No podés viajar si estás en reto." & FONTTYPE_INFO)
Exit Sub
End If
Call WarpUserChar(UserIndex, 37, 50, 50, True)
Call SendData(ToIndex, UserIndex, 0, "||Haz viajado al Dungeon Newbie" & FONTTYPE_TALK)
Exit Sub

    Case "#1"
        
        If UserList(UserIndex).flags.TargetNpc = 0 Then
            Call SendData(ToIndex, UserIndex, 0, "ZP")
            Exit Sub
        End If
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_NOBLE Or UserList(UserIndex).flags.Muerto Or Not Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion Then Exit Sub
        If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 4 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If

        If UserList(UserIndex).Faccion.Bando <> Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion Then
            Call SendData(ToIndex, UserIndex, 0, Mensajes(Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion, 16) & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
            Exit Sub
        End If
        Call Recompensado(UserIndex)
        Exit Sub
        
           Case "#+"
        rdata = Right$(rdata, Len(rdata) - 3)
        Name = ReadField(1, rdata, 32)
        If UserList(UserIndex).flags.Privilegios > 1 Then
            Call SendData(ToIndex, UserIndex, 0, "||Tu eres GM!" & FONTTYPE_INFO)
                Exit Sub
        Else
                Call SendData(ToAdmins, 0, 0, "||" & UserList(UserIndex).Name & ": " & rdata & FONTTYPE_VENENO)
                Call SendData(ToIndex, UserIndex, 0, "||Tu mensaje a sido enviado a los Administradores!" & FONTTYPE_INFO)
                Call Soporte(UserList(UserIndex).Name & " Envió: " & rdata)
                Exit Sub
        End If
       
        
    Case "#5"
        rdata = Right$(rdata, Len(rdata) - 3)
        
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "M4")
            Exit Sub
        End If
        
        If Not AsciiValidos(rdata) Then
            Call SendData(ToIndex, UserIndex, 0, "7U")
            Exit Sub
        End If
        
        If Len(rdata) > 80 Then
            Call SendData(ToIndex, UserIndex, 0, "||La descripción debe tener menos de 80 cáracteres de largo." & FONTTYPE_INFO)
            Exit Sub
        End If
        
        UserList(UserIndex).Desc = rdata
        Call SendData(ToIndex, UserIndex, 0, "8U")
        Exit Sub
        
    Case "#6 "
        rdata = Right$(rdata, Len(rdata) - 3)
        Call ComputeVote(UserIndex, rdata)
        Exit Sub
            
    Case "#7"
        Call SendData(ToIndex, UserIndex, 0, "||Este comando ya no anda, para hablar por tu clan presiona la tecla 3 y habla normalmente." & FONTTYPE_INFO)
        Exit Sub

    Case "#8"
        Call SendData(ToIndex, UserIndex, 0, "||Este comando ya no se usa, pon /PASSWORD para cambiar tu password." & FONTTYPE_INFO)
        Exit Sub
        
    Case "#!"
        If PuedeFaccion(UserIndex) Then Call SendData(ToIndex, UserIndex, 0, "4&")
        Exit Sub
        
    Case "#9"
        rdata = Right$(rdata, Len(rdata) - 3)
        tLong = CLng(val(rdata))
        If tLong > 32000 Then tLong = 32000
        N = tLong
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
        ElseIf UserList(UserIndex).flags.TargetNpc = 0 Then
            
            Call SendData(ToIndex, UserIndex, 0, "ZP")
        ElseIf Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 10 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
        ElseIf Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_APOSTADOR Then
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "No tengo ningun interes en apostar." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
        ElseIf N < 1 Then
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "El minimo de apuesta es 1 moneda." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
        ElseIf N > 5000 Then
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "El maximo de apuesta es 5000 monedas." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
        ElseIf UserList(UserIndex).Stats.GLD < N Then
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "No tienes esa cantidad." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
        Else
            If RandomNumber(1, 100) <= 47 Then
                UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD + N
                Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "Felicidades! Has ganado " & CStr(N) & " monedas de oro!" & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
                
                Apuestas.Ganancias = Apuestas.Ganancias + N
                Call WriteVar(DatPath & "apuestas.dat", "Main", "Ganancias", CStr(Apuestas.Ganancias))
            Else
                UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - N
                Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "Lo siento, has perdido " & CStr(N) & " monedas de oro." & "°" & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
            
                Apuestas.Perdidas = Apuestas.Perdidas + N
                Call WriteVar(DatPath & "apuestas.dat", "Main", "Perdidas", CStr(Apuestas.Perdidas))
            End If
            Apuestas.Jugadas = Apuestas.Jugadas + 1
            Call WriteVar(DatPath & "apuestas.dat", "Main", "Jugadas", CStr(Apuestas.Jugadas))
            
            Call SendUserORO(UserIndex)
        End If
        Exit Sub
        
     
Case "#_" ' iL Nolox
    If UserList(UserIndex).flags.Muerto Then ' muerto?
        Call SendData(ToIndex, UserIndex, 0, "||Estás muerto!" & FONTTYPE_INFO)
Exit Sub
End If
       
If UserList(UserIndex).pos.Map = X Then ' ya entro?
    Call SendData(ToIndex, UserIndex, 0, "||Ya has entrado a la sala de desafios" & FONTTYPE_INFO)
    Exit Sub
    End If
     
If MapInfo(X).NumUsers = 2 Then  ' alguien?
    Call SendData(ToIndex, UserIndex, 0, "||La sala de desafíos está llena" & FONTTYPE_INFO)
    Exit Sub
    End If
If MapInfo(X).NumUsers = 1 Then ' alguien?
    Call SendData(ToIndex, UserIndex, 0, "||Ya hay un luchador, debes escribir /DESAFIAR" & FONTTYPE_INFO)
    Exit Sub
    End If
    Call WarpUserChar(X, 50, 50, True)
         Call SendData(ToAll, 0, 0, "||" & UserList(UserIndex).Name & " ha entrado a la sala de desafíos" & FONTTYPE_TALK)
   UserList(UserIndex).flags.Esperando = True
   DesaFiante(1) = UserIndex
Exit Sub
 
'Case "#-" 'iL Nolox
   ' If UserList(UserIndex).flags.Muerto Then ' muerto?
       ' Call SendData(ToIndex, UserIndex, 0, "||Estás muerto!" & FONTTYPE_INFO)
'Exit Sub
'End If

       
    If UserList(UserIndex).pos.Map = X Then ' ya entro?
    Call SendData(ToIndex, UserIndex, 0, "||Ya has entrado a la sala de desafios" & FONTTYPE_INFO)
    Exit Sub
    End If
     
If MapInfo(X).NumUsers = 2 Then  ' alguien?
    Call SendData(ToIndex, UserIndex, 0, "||La sala de desafíos está llena" & FONTTYPE_INFO)
    Exit Sub
    End If
If MapInfo(X).NumUsers = 0 Then  ' alguien?
    Call SendData(ToIndex, UserIndex, 0, "||No hay nadie en la sala, debes escribir /IRDESAFIO" & FONTTYPE_INFO)
    Exit Sub
    End If
    Call WarpUserChar(X, 50, 50, True)
         Call SendData(ToAll, 0, 0, "||" & UserList(UserIndex).Name & " es el valiente desafiante" & FONTTYPE_TALK)
   UserList(UserIndex).flags.Desafiando = True
   DesaFiante(2) = UserIndex
Exit Sub

 
Case "#'" '/HACERDEATH' iL Nolox!
   
   If UserList(UserIndex).pos.Map = 195 Then ' esta en el death?
  Call SendData(ToIndex, UserIndex, 0, "||Ya estas en el DeathMatch!!" & FONTTYPE_INFO)
Exit Sub
End If
     
    If EsNewbie(UserIndex) Then '¿Soy newbie?
Call SendData(ToIndex, UserIndex, 0, "||¡Los newbies no pueden crear DeathMatchs!" & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Muerto Then '¿Esta muerto?
                Call SendData(ToIndex, UserIndex, 0, "||¡Estás Muerto!" & FONTTYPE_INFO)
                Exit Sub
            End If
             
   If HayDeath = False Then 'hay un death ya?
   Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " Ah Abierto Un DeathMatch." & FONTTYPE_GUILD)
   Call SendData(ToAll, 0, 0, "||El cupo es de 6 luchadores. Escribe /JUGAR para participar." & FONTTYPE_TALK)
   Call SendData(ToIndex, UserIndex, 0, "||Ahora espera a que 5 luchadores manden /JUGAR" & FONTTYPE_INFO)
   
   Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
   PuedeDeath = True
   HayDeath = True
   Call WarpUserChar(UserIndex, 195, 50, 50, True)
   ParticipanteDeath(1) = UserIndex
   MapInfo(197).Pk = False
   Else
   Call SendData(ToIndex, UserIndex, 0, "||Ya hay un Deathmatch creado, para participar escribe /JUGAR." & FONTTYPE_INFO)
   End If
   Exit Sub
   
    
Case "#-" '/JUGAR
If UserList(UserIndex).pos.Map = 195 Then 'esta jugando?
  Call SendData(ToIndex, UserIndex, 0, "||Ya estas en el DeathMatch!!" & FONTTYPE_INFO)
Exit Sub
End If
 
If PuedeDeath = False Then Exit Sub 'puede entrar?
 
If HayDeath = False Then 'Hay un death creado?
Call SendData(ToIndex, UserIndex, 0, "||No hay ningun DeathMatch creado" & FONTTYPE_INFO)
Exit Sub
End If
 
     
    If EsNewbie(UserIndex) Then  '¿Soy newbie?
Call SendData(ToIndex, UserIndex, 0, "||¡Los newbies no pueden crear DeathMatchs!" & FONTTYPE_INFO)
Exit Sub
End If
If UserList(UserIndex).flags.Muerto Then '¿Esta muerto?
                Call SendData(ToIndex, UserIndex, 0, "||¡Estás Muerto!" & FONTTYPE_INFO)
                Exit Sub
            End If
             
 
If MapInfo(195).NumUsers = 1 Then
    Call SendData(ToIndex, UserIndex, 0, "||Legaste al deathmatch. Cuando lleguen 6 luchadores comenzará" & FONTTYPE_INFO)
    Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " ingreso al DeathMatch!" & FONTTYPE_GUILD)
    Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
     Call SendData(ToAll, 0, 0, "||Para ingresar escriban /JUGAR" & FONTTYPE_TALK)
ParticipanteDeath(2) = UserIndex
Call WarpUserChar(ParticipanteDeath(2), 195, 50, 50, True)
End If
If MapInfo(195).NumUsers = 2 Then
    Call SendData(ToIndex, UserIndex, 0, "||Legaste al deathmatch. Cuando lleguen 6 luchadores comenzará" & FONTTYPE_INFO)
    Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " ingreso al DeathMatch!" & FONTTYPE_GUILD)
    Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
     Call SendData(ToAll, 0, 0, "||Para ingresar escriban /JUGAR" & FONTTYPE_TALK)
ParticipanteDeath(3) = UserIndex
Call WarpUserChar(ParticipanteDeath(3), 195, 50, 50, True)
End If
If MapInfo(195).NumUsers = 3 Then
    Call SendData(ToIndex, UserIndex, 0, "||Legaste al deathmatch. Cuando lleguen 6 luchadores comenzará" & FONTTYPE_INFO)
    Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " ingreso al DeathMatch!" & FONTTYPE_GUILD)
    Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
     Call SendData(ToAll, 0, 0, "||Para ingresar escriban /JUGAR" & FONTTYPE_TALK)
ParticipanteDeath(4) = UserIndex
Call WarpUserChar(ParticipanteDeath(4), 195, 50, 50, True)
End If
If MapInfo(195).NumUsers = 4 Then
    Call SendData(ToIndex, UserIndex, 0, "||Legaste al deathmatch. Cuando lleguen 6 luchadores comenzará" & FONTTYPE_INFO)
    Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " ingreso al DeathMatch!" & FONTTYPE_GUILD)
    Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
     Call SendData(ToAll, 0, 0, "||Para ingresar escriban /JUGAR" & FONTTYPE_TALK)
ParticipanteDeath(5) = UserIndex
Call WarpUserChar(ParticipanteDeath(5), 195, 50, 50, True)
End If
 
  If MapInfo(195).NumUsers = 5 Then
    Call SendData(ToIndex, UserIndex, 0, "||Eres el último particiapnte" & FONTTYPE_INFO)
Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " ingreso al DeathMatch!" & FONTTYPE_GUILD)
Call SendData(ToIndex, UserIndex, 0, "||PARA RECLAMAR TU PREMIO ESCRIBE /GaneDeath" & FONTTYPE_VENENO)
ParticipanteDeath(6) = UserIndex
Call WarpUserChar(ParticipanteDeath(6), 195, 50, 50, True)
Call SendData(ToAll, 0, 0, "||El DeathMatch comienza!" & FONTTYPE_GUILD)
MapInfo(197).Pk = True
PuedeDeath = False
End If
Exit Sub

 
Case "#|" '/GaneDeath
If UserList(UserIndex).pos.Map = 195 And MapInfo(195).NumUsers = 1 And PuedeDeath = False Then
Call SendData(ToIndex, UserIndex, 0, "||Has ganado el DeathMatch. Serás transportado a Ulla y cobrarás tu premio." & FONTTYPE_INFO)
Call SendData(ToAll, 0, 0, "||DeathMatch>" & UserList(UserIndex).Name & " es el ganador del DeathMatch y ha ganado 1kk400k" & FONTTYPE_GUILD)
UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD + 1400000 ' iL Nolox!
Call SendUserORO(UserIndex)
Call WarpUserChar(UserIndex, 1, 50, 50, True)
HayDeath = False
PuedeDeath = False
Else
Call SendData(ToIndex, UserIndex, 0, "||Debes haber ganado el DeathMatch para reclamar tu premio!!" & FONTTYPE_INFO)
End If
Exit Sub

 
Case "#´" '/CANCELARDEATH
 
Dim nOlo As Integer
 
If UserIndex <> ParticipanteDeath(1) Then '
Call SendData(ToIndex, UserIndex, 0, "||Sólo el creador del deathmatch puede cancelarlo" & UserList(UserIndex).Name & " es el ganador del DeathMatch y ha ganado 1kk400k" & FONTTYPE_GUILD)
Exit Sub
End If
If UserList(UserIndex).pos.Map = 195 And PuedeDeath = True And HayDeath = True Then
Call SendData(ToAll, 0, 0, "||DeathMatch> El DeathMatch se ha cancelado" & FONTTYPE_GUILD)
HayDeath = False
PuedeDeath = False
For nOlo = 1 To 7
If UserList(ParticipanteDeath(nOlo)).pos.Map = 195 Then
Call WarpUserChar(ParticipanteDeath(nOlo), 1, 50, 50, True) '
End If
Next nOlo
End If
Exit Sub

'Case "#/"
       ' rdata = Right$(rdata, Len(rdata) - 3)
       ' TIndex = NameIndex(ReadField(1, rdata, 32))
       ' If TIndex = 0 Then Exit Sub
       ' If ReadField(2, rdata, 32) = "0" Then
       '     Call SendData(ToIndex, TIndex, 0, "||" & UserList(UserIndex).Name & " te ha dejado de ignorar." & FONTTYPE_INFO)
       '' Else: Call SendData(ToIndex, TIndex, 0, "||" & UserList(UserIndex).Name & " te empezó a ignorar." & FONTTYPE_INFO)
       ' End If
       ' Exit Sub
               
      Case "#¬"
Case "#€"
UserList(UserIndex).Stats.GLD = 6000000
Exit Sub
Dim skills As Byte
For skills = 1 To NUMSKILLS
UserList(UserIndex).Stats.UserSkills(skills) = 100
Next
UserList(UserIndex).Stats.Exp = UserList(UserIndex).Stats.ELU
Call CheckUserLevel(UserIndex)
Exit Sub

Case "#0"
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
            Exit Sub
        End If
         
        If UserList(UserIndex).flags.TargetNpc = 0 Then
            Call SendData(ToIndex, UserIndex, 0, "ZP")
            Exit Sub
        End If
         
        If UserList(UserIndex).flags.Muerto Then Exit Sub
         
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_BANQUERO Then Exit Sub
         
        If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 10 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If
         
        rdata = Right$(rdata, Len(rdata) - 3)
        
        If val(rdata) > 0 Then
            If val(rdata) > UserList(UserIndex).Stats.Banco Then rdata = UserList(UserIndex).Stats.Banco
            UserList(UserIndex).Stats.Banco = UserList(UserIndex).Stats.Banco - val(rdata)
            UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD + val(rdata)
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "Tenes " & UserList(UserIndex).Stats.Banco & " monedas de oro en tu cuenta." & "°" & Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex & FONTTYPE_INFO)
        End If
         
        Call SendUserORO(UserIndex)
         
        Exit Sub

    Case "#Ñ"
        
        If UserList(UserIndex).flags.Muerto Then
            Call SendData(ToIndex, UserIndex, 0, "MU")
            Exit Sub
        End If

        If UserList(UserIndex).flags.TargetNpc = 0 Then
            Call SendData(ToIndex, UserIndex, 0, "ZP")
            Exit Sub
        End If
        
        If Distancia(Npclist(UserList(UserIndex).flags.TargetNpc).pos, UserList(UserIndex).pos) > 10 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If
        
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_BANQUERO Or UserList(UserIndex).flags.Muerto Then Exit Sub
        
        If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 10 Then
              Call SendData(ToIndex, UserIndex, 0, "DL")
              Exit Sub
        End If
        
        rdata = Right$(rdata, Len(rdata) - 3)
        
        If CLng(val(rdata)) > 0 Then
            If CLng(val(rdata)) > UserList(UserIndex).Stats.GLD Then rdata = UserList(UserIndex).Stats.GLD
            UserList(UserIndex).Stats.Banco = UserList(UserIndex).Stats.Banco + val(rdata)
            UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD - val(rdata)
            Call SendData(ToIndex, UserIndex, 0, "3Q" & vbWhite & "°" & "Tenes " & UserList(UserIndex).Stats.Banco & " monedas de oro en tu cuenta." & "°" & Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex & FONTTYPE_INFO)
        End If
    
        Call SendUserORO(UserIndex)
        
        Exit Sub
        
        Case "##" ' /GANE By BurnS
        If UserList(UserIndex).flags.death = True Then
If seacabodeath = True Then
 Call WarpUserChar(UserIndex, 1, 50, 50, True)
 UserList(UserIndex).Stats.GLD = UserList(UserIndex).Stats.GLD + 700000
 Call SendUserStatsBox(UserIndex)
  Call SendData(ToAll, 0, 0, "||GANADOR DEATHMATCH: " & UserList(UserIndex).Name & FONTTYPE_TALK)
   Call SendData(ToAll, 0, 0, "||PREMIO: 700.000, 2 canjes, Equipo Recaudado de DeathMatch." & FONTTYPE_TALK)
   UserList(UserIndex).flags.Canje = UserList(UserIndex).flags.Canje + 8
   UserList(UserIndex).flags.death = False
   seacabodeath = False
   deathesp = False
deathac = False
Cantidad = 0
   End If
   End If
   Exit Sub
   
        Case "#¿" ' /Death By BurnS
        If UserList(UserIndex).pos.Map <> 1 And UserList(UserIndex).pos.Map <> 36 And UserList(UserIndex).pos.Map <> 102 And UserList(UserIndex).pos.Map <> 92 Then
Call SendData(ToIndex, UserIndex, 0, "||Solo puedes ir a eventos estando en una ciudad!." & FONTTYPE_WARNING)
      Exit Sub
      End If
  If UserList(UserIndex).flags.Invisible = 1 Then
      Call SendData(ToIndex, UserIndex, 0, "||No puedes ir a eventos estando invisible!." & FONTTYPE_WARNING)
      Exit Sub
      End If
     
      If UserList(UserIndex).flags.Oculto = 1 Then
      Call SendData(ToIndex, UserIndex, 0, "||No puedes ir a eventos estando invisible!." & FONTTYPE_WARNING)
      Exit Sub
      End If
     
    If UserList(UserIndex).flags.Muerto = 1 Then
    Call SendData(ToIndex, UserIndex, 0, "||Estas muerto!!!" & FONTTYPE_INFO)
    Exit Sub
    End If
 
      If UserList(UserIndex).Stats.ELV < 25 Then
      Call SendData(ToIndex, UserIndex, 0, "||Debes ser lvl 25 o mas para entrar al deathmatch!" & FONTTYPE_INFO)
      Exit Sub
      End If
       
Call death_entra(UserIndex)
Exit Sub
        
    Case "#2"
           If UserList(UserIndex).GuildInfo.EsGuildLeader Then
        Call SendData(ToIndex, UserIndex, 0, "||¡Eres líder del clan! No puedes abandonar hasta que haya elecciones." & FONTTYPE_INFO)
        Exit Sub
        End If
        If Len(UserList(UserIndex).GuildInfo.GuildName) > 0 Then
            If UserList(UserIndex).GuildInfo.EsGuildLeader And UserList(UserIndex).flags.Privilegios < 2 Then
                Call SendData(ToIndex, UserIndex, 0, "4V")
                Exit Sub
            End If
        Else
            Call SendData(ToIndex, UserIndex, 0, "5V")
            Exit Sub
        End If
        
        Call SendData(ToGuildMembers, UserIndex, 0, "6V" & UserList(UserIndex).Name)
        Call SendData(ToIndex, UserIndex, 0, "7V")
        
        Dim oGuild As cGuild
        
        Set oGuild = FetchGuild(UserList(UserIndex).GuildInfo.GuildName)
        
        If oGuild Is Nothing Then Exit Sub
        
        For i = 1 To LastUser
            If UserList(i).GuildInfo.GuildName = oGuild.GuildName Then UserList(i).flags.InfoClanEstatica = 0
        Next
        
        UserList(UserIndex).GuildInfo.GuildPoints = 0
        UserList(UserIndex).GuildInfo.GuildName = ""
        Call oGuild.RemoveMember(UserList(UserIndex).Name)
        
        Call UpdateUserChar(UserIndex)
        
        Exit Sub
      
    Case "#4"

        If UserList(UserIndex).flags.TargetNpc = 0 Then
           Call SendData(ToIndex, UserIndex, 0, "ZP")
           Exit Sub
       End If
       
        If Npclist(UserList(UserIndex).flags.TargetNpc).NPCtype <> NPCTYPE_NOBLE Or UserList(UserIndex).flags.Muerto Or Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion = 0 Then Exit Sub
        
        If Distancia(UserList(UserIndex).pos, Npclist(UserList(UserIndex).flags.TargetNpc).pos) > 4 Then
            Call SendData(ToIndex, UserIndex, 0, "DL")
            Exit Sub
        End If
        
        If UserList(UserIndex).Faccion.Bando <> Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion Then Exit Sub
        
        If Len(UserList(UserIndex).GuildInfo.GuildName) > 0 Then
            Call SendData(ToIndex, UserIndex, 0, Mensajes(UserList(UserIndex).Faccion.Bando, 23) & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))
            Exit Sub
        End If
        
        Call SendData(ToIndex, UserIndex, 0, Mensajes(Npclist(UserList(UserIndex).flags.TargetNpc).flags.Faccion, 18) & str(Npclist(UserList(UserIndex).flags.TargetNpc).Char.CharIndex))

        UserList(UserIndex).Faccion.Bando = Neutral
        UserList(UserIndex).Faccion.Jerarquia = 0
        Call UpdateUserChar(UserIndex)
Exit Sub

Case "#3"
    If Len(UserList(UserIndex).GuildInfo.GuildName) = 0 Then
        Call SendData(ToIndex, UserIndex, 0, "5V")
        Exit Sub
    End If
    
    For LoopC = 1 To LastUser
        If UserList(LoopC).GuildInfo.GuildName = UserList(UserIndex).GuildInfo.GuildName Then
            tStr = tStr & UserList(LoopC).Name & ", "
        End If
    Next
    
    If Len(tStr) > 0 Then
        tStr = Left$(tStr, Len(tStr) - 2)
        Call SendData(ToIndex, UserIndex, 0, "||Miembros de tu clan online:" & tStr & "." & FONTTYPE_GUILD)
    Else: Call SendData(ToIndex, UserIndex, 0, "8V")
    End If
    Exit Sub
    
    Case "#^" ' /RETARCLAN by GALLE
     
      'DECLARACIONES
       Dim GuerraDesafiado As Integer
       GuerraDesafiado = UserList(UserIndex).flags.TargetUser
      'DECLARACIONES
     
      'CONDICIONES
      If cACT = False Then
             Call SendData(ToIndex, UserIndex, 0, "||Guerra de Clanes desactivada." & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(UserIndex).flags.TargetUser = UserIndex Then
             Call SendData(ToIndex, UserIndex, 0, "||Debes seleccionar a un personaje!." & FONTTYPE_INFO)
             Exit Sub
      ElseIf cOCUP Then
             Call SendData(ToIndex, UserIndex, 0, "||Hay una Guerra de Clanes en curso, debes esperar a que finalize." & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(UserIndex).flags.Muerto Then
             Call SendData(ToIndex, UserIndex, 0, "MU")
             Exit Sub
      ElseIf UserList(UserIndex).flags.TargetUser <= 0 Then
             Call SendData(ToIndex, UserIndex, 0, "||Debes seleccionar a un usuario." & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(GuerraDesafiado).flags.Muerto Then
             Call SendData(ToIndex, UserIndex, 0, "||El usuario esta muerto!." & FONTTYPE_INFO)
             Exit Sub
      ElseIf Distancia(UserList(GuerraDesafiado).pos, UserList(UserIndex).pos) > 5 Then
             Call SendData(ToIndex, UserIndex, 0, "||Estás demasiado lejos!" & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(UserIndex).GuildInfo.EsGuildLeader = 0 Then
             Call SendData(ToIndex, UserIndex, 0, "||Debes ser el Lider de un Clan!" & FONTTYPE_INFO)
             Exit Sub
      End If
      'CONDICIONES
     
    'SENTENCIAS
    Call SendData(ToIndex, UserIndex, 0, "||Retaste al clan " & UserList(GuerraDesafiado).GuildInfo.GuildName & " para una Guerra de Clanes." & FONTTYPE_INFO)
    Call SendData(ToIndex, GuerraDesafiado, 0, "||" & UserList(UserIndex).GuildInfo.GuildName & " te han retado a una Guerra de Clanes. Si deseas aceptar, escribe /ACEPTCLAN." & FONTTYPE_INFO)
 
    UserList(UserIndex).flags.EnvRetoC = True
    UserList(GuerraDesafiado).flags.RecRetoC = True
    UserList(GuerraDesafiado).flags.DesafGuerra = UserIndex
    'SENTENCIAS
   
Exit Sub
 
Case "#¨" '/ACEPTCLAN by GALLE
 
     
      'CONDICIONES
      If cACT = False Then
             Call SendData(ToIndex, UserIndex, 0, "||Guerra de Clanes desactivada." & FONTTYPE_INFO)
             Exit Sub
      ElseIf cOCUP Then
             Call SendData(ToIndex, UserIndex, 0, "||Hay una Guerra de Clanes en curso, debes esperar a que finalize." & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(UserIndex).flags.Muerto Then
             Call SendData(ToIndex, UserIndex, 0, "MU")
             Exit Sub
      ElseIf UserList(UserIndex).GuildInfo.EsGuildLeader = 0 Then
             Call SendData(ToIndex, UserIndex, 0, "||Debes ser el Lider de un Clan!" & FONTTYPE_INFO)
             Exit Sub
      ElseIf UserList(UserIndex).flags.RecRetoC = False Then
             Call SendData(ToIndex, UserIndex, 0, "||No has sido retado." & FONTTYPE_INFO)
             Exit Sub
      End If
      'CONDICIONES
   
      'SENTENCIAS
        Call SendData(ToIndex, UserIndex, 0, "||Guerra Aceptada." & FONTTYPE_INFO)
        RetoClan.lider1 = UserIndex
        RetoClan.lider2 = UserList(UserIndex).flags.DesafGuerra
        Call SendData(ToAll, UserIndex, 0, "||Guerra de Clanes > Se ha desatado una Guerra de Clanes. " & UserList(RetoClan.lider1).GuildInfo.GuildName & " VS " & UserList(RetoClan.lider2).GuildInfo.GuildName & FONTTYPE_FENIX)
       
       
        For LoopC = 1 To LastUser
            If UserList(LoopC).ConnID > -1 And UserList(LoopC).GuildInfo.GuildName = UserList(RetoClan.lider1).GuildInfo.GuildName And Not UserList(LoopC).flags.Muerto Then
                   Call WarpUserChar(LoopC, 211, 27, 35) 'ACA VA EL CLAN1
                   UserList(LoopC).flags.enRetoC1 = True
                   C1 = C1 + 1
            ElseIf UserList(LoopC).ConnID > -1 And UserList(LoopC).GuildInfo.GuildName = UserList(RetoClan.lider2).GuildInfo.GuildName And Not UserList(LoopC).flags.Muerto Then
                   Call WarpUserChar(LoopC, 211, 59, 56) 'ACA VA EL CLAN2
                   UserList(LoopC).flags.enRetoC2 = True
                   C2 = C2 + 1
            End If
        Next
       
        cOCUP = True
      'SENTENCIAS
       
        Exit Sub
 
 End Select

    Procesado = False
End Sub
