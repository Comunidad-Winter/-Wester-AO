VERSION 5.00
Begin VB.Form frmGuildBrief 
   BorderStyle     =   0  'None
   Caption         =   "Detalles del Clan"
   ClientHeight    =   7650
   ClientLeft      =   0
   ClientTop       =   -105
   ClientWidth     =   7635
   ControlBox      =   0   'False
   FillColor       =   &H00FFFFFF&
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7650
   ScaleWidth      =   7635
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Desc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000006&
      ForeColor       =   &H00FFFFFF&
      Height          =   855
      Left            =   600
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   17
      Top             =   5760
      Width           =   6495
   End
   Begin VB.Image aliado 
      Height          =   375
      Left            =   3000
      MouseIcon       =   "frmGuildBrief.frx":0000
      MousePointer    =   99  'Custom
      Top             =   6960
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Image command3 
      Height          =   375
      Left            =   4680
      MouseIcon       =   "frmGuildBrief.frx":030A
      MousePointer    =   99  'Custom
      Top             =   6960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Image guerra 
      Height          =   375
      Left            =   1200
      MouseIcon       =   "frmGuildBrief.frx":0614
      MousePointer    =   99  'Custom
      Top             =   6960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Image command1 
      Height          =   375
      Left            =   0
      MouseIcon       =   "frmGuildBrief.frx":091E
      MousePointer    =   99  'Custom
      Top             =   7320
      Width           =   855
   End
   Begin VB.Image command2 
      Height          =   255
      Left            =   4920
      MouseIcon       =   "frmGuildBrief.frx":0C28
      MousePointer    =   99  'Custom
      Top             =   6960
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label nombre 
      BackStyle       =   0  'Transparent
      Caption         =   "Nombre:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   16
      Top             =   600
      Width           =   5535
   End
   Begin VB.Label fundador 
      BackStyle       =   0  'Transparent
      Caption         =   "Fundador:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   15
      Top             =   840
      Width           =   5415
   End
   Begin VB.Label creacion 
      BackStyle       =   0  'Transparent
      Caption         =   "Fecha de creacion:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   14
      Top             =   1080
      Width           =   4335
   End
   Begin VB.Label lider 
      BackStyle       =   0  'Transparent
      Caption         =   "Lider:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   13
      Top             =   1320
      Width           =   5745
   End
   Begin VB.Label web 
      BackStyle       =   0  'Transparent
      Caption         =   "Web site:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   12
      Top             =   1560
      Width           =   5265
   End
   Begin VB.Label Miembros 
      BackStyle       =   0  'Transparent
      Caption         =   "Miembros:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   11
      Top             =   1800
      Width           =   5355
   End
   Begin VB.Label eleccion 
      BackStyle       =   0  'Transparent
      Caption         =   "Dias para proxima eleccion de lider:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   10
      Top             =   2040
      Width           =   3015
   End
   Begin VB.Label Enemigos 
      BackStyle       =   0  'Transparent
      Caption         =   "Clanes Enemigos:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   9
      Top             =   2280
      Width           =   4875
   End
   Begin VB.Label Aliados 
      BackStyle       =   0  'Transparent
      Caption         =   "Clanes Aliados:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   8
      Top             =   2520
      Width           =   4950
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   600
      TabIndex        =   7
      Top             =   3480
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   600
      TabIndex        =   6
      Top             =   3240
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   600
      TabIndex        =   5
      Top             =   3960
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   600
      TabIndex        =   4
      Top             =   4200
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   600
      TabIndex        =   3
      Top             =   4440
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   600
      TabIndex        =   2
      Top             =   4680
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   600
      TabIndex        =   1
      Top             =   4920
      Width           =   6495
   End
   Begin VB.Label Codex 
      BackColor       =   &H80000012&
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   7
      Left            =   600
      TabIndex        =   0
      Top             =   5160
      Width           =   6495
   End
End
Attribute VB_Name = "frmGuildBrief"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Public EsLeader As Boolean
Public Sub ParseGuildInfo(ByVal buffer As String)
Dim BandoClan As Byte, BandoMio As Byte

BandoClan = Val(ReadField(8, buffer, Asc("�")))
BandoMio = Val(ReadField(11, buffer, Asc("�")))

If Not EsLeader Then
    Me.Picture = LoadPicture(DirGraficos & "DetallesDeClan.gif")
    guerra.Visible = False
    aliado.Visible = False
    Command3.Visible = False
    Command2.Visible = (BandoMio = BandoClan)
Else
    Me.Picture = LoadPicture(DirGraficos & "DetallesDeClanGuildMaster.gif")
    aliado.Visible = True
    guerra.Visible = True
    Command3.Visible = True
    Command2.Visible = False
End If

Select Case BandoClan
    Case 1
        Nombre.ForeColor = &HFF0000
    Case 2
        Nombre.ForeColor = &HFF&
    Case Else
        Nombre.ForeColor = &HE0E0E0
End Select

Nombre.Caption = ReadField(1, buffer, Asc("�"))
fundador.Caption = ReadField(2, buffer, Asc("�"))
creacion.Caption = ReadField(3, buffer, Asc("�"))
lider.Caption = ReadField(4, buffer, Asc("�"))
web.Caption = ReadField(5, buffer, Asc("�"))
Miembros.Caption = ReadField(6, buffer, Asc("�"))
Eleccion.Caption = ReadField(7, buffer, Asc("�"))
Enemigos.Caption = ReadField(9, buffer, Asc("�"))
Aliados.Caption = ReadField(10, buffer, Asc("�"))

Dim T%, k%
k% = Val(ReadField(12, buffer, Asc("�")))

For T% = 1 To k%
    Codex(T% - 1).Caption = ReadField(12 + T%, buffer, Asc("�"))
Next T%
Dim des$


des$ = ReadField(12 + T%, buffer, Asc("�"))

desc = Replace(des$, "�", vbCrLf)

Me.Show vbModeless, frmPrincipal

End Sub

Private Sub aliado_Click()
Call SendData("DECALIAD" & Right$(Nombre, Len(Nombre.Caption)))
Unload Me
End Sub
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Command2_Click()

Call frmGuildSol.RecieveSolicitud(Right$(Nombre, Len(Nombre.Caption)))
Call frmGuildSol.Show(vbModeless, frmGuildBrief)


End Sub

Private Sub Command3_Click()
frmCommet.Nombre = Right$(Nombre.Caption, Len(Nombre.Caption))
Call frmCommet.Show(vbModeless, frmGuildBrief)

End Sub

Private Sub guerra_Click()
Call SendData("DECGUERR" & Right$(Nombre.Caption, Len(Nombre.Caption)))
Unload Me
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

If bmoving = False And Button = vbLeftButton Then
    DX = X
    dy = Y
    bmoving = True
End If

End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

If bmoving And ((X <> DX) Or (Y <> dy)) Then Move Left + (X - DX), Top + (Y - dy)

End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

If Button = vbLeftButton Then bmoving = False

End Sub
