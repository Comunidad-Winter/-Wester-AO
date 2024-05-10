VERSION 5.00
Begin VB.Form frmConectar 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   Caption         =   "Argentum Online"
   ClientHeight    =   8985
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11985
   ClipControls    =   0   'False
   FillColor       =   &H00000040&
   Icon            =   "frmConnect.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   Picture         =   "frmConnect.frx":000C
   ScaleHeight     =   599
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   799
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox Check1 
      Caption         =   "Check1"
      Height          =   195
      Left            =   5640
      TabIndex        =   4
      Top             =   5400
      Width           =   135
   End
   Begin VB.TextBox txtPass 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   405
      IMEMode         =   3  'DISABLE
      Left            =   5040
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   3720
      Width           =   1905
   End
   Begin VB.TextBox txtUser 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   405
      Left            =   5040
      MaxLength       =   20
      TabIndex        =   0
      Top             =   2400
      Width           =   1905
   End
   Begin VB.Label Dejarderecordar 
      Caption         =   "Dejar De Recordar"
      Height          =   255
      Left            =   11880
      TabIndex        =   3
      Top             =   8880
      Width           =   1455
   End
   Begin VB.Label GuardarCuenta 
      Caption         =   "Recordar Personaje"
      Height          =   255
      Left            =   5880
      TabIndex        =   2
      Top             =   5400
      Width           =   1455
   End
   Begin VB.Image Image2 
      Height          =   720
      Left            =   4560
      MouseIcon       =   "frmConnect.frx":2C423
      MousePointer    =   99  'Custom
      Top             =   360
      Width           =   3240
   End
   Begin VB.Image imgWeb 
      Height          =   660
      Left            =   3600
      MouseIcon       =   "frmConnect.frx":2C72D
      MousePointer    =   99  'Custom
      Top             =   8040
      Width           =   4920
   End
   Begin VB.Image imgGetPass 
      Height          =   555
      Left            =   4920
      MouseIcon       =   "frmConnect.frx":2CA37
      MousePointer    =   99  'Custom
      Top             =   6360
      Width           =   2385
   End
   Begin VB.Image Image1 
      Height          =   675
      Index           =   0
      Left            =   2760
      MouseIcon       =   "frmConnect.frx":2CD41
      MousePointer    =   99  'Custom
      Top             =   6120
      Width           =   1545
   End
   Begin VB.Image Image1 
      Height          =   540
      Index           =   1
      Left            =   5280
      MouseIcon       =   "frmConnect.frx":2D04B
      MousePointer    =   99  'Custom
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Image Image1 
      Height          =   435
      Index           =   2
      Left            =   7920
      MouseIcon       =   "frmConnect.frx":2D355
      MousePointer    =   99  'Custom
      Top             =   6240
      Width           =   1665
   End
End
Attribute VB_Name = "frmConectar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Option Explicit

Private Sub Dejarderecordar_Click()

Call WriteVar(App.Path & "\INIT\Cuentas.ini", "Nick", "Name", "")
Call WriteVar(App.Path & "\INIT\Cuentas.ini", "Password", "Pass", "")

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

If KeyAscii = vbKeyReturn Then
    Call PlayWaveDS(SND_CLICK)
            
    If frmPrincipal.Socket1.Connected Then frmPrincipal.Socket1.Disconnect
    
    If frmConectar.MousePointer = 11 Then
    frmConectar.MousePointer = 1
        Exit Sub
    End If
    
    
    UserName = txtUser.Text
    Dim aux As String
    aux = txtPass.Text
    UserPassword = MD5String(aux)
    If CheckUserData(False) = True Then
        frmPrincipal.Socket1.HostName = IPdelServidor
        frmPrincipal.Socket1.RemotePort = PuertoDelServidor
        
        EstadoLogin = Normal
        Me.MousePointer = 11
        frmPrincipal.Socket1.Connect
    End If
End If

End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 27 Then
    frmCargando.Show
    frmCargando.Refresh
    AddtoRichTextBox frmCargando.Status, "Cerrando WesterAo.", 255, 150, 50, 1, 0, 1
    
    Call SaveGameini
    frmConectar.MousePointer = 1
    frmPrincipal.MousePointer = 1
    prgRun = False
    
    AddtoRichTextBox frmCargando.Status, "Liberando recursos..."
    frmCargando.Refresh
    LiberarObjetosDX
    AddtoRichTextBox frmCargando.Status, "Hecho", 255, 150, 50, 1, 0, 1
    AddtoRichTextBox frmCargando.Status, "¡¡Gracias por jugar WesterAo!!", 255, 150, 50, 1, 0, 1
    frmCargando.Refresh
    Call UnloadAllForms
End If

End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)


If KeyCode = vbKeyI And Shift = vbCtrlMask Then
    
    

    
    
    


    
    
    KeyCode = 0
    Exit Sub
End If

End Sub

Private Sub Form_Load()
    
    EngineRun = False
    
    
 Dim j
 For Each j In Image1()
    j.Tag = "0"
 Next

 IntervaloPaso = 0.19
 IntervaloUsar = 0.14
 Picture = LoadPicture(DirGraficos & "conectar.jpg")

txtUser.Text = GetVar(App.Path & "\INIT\Cuentas.ini", "Nick", "Name")
txtPass.Text = GetVar(App.Path & "\INIT\Cuentas.ini", "Password", "Pass")


 
 
 
 
 
 

End Sub

Private Sub Image1_Click(Index As Integer)

CurServer = 0

Call PlayWaveDS(SND_CLICK)

If Check1.value = 1 Then
Call WriteVar(App.Path & "\INIT\Cuentas.ini", "Nick", "Name", txtUser.Text)
Call WriteVar(App.Path & "\INIT\Cuentas.ini", "Password", "Pass", txtPass.Text)
End If

Select Case Index
    Case 0

        If Musica = 0 Then
            CurMidi = DirMidi & "7.mid"
            LoopMidi = 1
            Call CargarMIDI(CurMidi)
            Call Play_Midi
        End If

       
        EstadoLogin = dados
        frmPrincipal.Socket1.HostName = IPdelServidor
        frmPrincipal.Socket1.RemotePort = PuertoDelServidor
        Me.MousePointer = 11
        frmPrincipal.Socket1.Connect
        
    Case 1
        
        If frmPrincipal.Socket1.Connected Then frmPrincipal.Socket1.Disconnect
        
        If frmConectar.MousePointer = 11 Then
        frmConectar.MousePointer = 1
            Exit Sub
        End If
        
        
        
        UserName = txtUser.Text
        Dim aux As String
        aux = txtPass.Text
        UserPassword = MD5String(aux)
        If CheckUserData(False) = True Then
            frmPrincipal.Socket1.HostName = IPdelServidor
            frmPrincipal.Socket1.RemotePort = PuertoDelServidor
            
            EstadoLogin = Normal
            Me.MousePointer = 11
            frmPrincipal.Socket1.Connect
        End If
        
Case 2
If frmPrincipal.Socket1.Connected Then frmPrincipal.Socket1.Disconnect
     
If frmConectar.MousePointer = 11 Then
frmConectar.MousePointer = 1
Exit Sub
End If
     
frmPrincipal.Socket1.HostName = IPdelServidor
frmPrincipal.Socket1.RemotePort = PuertoDelServidor
EstadoLogin = BorrarPj
Me.MousePointer = 11
frmPrincipal.Socket1.Connect

End Select

End Sub
Private Sub Image2_Click()

MsgBox "Created By WesterAo Team." & vbCrLf & "Copyright © 2009. Todos los derechos reservados." & vbCrLf & vbCrLf & "Web: http://www.Wester-Ao.jimdo.com" & vbCrLf & vbCrLf & "¡Gracias por Jugar nuestro Argentum Online!" & vbCrLf & "Staff WesterAo.", vbInformation, "Proyecto Flamius"

End Sub
Private Sub imgGetPass_Click()
     
If frmPrincipal.Socket1.Connected Then frmPrincipal.Socket1.Disconnect
     
If frmConectar.MousePointer = 11 Then
frmConectar.MousePointer = 1
Exit Sub
End If
     
frmPrincipal.Socket1.HostName = IPdelServidor
frmPrincipal.Socket1.RemotePort = PuertoDelServidor
EstadoLogin = RecuperarPass
Me.MousePointer = 11
frmPrincipal.Socket1.Connect
    
End Sub
Private Sub imgWeb_Click()

Call ShellExecute(Me.hwnd, "open", "http://www.Wester-Ao.jimdo.com", "", "", 1)

End Sub


