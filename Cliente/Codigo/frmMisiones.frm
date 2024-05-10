VERSION 5.00
Begin VB.Form frmMisiones 
   BackColor       =   &H008080FF&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Misiones"
   ClientHeight    =   2040
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5550
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmMisiones.frx":0000
   ScaleHeight     =   2040
   ScaleWidth      =   5550
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "    Mision 3   Recompensa 9 Canjes"
      Height          =   615
      Left            =   3240
      TabIndex        =   4
      Top             =   480
      Width           =   1815
   End
   Begin VB.CommandButton Command3 
      Caption         =   " Mision 4   Recompensa 13 Canjes"
      Height          =   615
      Left            =   3240
      TabIndex        =   3
      Top             =   1320
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "   Mision 2 Recompensa 6 Canjes"
      Height          =   615
      Left            =   480
      TabIndex        =   2
      Top             =   1320
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FF0000&
      Caption         =   "   Mision 1      Recompensa 3 Canjes"
      Height          =   615
      Left            =   480
      MaskColor       =   &H00404040&
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Misiones Wester AO"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   855
      Left            =   960
      TabIndex        =   1
      Top             =   0
      Width           =   4455
   End
End
Attribute VB_Name = "frmMisiones"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Call SendData("/MISION M1")
Unload Me
End Sub

Private Sub Command2_Click()
Call SendData("/MISION M2")
Unload Me
End Sub

Private Sub Command3_Click()
Call SendData("/MISION M4")
Unload Me
End Sub

Private Sub Command4_Click()
Call SendData("/MISION M3")
Unload Me
End Sub

