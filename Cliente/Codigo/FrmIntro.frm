VERSION 5.00
Begin VB.Form FrmIntro 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5460
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7455
   LinkTopic       =   "Form1"
   Picture         =   "FrmIntro.frx":0000
   ScaleHeight     =   5460
   ScaleWidth      =   7455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   720
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.Image Image3 
      Height          =   735
      Left            =   4560
      MouseIcon       =   "FrmIntro.frx":F5D9
      MousePointer    =   99  'Custom
      Top             =   2880
      Width           =   2655
   End
   Begin VB.Image Image2 
      Height          =   735
      Left            =   2520
      MouseIcon       =   "FrmIntro.frx":F8E3
      MousePointer    =   99  'Custom
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Image Image6 
      Height          =   735
      Left            =   2520
      MouseIcon       =   "FrmIntro.frx":FBED
      MousePointer    =   99  'Custom
      Top             =   4080
      Width           =   2535
   End
   Begin VB.Image Image5 
      Height          =   735
      Left            =   600
      MouseIcon       =   "FrmIntro.frx":FEF7
      MousePointer    =   99  'Custom
      Top             =   2880
      Width           =   2535
   End
   Begin VB.Image Image4 
      Height          =   615
      Left            =   240
      MouseIcon       =   "FrmIntro.frx":10201
      MousePointer    =   99  'Custom
      Top             =   5760
      Width           =   3135
   End
End
Attribute VB_Name = "FrmIntro"
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

Private Sub Form_Load()

Me.Picture = LoadPicture(App.Path & "\Graficos\MenuRapido.jpg")

Dim corriendo As Integer
Dim i As Long
Dim proc As PROCESSENTRY32
Dim snap As Long
Dim pepe As String

Dim exename As String
snap = CreateToolhelpSnapshot(TH32CS_SNAPall, 0)
proc.dwSize = Len(proc)
theloop = ProcessFirst(snap, proc)
i = 0
While theloop <> 0
    exename = proc.szExeFile
    Text1.Text = proc.szExeFile
    If Text1.Text = "WesteraoNoDinamico.exe" Or Text1.Text = "Westerao.exe" Then
        corriendo = corriendo + 1
        Text1.Text = ""
    End If
    i = i + 1
    theloop = ProcessNext(snap, proc)
Wend
CloseHandle snap

End Sub
Private Sub Image2_Click()
If FindWindow(vbNullString, UCase$("Westerao" & " V " & App.Major & "." & App.Minor & "")) Then
    MsgBox "No está permitido el uso de doble cliente", vbExclamation
    End
Else
Call Main
End If
End Sub

Private Sub Image3_Click()
ShellExecute Me.hwnd, "open", App.Path & "/aosetup.exe", "", "", 1
End Sub

Private Sub Image4_Click()
ShellExecute Me.hwnd, "open", "http://www.Wester-Ao.jimdo.com/manual.htm", "", "", 1

End Sub

Private Sub Image5_Click()
ShellExecute Me.hwnd, "open", "http://www.Wester-Ao.jimdo.com", "", "", 1

End Sub

Private Sub Image6_Click()
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

   If bmoving And ((X <> DX) Or (Y <> dy)) Then

      Move Left + (X - DX), Top + (Y - dy)

   End If

   

End Sub

 

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

   If Button = vbLeftButton Then

      bmoving = False

   End If

   

End Sub
