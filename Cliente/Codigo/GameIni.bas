Attribute VB_Name = "GameIni"
'F�nixAO 1.0
'
'Based on Argentum Online 0.99z
'Copyright (C) 2002 M�rquez Pablo Ignacio
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
'Calle 3 n�mero 983 piso 7 dto A
'La Plata - Pcia, Buenos Aires - Republica Argentina
'C�digo Postal 1900
'Pablo Ignacio M�rquez
'
'Argentum Online is based on Baronsoft's VB6 Online RPG
'You can contact the original creator of ORE at aaron@baronsoft.com
'for more information about ORE please visit http://www.baronsoft.com/
'
'You can contact me at:
'elpresi@fenixao.com.ar
'www.fenixao.com.ar

Option Explicit

Public Type tCabecera
    desc As String * 255
    CRC As Long
    MagicWord As Long
End Type

Public Type tGameIni
    Puerto As Long
    Musica As Byte
    FX As Byte
    tip As Byte
    Password As String
    name As String
    DirGraficos As String
    DirSonidos As String
    DirMusica As String
    DirMapas As String
    NumeroDeBMPs As Long
    NumeroMapas As Integer
End Type


    Public Type tRenderMods
        sName      As String * 7
        bUseVideo  As Long
        bNoCostas  As Long
        bUseMMX    As Long
        bNoAlpha   As Long
        bNoTScan   As Long
        bNoMusic   As Long
        bNoSound   As Long
        iImageSize As Long
    End Type
    
    Public Type AutoUpdate
        version As Long
        Fase As Byte
    End Type
    
    Public RenderMod As tRenderMods


Public AutoTorneo As Integer
Public MiCabecera As tCabecera
Public Config_Inicio As tGameIni
Public AUpdate As AutoUpdate
Public Sub EscribirUpdate(ByRef Update As AutoUpdate)
Dim n As Integer
n = FreeFile
Open App.Path & "\init\AutoUpdate.con" For Binary As #n

Put #n, , Update
Close #n
End Sub
Public Function LeerAutoUpdate() As AutoUpdate
Dim n As Integer
Dim Up As AutoUpdate
n = FreeFile
Open App.Path & "\init\AutoUpdate.con" For Binary As #n

Get #n, , Up

Close #n
LeerAutoUpdate = Up
End Function
Public Sub IniciarCabecera(ByRef Cabecera As tCabecera)
Cabecera.desc = "Argentum Online by Noland Studios. Copyright Noland-Studios 2001, pablomarquez@noland-studios.com.ar"
Cabecera.CRC = Rnd * 100
Cabecera.MagicWord = Rnd * 10
End Sub

Public Function LeerGameIni() As tGameIni
Dim n As Integer
Dim GameIni As tGameIni
n = FreeFile
Open App.Path & "\init\Inicio.con" For Binary As #n
Get #n, , MiCabecera

Get #n, , GameIni

Close #n
LeerGameIni = GameIni
End Function

Public Sub EscribirGameIni(ByRef GameIniConfiguration As tGameIni)
Dim n As Integer
n = FreeFile
Open App.Path & "\init\Inicio.con" For Binary As #n
Put #n, , MiCabecera
Put #n, , GameIniConfiguration
Close #n
End Sub

