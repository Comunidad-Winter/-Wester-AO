VERSION 5.00
Begin VB.Form frmCanjes 
   Caption         =   "Sistema de Canje"
   ClientHeight    =   4470
   ClientLeft      =   540
   ClientTop       =   765
   ClientWidth     =   6015
   FillColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   Palette         =   "frmCanjes.frx":0000
   Picture         =   "frmCanjes.frx":2760
   ScaleHeight     =   4470
   ScaleWidth      =   6015
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000011&
      Caption         =   "Canjear"
      Height          =   375
      Left            =   2760
      MaskColor       =   &H00000040&
      Picture         =   "frmCanjes.frx":1332F
      TabIndex        =   9
      Top             =   1320
      Width           =   2895
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000007&
      ForeColor       =   &H80000008&
      Height          =   540
      Left            =   2640
      ScaleHeight     =   510
      ScaleWidth      =   510
      TabIndex        =   1
      Top             =   480
      Width           =   540
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000001&
      ForeColor       =   &H8000000E&
      Height          =   2370
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   1935
   End
   Begin VB.Label lblPermisos 
      BackColor       =   &H80000007&
      ForeColor       =   &H8000000E&
      Height          =   495
      Left            =   480
      TabIndex        =   8
      Top             =   3600
      Width           =   5055
   End
   Begin VB.Label lblStat 
      BackColor       =   &H80000007&
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   4560
      TabIndex        =   7
      Top             =   2280
      Width           =   975
   End
   Begin VB.Label lblPrecio 
      BackColor       =   &H80000007&
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   4560
      TabIndex        =   6
      Top             =   2880
      Width           =   975
   End
   Begin VB.Label lblNombre 
      BackColor       =   &H80000001&
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   3480
      TabIndex        =   5
      Top             =   600
      Width           =   2175
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Clases Permitidas"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   6360
      TabIndex        =   4
      Top             =   3360
      Width           =   1290
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stats:"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   6240
      TabIndex        =   3
      Top             =   3960
      Width           =   465
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Precio:"
      ForeColor       =   &H8000000F&
      Height          =   255
      Left            =   6360
      TabIndex        =   2
      Top             =   2400
      Width           =   555
   End
End
Attribute VB_Name = "frmCanjes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub command1_Click()

If List1.Text = "Tunica de Rey (Altos)" Then Call SendData("/CANJEO T1")
If List1.Text = "Sombrero Infernal" Then Call SendData("/CANJEO T2")
If List1.Text = "Báculo de Mago Oscuro" Then Call SendData("/CANJEO T3")
If List1.Text = "Poción Roja GRANDE" Then Call SendData("/CANJEO T4")
If List1.Text = "Poción Azul GRANDE" Then Call SendData("/CANJEO T5")
If List1.Text = "Espada de Neithan +2" Then Call SendData("/CANJEO T6")
If List1.Text = "Corona" Then Call SendData("/CANJEO T7")
If List1.Text = "Espada Fantasmal" Then Call SendData("/CANJEO T8")
If List1.Text = "Casco de Legionario" Then Call SendData("/CANJEO T9")
If List1.Text = "Arco de las Sombras" Then Call SendData("/CANJEO T10")
If List1.Text = "Arco de la Luz" Then Call SendData("/CANJEO T11")
If List1.Text = "Arco largo engarzado" Then Call SendData("/CANJEO T12")
If List1.Text = "Daga de Torneo" Then Call SendData("/CANJEO T13")
If List1.Text = "Flecha +3" Then Call SendData("/CANJEO T14")
If List1.Text = "Escudo Imperial +2" Then Call SendData("/CANJEO T15")
If List1.Text = "Escudo de la Alianza" Then Call SendData("/CANJEO T16")
If List1.Text = "Corona de Rey" Then Call SendData("/CANJEO T17")
If List1.Text = "Daga de Hielo" Then Call SendData("/CANJEO T18")
If List1.Text = "Escudo Dinal +1" Then Call SendData("/CANJEO T19")
If List1.Text = "Túnica Angelical" Then Call SendData("/CANJEO T20")
If List1.Text = "Gema de clan" Then Call SendData("/CANJEO T21") 'aca remplazan "Gema de clan" por el nombre de su item
If List1.Text = "Copa De oro" Then Call SendData("/CANJEO T22")

End Sub
Private Sub Form_Load()

List1.AddItem "Tunica de Rey (Altos)"
List1.AddItem "Sombrero Infernal"
List1.AddItem "Báculo de Mago Oscuro"
List1.AddItem "Poción Roja GRANDE"
List1.AddItem "Poción Azul GRANDE"
List1.AddItem "Espada de Neithan +2"
List1.AddItem "Corona"
List1.AddItem "Espada Fantasmal"
List1.AddItem "Casco de Legionario"
List1.AddItem "Arco de las Sombras"
List1.AddItem "Arco de la Luz"
List1.AddItem "Arco largo engarzado"
List1.AddItem "Daga de Torneo"
List1.AddItem "Flecha +3"
List1.AddItem "Escudo Imperial +2"
List1.AddItem "Escudo de la Alianza"
List1.AddItem "Corona de Rey"
List1.AddItem "Daga de Hielo"
List1.AddItem "Escudo Dinal +1"
List1.AddItem "Túnica Angelical"
List1.AddItem "Gema de clan" 'aca remplazan "Gema de clan" por el nombre de su item
List1.AddItem "Copa De oro"

End Sub

Private Sub list1_Click()

If List1.Text = "Tunica de Rey (Altos)" Then
    Picture1.Picture = LoadPicture(DirGraficos & "685.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "300"
    lblStat.Caption = "Min: 30 / Max: 35"
    lblPermisos.Caption = "Todas las Clases"
    End If
If List1.Text = "Sombrero Infernal" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16032.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "150"
    lblStat.Caption = "Min: 15 / Max: 18"
    lblPermisos.Caption = "Mago"
    End If
If List1.Text = "Báculo de Mago Oscuro" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16030.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "250"
    lblStat.Caption = "Min: 0 / Max: 0"
    lblPermisos.Caption = "Mago"
    End If
If List1.Text = "Poción Roja GRANDE" Then
    Picture1.Picture = LoadPicture(DirGraficos & "535.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "30"
    lblStat.Caption = "Min: 31 / Max: 32"
    lblPermisos.Caption = "Todas las Clases"
    End If
If List1.Text = "Poción Azul GRANDE" Then
    Picture1.Picture = LoadPicture(DirGraficos & "534.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "30"
    lblStat.Caption = "Min: 31 / Max: 32"
    lblPermisos.Caption = "Todas las Clases"
    End If
If List1.Text = "Espada de Neithan +2" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16070.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "320"
    lblStat.Caption = "Min: 21 / Max: 25"
    lblPermisos.Caption = "Guerrero"
    End If
If List1.Text = "Corona" Then
    Picture1.Picture = LoadPicture(DirGraficos & "2023.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "300"
    lblStat.Caption = "Min: 40 / Max: 45"
    lblPermisos.Caption = "Todas menos Guerrero"
    End If
If List1.Text = "Espada Fantasmal" Then
    Picture1.Picture = LoadPicture(DirGraficos & "9630.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "350"
    lblStat.Caption = "Min: 20 / Max: 23"
    lblPermisos.Caption = "Paladín y Guerrero"
    End If
If List1.Text = "Casco de Legionario" Then
    Picture1.Picture = LoadPicture(DirGraficos & "2019.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "250"
    lblStat.Caption = "Min: 25 / Max: 28"
    lblPermisos.Caption = "Paladín, Guerrero y Arquero"
    End If
If List1.Text = "Arco de las Sombras" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16116.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "150"
    lblStat.Caption = "Min: 10 / Max: 15"
    lblPermisos.Caption = "Cazador"
    End If
If List1.Text = "Arco de la Luz" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16114.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "160"
    lblStat.Caption = "Min: 10 / Max: 16"
    lblPermisos.Caption = "Arquero"
    End If
If List1.Text = "Arco largo engarzado" Then
    Picture1.Picture = LoadPicture(DirGraficos & "1004.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "500"
    lblStat.Caption = "Min: 14 / Max: 17"
    lblPermisos.Caption = "Arquero y Cazador"
    End If
If List1.Text = "Daga de Torneo" Then
    Picture1.Picture = LoadPicture(DirGraficos & "3537.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "300"
    lblStat.Caption = "Min: 9 / Max: 11"
    lblPermisos.Caption = "Bardo"
    End If
If List1.Text = "Flecha +3" Then
    Picture1.Picture = LoadPicture(DirGraficos & "748.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "100"
    lblStat.Caption = "Min: 0 / Max: 0"
    lblPermisos.Caption = "Arquero y Cazador"
    End If
If List1.Text = "Escudo Imperial +2" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16058.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "250"
    lblStat.Caption = "Min: 10 / Max: 15"
    lblPermisos.Caption = "Paladín y Guerrero"
    End If
If List1.Text = "Escudo de la Alianza" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16068.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "400"
    lblStat.Caption = "Min: 8 / Max: 14"
    lblPermisos.Caption = "Paladín y Guerrero"
    End If
If List1.Text = "Corona de Rey" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16100.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "500"
    lblStat.Caption = "Min: 50 / Max: 50"
    lblPermisos.Caption = "Todas menos Guerrero"
    End If
If List1.Text = "Daga de Hielo" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16118.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "250"
    lblStat.Caption = "Min: 10 / Max: 12"
    lblPermisos.Caption = "Asesino"
    End If
If List1.Text = "Escudo Dinal +1" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16064.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "550"
    lblStat.Caption = "Min: 10 / Max: 12"
    lblPermisos.Caption = "Bardo, Paladín y Guerrero"
    End If
If List1.Text = "Túnica Angelical" Then
    Picture1.Picture = LoadPicture(DirGraficos & "16112.bmp")
    lblNombre.Caption = List1.Text
    lblPrecio.Caption = "550"
    lblStat.Caption = "Min: 10 / Max: 12"
    lblPermisos.Caption = "Bardo, Paladín y Guerrero"
    End If
If List1.Text = "Gema de clan" Then
Picture1.Picture = LoadPicture(DirGraficos & "697.bmp") 'aca ponen el numero de imagen .bmp
lblNombre.Caption = List1.Text
lblPrecio.Caption = "50" 'aca ponen la cantidad de puntos
lblPermisos.Caption = "Todas" 'aca ponen las clases permitidas
End If

If List1.Text = "Copa De oro" Then
Picture1.Picture = LoadPicture(DirGraficos & "700.bmp") 'aca ponen el numero de imagen .bmp
lblNombre.Caption = List1.Text
lblPrecio.Caption = "4" 'aca ponen la cantidad de puntos
lblPermisos.Caption = "Todas" 'aca ponen las clases permitidas
End If

End Sub
