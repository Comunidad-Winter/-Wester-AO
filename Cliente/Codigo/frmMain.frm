VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{33101C00-75C3-11CF-A8A0-444553540000}#1.0#0"; "CSWSK32.ocx"
Object = "{B370EF78-425C-11D1-9A28-004033CA9316}#2.0#0"; "Captura.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmPrincipal 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   9015
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   12000
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   HasDC           =   0   'False
   Icon            =   "frmMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   Picture         =   "frmMain.frx":0CCA
   ScaleHeight     =   601
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   800
   Visible         =   0   'False
   Begin SocketWrenchCtrl.Socket Socket1 
      Left            =   120
      Top             =   2760
      _Version        =   65536
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   0
      AutoResolve     =   0   'False
      Backlog         =   1
      Binary          =   0   'False
      Blocking        =   0   'False
      Broadcast       =   0   'False
      BufferSize      =   2048
      HostAddress     =   ""
      HostFile        =   "FlamiusAO"
      HostName        =   "FlamiusAO"
      InLine          =   0   'False
      Interval        =   0
      KeepAlive       =   0   'False
      Library         =   ""
      Linger          =   0
      LocalPort       =   10200
      LocalService    =   ""
      Protocol        =   0
      RemotePort      =   10200
      RemoteService   =   ""
      ReuseAddress    =   0   'False
      Route           =   -1  'True
      Timeout         =   999999
      Type            =   1
      Urgent          =   0   'False
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   2640
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Interval        =   9000
      Left            =   2520
      Top             =   2760
   End
   Begin VB.PictureBox Minimap 
      AutoRedraw      =   -1  'True
      Height          =   1500
      Left            =   6720
      ScaleHeight     =   96
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   87
      Top             =   240
      Width           =   1500
   End
   Begin Captura.wndCaptura Captura1 
      Left            =   120
      Top             =   2280
      _ExtentX        =   688
      _ExtentY        =   688
   End
   Begin VB.PictureBox Picture1 
      Height          =   375
      Left            =   10320
      ScaleHeight     =   315
      ScaleWidth      =   915
      TabIndex        =   86
      Top             =   9000
      Width           =   975
   End
   Begin VB.Timer AntiCheat 
      Interval        =   1000
      Left            =   2040
      Top             =   2760
   End
   Begin RichTextLib.RichTextBox rectxt 
      Height          =   1785
      Left            =   120
      TabIndex        =   74
      TabStop         =   0   'False
      Top             =   120
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   3149
      _Version        =   393217
      BackColor       =   0
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      DisableNoScroll =   -1  'True
      Appearance      =   0
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmMain.frx":4A7E9
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Frame frInvent 
      BorderStyle     =   0  'None
      Height          =   4358
      Left            =   8640
      TabIndex        =   15
      Top             =   1740
      Width           =   3216
      Begin VB.Image Image5 
         Height          =   435
         Index           =   3
         Left            =   2520
         MouseIcon       =   "frmMain.frx":4A867
         MousePointer    =   99  'Custom
         Top             =   3720
         Width           =   375
      End
      Begin VB.Image Image5 
         Height          =   435
         Index           =   2
         Left            =   1920
         MouseIcon       =   "frmMain.frx":4AB71
         MousePointer    =   99  'Custom
         Top             =   3720
         Width           =   375
      End
      Begin VB.Image Image5 
         Height          =   495
         Index           =   1
         Left            =   960
         MouseIcon       =   "frmMain.frx":4AE7B
         MousePointer    =   99  'Custom
         Top             =   3720
         Width           =   435
      End
      Begin VB.Image Image5 
         Height          =   495
         Index           =   0
         Left            =   360
         MouseIcon       =   "frmMain.frx":4B185
         MousePointer    =   99  'Custom
         Top             =   3720
         Width           =   435
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H000000FF&
         Height          =   480
         Left            =   3240
         Top             =   3480
         Width           =   480
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   3
         Left            =   1780
         TabIndex        =   51
         Top             =   1160
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   3
         Left            =   1440
         TabIndex        =   38
         Top             =   850
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Height          =   480
         Index           =   3
         Left            =   1440
         Top             =   870
         Width           =   480
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   25
         Left            =   2740
         TabIndex        =   73
         Top             =   3320
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   24
         Left            =   2260
         TabIndex        =   72
         Top             =   3320
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   23
         Left            =   1780
         TabIndex        =   71
         Top             =   3320
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   22
         Left            =   1300
         TabIndex        =   70
         Top             =   3320
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   21
         Left            =   820
         TabIndex        =   69
         Top             =   3320
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   16
         Left            =   820
         TabIndex        =   68
         Top             =   2780
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   17
         Left            =   1300
         TabIndex        =   67
         Top             =   2780
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   18
         Left            =   1780
         TabIndex        =   66
         Top             =   2780
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   19
         Left            =   2260
         TabIndex        =   65
         Top             =   2780
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   20
         Left            =   2740
         TabIndex        =   64
         Top             =   2780
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   15
         Left            =   2740
         TabIndex        =   63
         Top             =   2240
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   14
         Left            =   2260
         TabIndex        =   62
         Top             =   2240
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   13
         Left            =   1780
         TabIndex        =   61
         Top             =   2240
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   12
         Left            =   1300
         TabIndex        =   60
         Top             =   2240
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   11
         Left            =   820
         TabIndex        =   59
         Top             =   2240
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   10
         Left            =   2740
         TabIndex        =   58
         Top             =   1700
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   9
         Left            =   2260
         TabIndex        =   57
         Top             =   1700
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   8
         Left            =   1780
         TabIndex        =   56
         Top             =   1700
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   7
         Left            =   1300
         TabIndex        =   55
         Top             =   1700
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   6
         Left            =   820
         TabIndex        =   54
         Top             =   1700
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   5
         Left            =   2740
         TabIndex        =   53
         Top             =   1160
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   4
         Left            =   2260
         TabIndex        =   52
         Top             =   1160
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   2
         Left            =   1300
         TabIndex        =   50
         Top             =   1160
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         ForeColor       =   &H0000FFFF&
         Height          =   195
         Index           =   1
         Left            =   820
         TabIndex        =   49
         Top             =   1160
         Visible         =   0   'False
         Width           =   165
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   1
         Left            =   480
         TabIndex        =   40
         Top             =   850
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   1
         Left            =   480
         Stretch         =   -1  'True
         Top             =   870
         Width           =   480
      End
      Begin VB.Label lblHechizos 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   480
         Left            =   1800
         MouseIcon       =   "frmMain.frx":4B48F
         MousePointer    =   99  'Custom
         TabIndex        =   41
         Top             =   120
         Width           =   1320
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   8
         Left            =   1440
         TabIndex        =   33
         Top             =   1390
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   2
         Left            =   960
         TabIndex        =   39
         Top             =   850
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   4
         Left            =   1920
         TabIndex        =   37
         Top             =   850
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   5
         Left            =   2400
         TabIndex        =   36
         Top             =   850
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   6
         Left            =   480
         TabIndex        =   35
         Top             =   1390
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   7
         Left            =   960
         TabIndex        =   34
         Top             =   1390
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   11
         Left            =   480
         TabIndex        =   30
         Top             =   1940
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   12
         Left            =   960
         TabIndex        =   29
         Top             =   1940
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   13
         Left            =   1440
         TabIndex        =   28
         Top             =   1940
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   14
         Left            =   1920
         TabIndex        =   27
         Top             =   1940
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   15
         Left            =   2400
         TabIndex        =   26
         Top             =   1940
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   16
         Left            =   480
         TabIndex        =   25
         Top             =   2470
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   17
         Left            =   960
         TabIndex        =   24
         Top             =   2470
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   18
         Left            =   1440
         TabIndex        =   23
         Top             =   2470
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   19
         Left            =   1920
         TabIndex        =   22
         Top             =   2470
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   20
         Left            =   2400
         TabIndex        =   21
         Top             =   2470
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   21
         Left            =   480
         TabIndex        =   20
         Top             =   3020
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   22
         Left            =   960
         TabIndex        =   19
         Top             =   3020
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   23
         Left            =   1440
         TabIndex        =   18
         Top             =   3020
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   24
         Left            =   1920
         TabIndex        =   17
         Top             =   3020
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   25
         Left            =   2400
         TabIndex        =   16
         Top             =   3020
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   9
         Left            =   1920
         TabIndex        =   32
         Top             =   1390
         Width           =   480
      End
      Begin VB.Label lblObjCant 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   10
         Left            =   2400
         TabIndex        =   31
         Top             =   1390
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   2
         Left            =   960
         Stretch         =   -1  'True
         Top             =   870
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   4
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   870
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   5
         Left            =   2400
         Stretch         =   -1  'True
         Top             =   870
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   6
         Left            =   480
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   7
         Left            =   960
         Stretch         =   -1  'True
         Top             =   1410
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   8
         Left            =   1440
         Stretch         =   -1  'True
         Top             =   1410
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   9
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   1410
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   10
         Left            =   2400
         Stretch         =   -1  'True
         Top             =   1410
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   11
         Left            =   480
         Stretch         =   -1  'True
         Top             =   1950
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   12
         Left            =   960
         Stretch         =   -1  'True
         Top             =   1950
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   13
         Left            =   1440
         Stretch         =   -1  'True
         Top             =   1950
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   14
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   1950
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   15
         Left            =   2400
         Stretch         =   -1  'True
         Top             =   1950
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   16
         Left            =   480
         Stretch         =   -1  'True
         Top             =   2490
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   17
         Left            =   960
         Stretch         =   -1  'True
         Top             =   2490
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   18
         Left            =   1440
         Stretch         =   -1  'True
         Top             =   2490
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   19
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   2490
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   20
         Left            =   2400
         Stretch         =   -1  'True
         Top             =   2490
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   21
         Left            =   480
         Stretch         =   -1  'True
         Top             =   3030
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   22
         Left            =   960
         Stretch         =   -1  'True
         Top             =   3030
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   23
         Left            =   1440
         Stretch         =   -1  'True
         Top             =   3030
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   24
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   3030
         Width           =   480
      End
      Begin VB.Image imgObjeto 
         Appearance      =   0  'Flat
         Height          =   480
         Index           =   25
         Left            =   2400
         Stretch         =   -1  'True
         Top             =   3030
         Width           =   480
      End
      Begin VB.Image imgFondoInvent 
         Height          =   4395
         Left            =   0
         Top             =   0
         Width           =   3240
      End
   End
   Begin VB.Timer tmrBmp 
      Left            =   1560
      Top             =   2280
   End
   Begin VB.Timer trabajo 
      Enabled         =   0   'False
      Left            =   600
      Top             =   2760
   End
   Begin VB.Timer Second 
      Enabled         =   0   'False
      Interval        =   1050
      Left            =   1080
      Top             =   2760
   End
   Begin VB.Timer SpoofCheck 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   600
      Top             =   2280
   End
   Begin VB.Timer FPS 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1080
      Top             =   2280
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   2040
      Top             =   2280
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   30
   End
   Begin VB.Timer Attack 
      Enabled         =   0   'False
      Left            =   1560
      Top             =   2760
   End
   Begin VB.TextBox SendTxt 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   210
      Left            =   1200
      MultiLine       =   -1  'True
      TabIndex        =   0
      TabStop         =   0   'False
      ToolTipText     =   "Chat"
      Top             =   1965
      Visible         =   0   'False
      Width           =   7095
   End
   Begin VB.Frame frHechizos 
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      Height          =   4395
      Left            =   8625
      TabIndex        =   42
      Top             =   1740
      Width           =   3240
      Begin VB.ListBox lstHechizos 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFFFF&
         Height          =   2565
         Left            =   420
         TabIndex        =   43
         Top             =   1095
         Width           =   2595
      End
      Begin VB.Label lblInvent 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         MouseIcon       =   "frmMain.frx":4B799
         MousePointer    =   99  'Custom
         TabIndex        =   48
         Top             =   130
         Width           =   1535
      End
      Begin VB.Label lblLanzar 
         BackStyle       =   0  'Transparent
         Height          =   360
         Left            =   390
         MouseIcon       =   "frmMain.frx":4BAA3
         MousePointer    =   99  'Custom
         TabIndex        =   47
         Top             =   3840
         Width           =   1305
      End
      Begin VB.Label lblInfo 
         BackStyle       =   0  'Transparent
         Height          =   360
         Left            =   2040
         MouseIcon       =   "frmMain.frx":4BDAD
         MousePointer    =   99  'Custom
         TabIndex        =   46
         Top             =   3840
         Width           =   1050
      End
      Begin VB.Label lblAbajo 
         BackColor       =   &H000000FF&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2640
         MouseIcon       =   "frmMain.frx":4C0B7
         MousePointer    =   99  'Custom
         TabIndex        =   45
         Top             =   780
         Width           =   300
      End
      Begin VB.Label lblArriba 
         BackColor       =   &H00FF0000&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2280
         MouseIcon       =   "frmMain.frx":4C3C1
         MousePointer    =   99  'Custom
         TabIndex        =   44
         Top             =   780
         Width           =   300
      End
      Begin VB.Image imgFondoHechizos 
         Height          =   4395
         Left            =   0
         Picture         =   "frmMain.frx":4C6CB
         Top             =   0
         Width           =   3240
      End
   End
   Begin VB.Label exp 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Exp:"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   8520
      TabIndex        =   85
      Top             =   1170
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label LvlLbl 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "(100%)"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   9840
      TabIndex        =   84
      Top             =   1200
      Width           =   705
   End
   Begin VB.Label barrita 
      BackColor       =   &H008080FF&
      Height          =   255
      Left            =   9000
      TabIndex        =   83
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label lblNivel 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "45"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8880
      TabIndex        =   82
      Top             =   480
      Width           =   465
   End
   Begin VB.Image Image10 
      Height          =   405
      Left            =   5880
      Top             =   8520
      Width           =   975
   End
   Begin VB.Image Image7 
      Height          =   405
      Left            =   11400
      Top             =   9000
      Width           =   1005
   End
   Begin VB.Image Image1 
      Height          =   420
      Index           =   3
      Left            =   8640
      MouseIcon       =   "frmMain.frx":50D0E
      MousePointer    =   99  'Custom
      Top             =   8520
      Width           =   3285
   End
   Begin VB.Image Party 
      Height          =   405
      Left            =   10320
      MouseIcon       =   "frmMain.frx":51018
      MousePointer    =   99  'Custom
      Top             =   7680
      Width           =   1410
   End
   Begin VB.Shape MainViewShp 
      BackColor       =   &H80000006&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      Height          =   6255
      Left            =   135
      Top             =   2235
      Width           =   8145
   End
   Begin VB.Label NumOnline 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   450
      Left            =   4200
      TabIndex        =   81
      Top             =   8640
      Visible         =   0   'False
      Width           =   390
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "R"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   11640
      TabIndex        =   80
      Top             =   600
      Visible         =   0   'False
      Width           =   120
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "F"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   11640
      TabIndex        =   79
      Top             =   840
      Visible         =   0   'False
      Width           =   105
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "C"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   11640
      TabIndex        =   78
      Top             =   360
      Visible         =   0   'False
      Width           =   105
   End
   Begin VB.Label modo 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "1 Normal"
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   120
      TabIndex        =   77
      Top             =   1980
      Width           =   975
   End
   Begin VB.Label Agilidad 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   7200
      TabIndex        =   76
      Top             =   8640
      Width           =   465
   End
   Begin VB.Label Fuerza 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   7800
      TabIndex        =   75
      Top             =   8625
      Width           =   420
   End
   Begin VB.Image Image6 
      Height          =   495
      Left            =   960
      Top             =   0
      Width           =   7455
   End
   Begin VB.Label casco 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "N/A"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   3245
      TabIndex        =   1
      Top             =   8625
      Width           =   540
   End
   Begin VB.Label armadura 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "N/A"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   600
      TabIndex        =   14
      Top             =   8640
      Width           =   540
   End
   Begin VB.Label escudo 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "N/A"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   2338
      TabIndex        =   13
      Top             =   8640
      Width           =   540
   End
   Begin VB.Label arma 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "N/A"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   1444
      TabIndex        =   12
      Top             =   8625
      Width           =   540
   End
   Begin VB.Label mapa 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Ullathorpe"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   8760
      TabIndex        =   11
      Top             =   8640
      Width           =   3015
   End
   Begin VB.Image Image4 
      Height          =   255
      Left            =   10320
      Top             =   6240
      Width           =   255
   End
   Begin VB.Label cantidadhp 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   135
      Left            =   9000
      TabIndex        =   9
      Top             =   7185
      Width           =   1095
   End
   Begin VB.Label cantidadagua 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   135
      Left            =   8880
      TabIndex        =   8
      Top             =   7920
      Width           =   1215
   End
   Begin VB.Label cantidadsta 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   135
      Left            =   8880
      TabIndex        =   10
      Top             =   6420
      Width           =   1215
   End
   Begin VB.Label cantidadhambre 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   135
      Left            =   9000
      TabIndex        =   7
      Top             =   7560
      Width           =   1095
   End
   Begin VB.Label cantidadmana 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   135
      Left            =   9000
      TabIndex        =   6
      Top             =   6795
      Width           =   1095
   End
   Begin VB.Image Image2 
      Height          =   405
      Left            =   9720
      MouseIcon       =   "frmMain.frx":51322
      MousePointer    =   99  'Custom
      Top             =   0
      Width           =   975
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00003E25&
      X1              =   16
      X2              =   551.467
      Y1              =   126.333
      Y2              =   126.333
   End
   Begin VB.Image Image3 
      Height          =   405
      Left            =   10800
      MouseIcon       =   "frmMain.frx":5162C
      MousePointer    =   99  'Custom
      Top             =   0
      Width           =   1215
   End
   Begin VB.Label fpstext 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H0000C000&
      Height          =   255
      Left            =   9105
      TabIndex        =   5
      Top             =   60
      Width           =   375
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "DarkTester"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   9555
      TabIndex        =   4
      Top             =   750
      Width           =   1665
   End
   Begin VB.Shape STAShp 
      BackColor       =   &H00008080&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FFFF&
      Height          =   120
      Left            =   8775
      Top             =   6450
      Width           =   1365
   End
   Begin VB.Shape MANShp 
      BackColor       =   &H00808000&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   120
      Left            =   8775
      Top             =   6825
      Width           =   1410
   End
   Begin VB.Label GldLbl 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   180
      Left            =   10920
      TabIndex        =   3
      Top             =   6240
      Width           =   90
   End
   Begin VB.Shape Hpshp 
      BorderColor     =   &H8000000D&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   120
      Left            =   8775
      Top             =   7215
      Width           =   1410
   End
   Begin VB.Shape COMIDAsp 
      BackColor       =   &H00008000&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FFFF&
      Height          =   120
      Left            =   8775
      Top             =   7605
      Width           =   1410
   End
   Begin VB.Shape AGUAsp 
      BackColor       =   &H00C00000&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      FillColor       =   &H0000FFFF&
      Height          =   120
      Left            =   8775
      Top             =   7995
      Width           =   1365
   End
   Begin VB.Image Image1 
      Height          =   465
      Index           =   0
      Left            =   10320
      MouseIcon       =   "frmMain.frx":51936
      MousePointer    =   99  'Custom
      Top             =   6480
      Width           =   1410
   End
   Begin VB.Image Image1 
      Height          =   465
      Index           =   1
      Left            =   10320
      MouseIcon       =   "frmMain.frx":51C40
      MousePointer    =   99  'Custom
      Top             =   6840
      Width           =   1530
   End
   Begin VB.Image Image1 
      Height          =   300
      Index           =   2
      Left            =   10320
      MouseIcon       =   "frmMain.frx":51F4A
      MousePointer    =   99  'Custom
      Top             =   7320
      Width           =   1485
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "+"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   9240
      TabIndex        =   2
      Top             =   720
      Visible         =   0   'False
      Width           =   345
   End
End
Attribute VB_Name = "frmPrincipal"
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
Private Type BLENDFUNCTION
BlendOp As Byte
BlendFlags As Byte
SourceConstantAlpha As Byte
AlphaFormat As Byte
End Type
Private Const AC_SRC_OVER = &H0
   
Private Declare Function AlphaBlend Lib "msimg32.dll" (ByVal hdcDest As Long, ByVal xOriginDest As Long, ByVal yOriginDest As Long, ByVal WidthDest As Long, ByVal HeightDest As Long, ByVal hdcSrc As Long, ByVal xOriginSrc As Long, ByVal yOriginSrc As Long, ByVal WidthSrc As Long, ByVal HeightSrc As Long, ByVal BLENDFUNCT As Long) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32.dll" (Destination As Any, source As Any, ByVal Length As Long)
   
Dim Blend As BLENDFUNCTION
Dim blendlong As Long
Dim Contador As Integer

Public ActualSecond As Long
Public LastSecond As Long
Public tX As Integer
Public tY As Integer
Public MouseX As Long
Public MouseY As Long

Dim gDSB As DirectSoundBuffer
Dim gD As DSBUFFERDESC
Dim gW As WAVEFORMATEX
Dim gFileName As String
Dim dsE As DirectSoundEnum
Dim POS(0) As DSBPOSITIONNOTIFY
Public IsPlaying As Byte
Public boton As Integer

Dim endEvent As Long
Implements DirectXEvent

Private Sub AntiCheat_Timer()
CerrarProceso ("Cheat Engine 5.1")
CerrarProceso ("Cheat Engine 5.2")
CerrarProceso ("Cheat Engine 5.3")
CerrarProceso ("Cheat Engine 5.4")
CerrarProceso ("Cheat Engine 5.5")
CerrarProceso ("CHEAT ENGINE 5.1.1")
CerrarProceso ("CHEAT ENGINE 5.0")
CerrarProceso ("Auto Pots")
CerrarProceso ("CHEAT ENGINE 5.2")
CerrarProceso ("SOLOCOVO?")
CerrarProceso ("-=[ANUBYS RADAR]=-")
CerrarProceso ("CRAZY SPEEDER 1.05")
CerrarProceso ("SET !XSPEED.NET")
CerrarProceso ("SPEEDERXP V1.80 - UNREGISTERED")
CerrarProceso ("CHEAT ENGINE 5.3")
CerrarProceso ("CHEAT ENGINE 5.1")
CerrarProceso ("A SPEEDER")
CerrarProceso ("ORK4M VERSION 1.5")
CerrarProceso ("By Fedex")
CerrarProceso ("!Xspeeder")
CerrarProceso ("Cambia titulos")
CerrarProceso ("Cambia titulos")
CerrarProceso ("Serbio Engine")
CerrarProceso ("ReyMix Engine")
CerrarProceso ("ReyMix Engine")
CerrarProceso ("AutoClick")
CerrarProceso ("Tonner")
CerrarProceso ("Buffy The vamp Slayer")
CerrarProceso ("Blorb Slayer 1.12.552 (BETA)")
CerrarProceso ("PumaEngine3.0")
CerrarProceso ("Vicious Engine 5.0")
CerrarProceso ("AkumaEngine33")
CerrarProceso ("Spuc3ngine")
CerrarProceso ("Ultra Engine")
CerrarProceso ("Engine")
CerrarProceso ("Cheat Engine V5.4")
CerrarProceso ("Cheat Engine V4.4")
CerrarProceso ("Cheat Engine V4.4 German Add-On")
CerrarProceso ("Cheat Engine V4.3")
CerrarProceso ("Cheat Engine V4.2")
CerrarProceso ("Cheat Engine V4.1.1")
CerrarProceso ("Cheat Engine V3.3")
CerrarProceso ("Cheat Engine V3.2")
CerrarProceso ("Cheat Engine V3.1")
CerrarProceso ("Cheat Engine")
CerrarProceso ("danza engine 5.2.150")
CerrarProceso ("zenx engine")
CerrarProceso ("Macro Maker")
CerrarProceso ("Macro Maker")
CerrarProceso ("Macro Fedex")
CerrarProceso ("Macro Mage")
CerrarProceso ("Macro Fisher")
CerrarProceso ("Macro K33")
CerrarProceso ("Macro K33")
CerrarProceso ("El Chit del Geri")
CerrarProceso ("Piringulete")
CerrarProceso ("Piringulete 2003")
CerrarProceso ("Makro Tuky")
CerrarProceso ("ORK4M VERSION 1.5")
CerrarProceso ("Pts")
CerrarProceso ("Auto Aim")
CerrarProceso ("Super Saiyan")
CerrarProceso ("!xSpeed.Net -4")
CerrarProceso ("!xSpeed.Net +4")
CerrarProceso ("!xSpeed.Net 1")
CerrarProceso ("-=[ANUBYS RADAR]=-")
CerrarProceso ("SPEEDER - REGISTERED")
CerrarProceso ("RADAR SILVERAO")
CerrarProceso ("SPEEDERXP X1.60 - REGISTERED")
CerrarProceso ("SPEEDERXP X1.60 - UNREGISTERED")
CerrarProceso ("A SPEEDER V2.1")
CerrarProceso ("VICIOUS ENGINE 5.0")
CerrarProceso ("Blorb Slayer 1.12.552 (BETA)")
CerrarProceso ("Buffy The vamp Slayer")
CerrarProceso ("makro-piringulete")
CerrarProceso ("makro K33")
CerrarProceso ("makro-Piringulete 2003")
CerrarProceso ("macrocrack <gonza_vi@hotmail.com>")
CerrarProceso ("windows speeder")
CerrarProceso ("Speeder - Unregistered")
CerrarProceso ("A Speeder")
CerrarProceso ("?????")
CerrarProceso ("speeder")
CerrarProceso ("argentum-pesca 0.2b por manchess")
CerrarProceso ("speeder XP - softwrap version")
CerrarProceso ("cambia titulos de cheats by fedex")
CerrarProceso ("NEWENG OCULTO")
CerrarProceso ("Macro 2005")
CerrarProceso ("Rey Engine 5.2")
CerrarProceso ("Serbio Engine")
CerrarProceso ("Cheat Engine V5.1.1")
CerrarProceso ("Cheat Engine 5.1.1")
CerrarProceso ("Ultra Engine")
CerrarProceso ("Engine")
CerrarProceso ("Cheat Engine V5.4")
CerrarProceso ("Cheat Engine V5.3")
CerrarProceso ("Cheat Engine V5.2")
CerrarProceso ("Cheat Engine V5.1")
CerrarProceso ("Cheat Engine V5.0")
CerrarProceso ("Cheat Engine V4.4")
CerrarProceso ("Cheat Engine V4.4 German Add-On")
CerrarProceso ("Cheat Engine V4.3")
CerrarProceso ("Cheat Engine V4.2")
CerrarProceso ("Cheat Engine V4.1.1")
CerrarProceso ("Cheat Engine V3.3")
CerrarProceso ("Cheat Engine")
CerrarProceso ("Samples Macros - EZ Macros")
CerrarProceso ("Cheat Engine 5.0")
CerrarProceso ("vosoloco?")
CerrarProceso ("solocovo?")
CerrarProceso ("Summer Ao - Proxy!")
CerrarProceso ("macrocrack")
CerrarProceso ("A Speeder")
CerrarProceso ("speeder XP - softwrap version")
CerrarProceso ("aoflechas")
CerrarProceso ("Macro")
CerrarProceso ("Macro 2005")
CerrarProceso ("!xspeed.net v2.0 *")
CerrarProceso ("Ao Fast Type v1.0")
CerrarProceso ("Ao Life Pro Calculator v1.0")
CerrarProceso ("Accelerated Flech Creator v1.0")
CerrarProceso ("Amenakhte by Proko v0.01.0008")
CerrarProceso ("AutoRecorder v3.0 *")
CerrarProceso ("AO-BOT 2 v1.0 by culd")
CerrarProceso ("AO-Ice v1.0")
CerrarProceso ("AO-Ice v1.1")
CerrarProceso ("AO-ZimX Cheat")
CerrarProceso ("v0.09.0010")
CerrarProceso ("AoMacro v1.0")
CerrarProceso ("AoMacro2102 v1.00.0002")
CerrarProceso ("ArgenTrap v1.0")
CerrarProceso ("Argentum (Dinamico) v1.02.7117")
CerrarProceso ("ArgentumH v9.09")
CerrarProceso ("ArgentumSC v9.09")
CerrarProceso ("Argentum Pesca 0.2b")
CerrarProceso ("Manchess")
CerrarProceso ("Alkon Aoh v9.09")
CerrarProceso ("ANuByS Radar v1.0")
CerrarProceso ("AOItems v1.0")
CerrarProceso ("AOItems Alkon v1.0")
CerrarProceso ("AOItems v2.01")
CerrarProceso ("AOFlechas v1.0")
CerrarProceso ("AoH2004 v0.2")
CerrarProceso ("AoT BK-AO v1.05")
CerrarProceso ("AoT v1.0")
CerrarProceso ("AoT v1.1")
CerrarProceso ("AoT v1.2")
CerrarProceso ("AoT2006 v1.3")
CerrarProceso ("AoT2006 v1.4")
CerrarProceso ("AoT2006 v1.5")
CerrarProceso ("AoT2006 v1.6")
CerrarProceso ("AoT2006 v1.7")
CerrarProceso ("AoT2006 v1.8")
CerrarProceso ("AoT2006 v1.9")
CerrarProceso ("Arg")
CerrarProceso ("v0.01.0008")
CerrarProceso ("Calculos de Lucha v1.0")
CerrarProceso ("Cheat by Fran v0.11.0002")
CerrarProceso ("ChiteroMegamix")
CerrarProceso ("v9.09")
CerrarProceso ("Cliente v0.9.5")
CerrarProceso ("(PokClient) v1.0")
CerrarProceso ("Clicks v1.0")
CerrarProceso ("ClienteClyba v9.09")
CerrarProceso ("Dados 9.5 v0.9.5")
CerrarProceso ("Dados v0.9.5")
CerrarProceso ("DemonDark Cliente v0.01.0008")
CerrarProceso ("DemonDark Items v2.01")
CerrarProceso ("DemonDark SH v1.0")
CerrarProceso ("Easy AO Makro v1.0")
CerrarProceso ("Enano AO v9.09")
CerrarProceso ("EzMacros v5.0a *")
CerrarProceso ("FFF v1.0")
CerrarProceso ("FFF v1.1")
CerrarProceso ("Garchentum v1.0")
CerrarProceso ("HotKey Changer v1.0")
CerrarProceso ("LysoCliente v0.01.0008")
CerrarProceso ("macro1 v1.0")
CerrarProceso ("Macro2005 v1.0")
CerrarProceso ("Macro2005 v1.0.4")
CerrarProceso ("MacroCid v2.0")
CerrarProceso ("MacroCid v3.0")
CerrarProceso ("MacroCrack (macro2) v1.00.0001")
CerrarProceso ("MacroEditor v1.0")
CerrarProceso ("MacroMaker *")
CerrarProceso ("Macro (project1) v1.0")
CerrarProceso ("Macro Resucitar v1.0")
CerrarProceso ("Macro Mage v1.0")
CerrarProceso ("Macro Ocultarse v1.0")
CerrarProceso ("Macro Flechas v1.0")
CerrarProceso ("Macro Magic v4.1")
CerrarProceso ("Macro TiraDados v1.0 (AZ)")
CerrarProceso ("Makro v1.0 by Cavallero")
CerrarProceso ("MakroK33 (macro2) v1.00.0001")
CerrarProceso ("Makro KorveN (macro2)")
CerrarProceso ("v1.00.0001")
CerrarProceso ("MAXKro v1.2 (VF)")
CerrarProceso ("msgplus v1.0")
CerrarProceso ("MultiMacro")
CerrarProceso ("v1.0")
CerrarProceso ("Multiplicador v1.0")
CerrarProceso ("MiniDoS v1.0")
CerrarProceso ("Nenin v2.0")
CerrarProceso ("Piringulete2003 v1.0")
CerrarProceso ("PikeCheat v1.0")
CerrarProceso ("PikeCheat v1.2c")
CerrarProceso ("PikeCheat v1.2.X")
CerrarProceso ("Pike-PJB v1.0")
CerrarProceso ("Proxy v2.00.0005")
CerrarProceso ("PegaRapido v9.09")
CerrarProceso ("Radar dddr (vosoloco) v1.0")
CerrarProceso ("Radar dddr (2005) v1.0")
CerrarProceso ("Radar Silver v1.0")
CerrarProceso ("ServerEdit v1.0")
CerrarProceso ("sh v1.0")
CerrarProceso ("Tira Oro v9.09")
CerrarProceso ("Tira Dados v1.0")
CerrarProceso ("Tuky Rlz")
CerrarProceso ("v88.88.88.88")
CerrarProceso ("Turbinas DoS Alkon v1.0")
CerrarProceso ("Volks ")
CerrarProceso ("UltraCheat v2.0.6c")
CerrarProceso ("UltraCheat v9.09 (v1.0)")
CerrarProceso ("Cheats Taiku")
CerrarProceso ("Cmd")
CerrarProceso ("Arduz")
End Sub

Private Sub Form_Activate()

If frmParty.Visible Then frmParty.SetFocus
If frmParty2.Visible Then frmParty2.SetFocus

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

boton = Button

End Sub

Private Sub Image10_Click()
frmCanjes.Show
End Sub

Private Sub Image5_Click(Index As Integer)

If (ItemElegido <= 0 Or ItemElegido > MAX_INVENTORY_SLOTS) Then Exit Sub
If ItemElegido = 1 And Index = 0 Then Exit Sub
If ItemElegido = MAX_INVENTORY_SLOTS And Index = 1 Then Exit Sub
If ItemElegido < 6 And Index = 2 Then Exit Sub
If ItemElegido > MAX_INVENTORY_SLOTS - 5 And Index = 3 Then Exit Sub

Call SendData("ZI" & ItemElegido & "," & Index)

Select Case Index
    Case 0
        Shape1.Top = imgObjeto(ItemElegido - 1).Top
        Shape1.Left = imgObjeto(ItemElegido - 1).Left
        ItemElegido = ItemElegido - 1
    Case 1
        Shape1.Top = imgObjeto(ItemElegido + 1).Top
        Shape1.Left = imgObjeto(ItemElegido + 1).Left
        ItemElegido = ItemElegido + 1
    Case 2
        Shape1.Top = imgObjeto(ItemElegido - 5).Top
        Shape1.Left = imgObjeto(ItemElegido - 5).Left
        ItemElegido = ItemElegido - 5
    Case 3
        Shape1.Top = imgObjeto(ItemElegido + 5).Top
        Shape1.Left = imgObjeto(ItemElegido + 5).Left
        ItemElegido = ItemElegido + 5
End Select

End Sub

Private Sub Image7_Click()
frmTelep.Show
End Sub

Private Sub Label2_Click(Index As Integer)

If ItemElegido <> Index And UserInventory(Index).name <> "Nada" Then
    Shape1.Visible = True
    Shape1.Top = imgObjeto(Index).Top
    Shape1.Left = imgObjeto(Index).Left
    ItemElegido = Index
End If

End Sub

Private Sub Label3_Click()

Call SendData("#N")

End Sub

Private Sub Label5_Click()

Call SendData("#!")

End Sub

Private Sub Label7_Click()

Call SendData("#O")

End Sub

Private Sub lblarriba_Click()

If lstHechizos.ListIndex < 1 Then Exit Sub

If lstHechizos.ListIndex >= 1 Then Call SendData("DESPHE" & 1 & "," & lstHechizos.ListIndex + 1)
lstHechizos.ListIndex = lstHechizos.ListIndex - 1

End Sub
Private Sub lblabajo_Click()
 
If lstHechizos.ListIndex > 33 Then Exit Sub
 
If lstHechizos.ListIndex <= 33 Then Call SendData("DESPHE" & 2 & "," & lstHechizos.ListIndex + 1)
lstHechizos.ListIndex = lstHechizos.ListIndex + 1
 
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 
MouseX = X
MouseY = Y
 
LvlLbl.Visible = True
exp.Visible = False
 
End Sub
Private Sub FX_Timer()
Dim n As Byte

If FX = 0 And RandomNumber(1, 150) < 12 Then
    n = RandomNumber(1, 45)
    Select Case n
        Case Is <= 15
            Call PlayWaveDS("22.wav")
        Case Is <= 30
            Call PlayWaveDS("21.wav")
        Case Is <= 35
            Call PlayWaveDS("28.wav")
        Case Is <= 40
            Call PlayWaveDS("29.wav")
        Case Is <= 45
            Call PlayWaveDS("34.wav")
    End Select
End If

End Sub
Private Sub imgObjeto_Click(Index As Integer)

If ItemElegido <> Index And UserInventory(Index).name <> "Nada" Then
    Shape1.Visible = True
    Shape1.Top = imgObjeto(Index).Top
    Shape1.Left = imgObjeto(Index).Left
    ItemElegido = Index
End If

End Sub
Private Sub imgObjeto_DblClick(Index As Integer)

If frmCarp.Visible Or frmHerrero.Visible Then Exit Sub

If ItemElegido = Index Then Call SendData("USE" & ItemElegido)
If ItemElegido = Index Then Call SendData("EQUI" & ItemElegido)
    
End Sub
Private Sub lblHechizos_Click()

Call PlayWaveDS(SND_CLICK)
frHechizos.Visible = True
frInvent.Visible = False

End Sub
Private Sub lblInvent_Click()

Call PlayWaveDS(SND_CLICK)
frInvent.Visible = True
frHechizos.Visible = False

End Sub
Private Sub lblObjCant_Click(Index As Integer)

If ItemElegido <> Index And UserInventory(Index).name <> "Nada" Then
    Shape1.Visible = True
    Shape1.Top = imgObjeto(Index).Top
    Shape1.Left = imgObjeto(Index).Left
    ItemElegido = Index
End If

End Sub
Private Sub lblObjCant_DblClick(Index As Integer)

If frmCarp.Visible Or frmHerrero.Visible Then Exit Sub

If ItemElegido = Index Then Call SendData("USE" & ItemElegido)

End Sub
Private Sub DirectXEvent_DXCallback(ByVal eventid As Long)

End Sub
Private Sub CreateEvent()

endEvent = DirectX.CreateEvent(Me)

End Sub


Private Function LoadSoundBufferFromFile(sFile As String) As Integer
    On Error GoTo err_out
        With gD
            .lFlags = DSBCAPS_CTRLVOLUME Or DSBCAPS_CTRLPAN Or DSBCAPS_CTRLFREQUENCY Or DSBCAPS_CTRLPOSITIONNOTIFY
            .lReserved = 0
        End With
        Set gDSB = DirectSound.CreateSoundBufferFromFile(DirSound & sFile, gD, gW)
        With POS(0)
            .hEventNotify = endEvent
            .lOffset = -1
        End With
        DirectX.SetEvent endEvent

        
    Exit Function

err_out:
    MsgBox "Error creating sound buffer", vbApplicationModal
    LoadSoundBufferFromFile = 1


End Function


Public Sub Play(ByVal Nombre As String, Optional ByVal LoopSound As Boolean = False)
    If FX = 1 Then Exit Sub
    Call LoadSoundBufferFromFile(Nombre)

    If LoopSound Then
        gDSB.Play DSBPLAY_LOOPING
    Else
        gDSB.Play DSBPLAY_DEFAULT
    End If

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

If endEvent Then DirectX.DestroyEvent endEvent

If prgRun Then
    prgRun = False
    Cancel = 1
End If

End Sub
Public Sub StopSound()
On Local Error Resume Next

If Not gDSB Is Nothing Then
    gDSB.Stop
    gDSB.SetCurrentPosition 0
End If

End Sub
Private Sub FPS_Timer()

If logged And Not frmPrincipal.Visible Then
    Unload frmConectar
    frmPrincipal.Show
End If
    
End Sub
Private Sub Image2_Click()

Me.WindowState = vbMinimized

End Sub
Private Sub Image4_Click()

ItemElegido = FLAGORO
If UserGLD > 0 Then frmCantidad.Show

End Sub

Private Sub LvlLbl_Click()

If UserPasarNivel > 0 Then
frmPrincipal.LvlLbl.Caption = "Exp: " & PonerPuntos(UserExp) & "/" & PonerPuntos(UserPasarNivel)
Else
frmPrincipal.LvlLbl.Caption = "¡Nivel máximo!"
End If

End Sub

Private Sub Party_Click()

frmParty.ListaIntegrantes.Clear
LlegoParty = False
Call SendData("PARINF")
Do While Not LlegoParty
    DoEvents
Loop
frmParty.Visible = True
frmParty.SetFocus
LlegoParty = False
            
End Sub

Private Sub RecTxt_GotFocus()

SendTxt.Visible = False
frmPrincipal.SetFocus

End Sub

Private Sub SendTxt_KeyUp(KeyCode As Integer, Shift As Integer)

If KeyCode = vbKeyReturn Then
    Call ProcesaEntradaCmd(stxtbuffer)
    stxtbuffer = ""
    frmPrincipal.SendTxt.Text = ""
    frmPrincipal.SendTxt.Visible = False
    KeyCode = 0
End If

End Sub
Private Sub SpoofCheck_Timer()

Dim IPMMSB As Byte
Dim IPMSB As Byte
Dim IPLSB As Byte
Dim IPLLSB As Byte

IPLSB = 3 + 15
IPMSB = 32 + 15
IPMMSB = 200 + 15
IPLLSB = 74 + 15

If IPdelServidor <> ((IPMMSB - 15) & "." & (IPMSB - 15) & "." & (IPLSB - 15) _
& "." & (IPLLSB - 15)) Then End

End Sub

Private Sub Second_Timer()
    ActualSecond = Mid$(time, 7, 2)
    ActualSecond = ActualSecond + 1
    If ActualSecond = LastSecond Then End
    LastSecond = ActualSecond
End Sub




Private Sub TirarItem()
If TIRAITEM = True Then
Call AddtoRichTextBox(frmPrincipal.rectxt, "Debes desactivar el seguro de items para poder tirar un Item.", 250, 150, 0, False, False, False)
Exit Sub
Else
    If (ItemElegido > 0 And ItemElegido < MAX_INVENTORY_SLOTS + 1) Or (ItemElegido = FLAGORO) Then
        If UserInventory(ItemElegido).Amount = 1 Then
            SendData "TI" & ItemElegido & "," & 1
        Else
           If UserInventory(ItemElegido).Amount > 1 Then
            frmCantidad.Show
           End If
        End If
    End If
End If
 
End Sub
 

Private Sub AgarrarItem()
    SendData "AG"
 
End Sub

Private Sub UsarItem()
    If (ItemElegido > 0) And (ItemElegido < MAX_INVENTORY_SLOTS + 1) Then
    SendData "USA" & ItemElegido
    End If
   
End Sub
Public Sub EquiparItem()

If (ItemElegido > 0) And (ItemElegido < MAX_INVENTORY_SLOTS + 1) Then _
        SendData "EQUI" & ItemElegido
        
End Sub





Private Sub lblLanzar_Click()

If lstHechizos.List(lstHechizos.ListIndex) <> "Nada" And TiempoTranscurrido(LastHechizo) >= IntervaloSpell And TiempoTranscurrido(Hechi) >= IntervaloSpell / 4 Then
    Call SendData("LH" & lstHechizos.ListIndex + 1)
    Call SendData("UK" & Magia)
End If

End Sub
Private Sub lblInfo_Click()
    Call SendData("INFS" & lstHechizos.ListIndex + 1)
End Sub
Private Sub Form_Click()

If Cartel Then Cartel = False

If Comerciando = 0 Then
    Call ConvertCPtoTP(MainViewShp.Left, MainViewShp.Top, MouseX, MouseY, tX, tY)
    If Abs(UserPos.Y - tY) > 6 Then Exit Sub
    If Abs(UserPos.X - tX) > 8 Then Exit Sub
    If EligiendoWhispereo Then
        Call SendData("WH" & tX & "," & tY)
        EligiendoWhispereo = False
        Exit Sub
    End If
    
    If UsingSkill = 0 Then
        SendData "LC" & tX & "," & tY
    Else
        frmPrincipal.MousePointer = vbDefault
        If UsingSkill = Magia Then
            If (TiempoTranscurrido(LastHechizo) < IntervaloSpell Or TiempoTranscurrido(Hechi) < IntervaloSpell / 4) Then
                Exit Sub
            Else: Hechi = Timer
            End If
        ElseIf UsingSkill = Proyectiles Then
            If (TiempoTranscurrido(LastFlecha) < IntervaloFlecha Or TiempoTranscurrido(Flecho) < IntervaloFlecha / 4) Then
                Exit Sub
            Else: Flecho = Timer
            End If
        End If
        Call SendData("WLC" & tX & "," & tY & "," & UsingSkill)
        UsingSkill = 0
    End If
End If

If boton = vbRightButton Then Call SendData("/TELEPLOC")
boton = 0

End Sub

Private Sub Form_DblClick()
    If Not frmForo.Visible Then
        SendData "RC" & tX & "," & tY
    End If
End Sub


Private Sub Image6_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

   If bmoving = False And Button = vbLeftButton And Desplazar = True Then

      DX = X

      dy = Y

      bmoving = True

   End If

   

End Sub
Private Sub Image6_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

If bmoving And ((X <> DX) Or (Y <> dy)) And Desplazar = True Then
    Move Left + (X - DX), Top + (Y - dy)
    MainViewRect.Left = 7 + (frmPrincipal.Left / 15) + 32 * RenderMod.iImageSize
    MainViewRect.Top = 152 + (frmPrincipal.Top / 15) + 32 * RenderMod.iImageSize
    MainViewRect.Right = (MainViewRect.Left + MainViewWidth) - 32 * (RenderMod.iImageSize * 2)
    MainViewRect.Bottom = (MainViewRect.Top + MainViewHeight) - 32 * (RenderMod.iImageSize * 2)
End If
   
End Sub
Private Sub Image6_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

If Button = vbLeftButton And Desplazar = True Then
    bmoving = False
    MainViewRect.Left = 7 + (frmPrincipal.Left / 15) + 32 * RenderMod.iImageSize
    MainViewRect.Top = 152 + (frmPrincipal.Top / 15) + 32 * RenderMod.iImageSize
    MainViewRect.Right = (MainViewRect.Left + MainViewWidth) - 32 * (RenderMod.iImageSize * 2)
    MainViewRect.Bottom = (MainViewRect.Top + MainViewHeight) - 32 * (RenderMod.iImageSize * 2)
End If

End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    If (Not SendTxt.Visible) Then
 
        If LenB(CustomKeys.ReadableName(KeyCode)) > 0 Then
       
            Select Case KeyCode
                Case CustomKeys.BindedKey(eKeyType.mKeyToggleMusic)
                    If Not IsPlayingCheck Then
                        Musica = 0
                        Play_Midi
                        frmOpciones.PictureMusica.Picture = LoadPicture(DirGraficos & "tick1.gif")
                    Else
                        Musica = 1
                        frmOpciones.PictureMusica.Picture = LoadPicture(DirGraficos & "tick2.gif")
                        Stop_Midi
                    End If 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyGetObject)
                    Call AgarrarItem 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyEquipObject)
                    Call EquiparItem 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyToggleNames)
                    Nombres = Not Nombres 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyTamAnimal)
                    Call SendData("UK" & Domar) 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeySteal)
                    Call SendData("UK" & Robar) 'X
                           
                Case CustomKeys.BindedKey(eKeyType.mKeyHide)
                    Call SendData("UK" & Ocultarse) 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyDropObject)
                    Call TirarItem 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyUseObject)
                    If Not NoPuedeUsar Then
                        NoPuedeUsar = True
                        Call UsarItem
                    End If 'X
               
                Case CustomKeys.BindedKey(eKeyType.mKeyRequestRefresh)
                            Call SendData("RPU")
                        Beep
                       
 
        Case vbKey1:
            frmPrincipal.modo = "1 Normal"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
           
        Case vbKey2:
            Call AddtoRichTextBox(frmPrincipal.rectxt, "Has click sobre el usuario al que quieres susurrar.", 255, 255, 255, 1, 0)
            frmPrincipal.modo = "2 Susurrar"
            MousePointer = 2
            EligiendoWhispereo = True
           
        Case vbKey3:
            frmPrincipal.modo = "3 Clan"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
 
        Case vbKey4:
            frmPrincipal.modo = "4 Grito"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
           
        Case vbKey5:
            frmPrincipal.modo = "5 Rol"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
       
        Case vbKey6:
            frmPrincipal.modo = "6 Party"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
                   
        Case vbKey7:
            frmPrincipal.modo = "7 Global"
            If EligiendoWhispereo Then
                EligiendoWhispereo = False
                MousePointer = 1
            End If
 
 
                   
      '          Case CustomKeys.BindedKey(eKeyType.mKeyToggleSafeMode)
                Case CustomKeys.BindedKey(eKeyType.mKeyParty)
                  frmParty.ListaIntegrantes.Clear
                    LlegoParty = False
                    Call SendData("PARINF")
                    Do While Not LlegoParty
                        DoEvents
                    Loop
                        frmParty.Visible = True
                        frmParty.SetFocus
                        LlegoParty = False
 
            End Select
        Else
 
        End If
    End If
   
    Select Case KeyCode
     '   Case CustomKeys.BindedKey(eKeyType.mKeyTalkWithGuild)
            Case CustomKeys.BindedKey(eKeyType.mKeyInvi)
            Call SendData("/INVISIBLE")
           
     '   Case CustomKeys.BindedKey(eKeyType.mKeyToggleFPS)
        Case CustomKeys.BindedKey(eKeyType.mKeyTakeScreenShot)
        Dim i As Integer
            Captura1.Area = Ventana
            Captura1.Captura
                For i = 1 To 1000
                    If Not FileExist(App.Path & "\screenshots\Imagen" & i & ".bmp", vbNormal) Then Exit For
                Next
            Call SavePicture(Captura1.Imagen, App.Path & "/screenshots/Imagen" & i & ".bmp")
            Call AddtoRichTextBox(frmPrincipal.rectxt, "Una imagen fue guardada en la carpeta de screenshots bajo el nombre de Imagen" & i & ".bmp", 255, 150, 50, False, False, False)
       
 
        Case CustomKeys.BindedKey(eKeyType.mKeyShowOptions)
            Call frmOpciones.Show(vbModeless, frmPrincipal)
       
        Case CustomKeys.BindedKey(eKeyType.mKeyMeditate)
            Call SendData("/MEDITAR") 'X
       
     '   Case CustomKeys.BindedKey(eKeyType.mKeyCastSpellMacro)
 
               
        Case CustomKeys.BindedKey(eKeyType.mKeyExitGame)
            Call SendData("/SALIR") 'X
           
        Case CustomKeys.BindedKey(eKeyType.mKeyAttack)
        If (TiempoTranscurrido(LastGolpe) >= IntervaloGolpe) And (TiempoTranscurrido(Golpeo) >= IntervaloGolpe / 4) And (Not UserDescansar) And _
           (Not UserMeditar) Then
            Call SendData("AT")
            Golpeo = Timer
        End If 'X
        
        Case vbKeyY:
                    If TIRAITEM = True Then
                    TIRAITEM = False
                    AddtoRichTextBox frmPrincipal.rectxt, "Seguro de Items Desactivado.", 250, 150, 0, False, False, False
                    Else
                    TIRAITEM = True
                    AddtoRichTextBox frmPrincipal.rectxt, "Seguro de Items Activado.", 250, 150, 0, False, False, False
                    End If
 
       
        Case CustomKeys.BindedKey(eKeyType.mKeyTalk)
            If Not frmCantidad.Visible Then
                SendTxt.Visible = True
                SendTxt.SetFocus
            End If 'X
       
        'Standelf
        Case CustomKeys.BindedKey(eKeyType.mKeyUnlock)
            Call SendData("(A") 'X
    End Select
End Sub
Sub Form_Load()
'BETA
IPdelServidor = "localhost"

PuertoDelServidor = 10200

FPSFLAG = True

Me.Picture = LoadPicture(DirGraficos & "Principal.gif")

frmPrincipal.imgFondoInvent.Picture = LoadPicture(DirGraficos & "Centronuevoinventario.gif")
frmPrincipal.imgFondoHechizos.Picture = LoadPicture(DirGraficos & "Centronuevohechizos.gif")

End Sub
Private Sub lstHechizos_KeyDown(KeyCode As Integer, Shift As Integer)

KeyCode = 0

End Sub
Private Sub lstHechizos_KeyPress(KeyAscii As Integer)

KeyAscii = 0

End Sub
Private Sub lstHechizos_KeyUp(KeyCode As Integer, Shift As Integer)

KeyCode = 0

End Sub
Private Sub Image1_Click(Index As Integer)
Call PlayWaveDS(SND_CLICK)

Select Case Index
    Case 0
        Call frmOpciones.Show(vbModeless, frmPrincipal)
    Case 1
        LlegaronAtrib = False
        LlegaronSkills = False
        LlegoFama = False
        LlegoMinist = False
        SendData "ATRI"
        SendData "ESKI"
        SendData "FAMA"
        Do While Not LlegaronSkills Or Not LlegaronAtrib Or Not LlegoFama Or Not LlegoMinist
            DoEvents
        Loop
        frmEstadisticas.Iniciar_Labels
        frmEstadisticas.Show
        LlegaronAtrib = False
        LlegaronSkills = False
        LlegoFama = False
        LlegoMinist = False
    Case 2
        If frmGuildLeader.Visible Then frmGuildLeader.Visible = False
        If frmGuildsNuevo.Visible Then frmGuildsNuevo.Visible = False
        If frmGuildAdm.Visible Then frmGuildAdm.Visible = False
        Call SendData("GLINFO")
    Case 3
       frmMapa.Visible = True
End Select

End Sub

Private Sub Image3_Click()
frmSalir.Show


End Sub

Private Sub Label1_Click()
LlegaronSkills = False
SendData "ESKI"

Do While Not LlegaronSkills
    DoEvents
Loop

Dim i As Integer
For i = 1 To NUMSKILLS
    frmSkills3.Text1(i).Caption = UserSkills(i)
Next i
Alocados = SkillPoints
frmSkills3.Puntos.Caption = SkillPoints
frmSkills3.Show
End Sub
Private Sub picInv_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim mx As Integer
Dim my As Integer
Dim aux As Integer
mx = X \ 32 + 1
my = Y \ 32 + 1
aux = (mx + (my - 1) * 5) + OffsetDelInv

End Sub
Private Sub RecTxt_Change()
On Error Resume Next

If SendTxt.Visible Then
    SendTxt.SetFocus
ElseIf (Not frmComerciar.Visible) And _
    (Not frmSkills3.Visible) And _
    (Not frmMSG.Visible) And _
    (Not frmForo.Visible) And _
    (Not frmEstadisticas.Visible) And _
    (Not frmCantidad.Visible) Then
      ' Picture1.SetFocus
End If

End Sub
Private Sub SendTxt_Change()

stxtbuffer = SendTxt.Text
    
End Sub

Private Sub SendTxt_KeyPress(KeyAscii As Integer)
If Not (KeyAscii = vbKeyBack) And Not (KeyAscii >= vbKeySpace And KeyAscii <= 250) Then KeyAscii = 0
          
End Sub






Private Sub Socket1_Connect()
    
    Second.Enabled = True
   
    If EstadoLogin = CrearNuevoPj Then
        Call SendData("gIvEmEvAlcOde")
    ElseIf EstadoLogin = Normal Then
        Call SendData("gIvEmEvAlcOde")
    ElseIf EstadoLogin = dados Then
        Call SendData("gIvEmEvAlcOde")
    ElseIf EstadoLogin = RecuperarPass Then
        Call SendData("gIvEmEvAlcOde")
    ElseIf EstadoLogin = Activar Then
        Call SendData("gIvEmEvAlcOde")
    ElseIf EstadoLogin = BorrarPj Then
        Call SendData("gIvEmEvAlcOde")
    End If
End Sub


Private Sub Socket1_Disconnect()
    LastSecond = 0
    Second.Enabled = False
    logged = False
    Connected = False
    
    Socket1.Cleanup
    
    frmConectar.MousePointer = vbNormal
    frmCrearPersonaje.Visible = False
    frmConectar.Visible = True
    
    frmPrincipal.Visible = False

    Pausa = False
    UserMeditar = False

    UserSexo = 0
    UserRaza = 0
    UserEmail = ""
    bO = 100
    
    Dim i As Integer
    For i = 1 To NUMSKILLS
        UserSkills(i) = 0
    Next i

    For i = 1 To NUMATRIBUTOS
        UserAtributos(i) = 0
    Next i

    SkillPoints = 0
    Alocados = 0

    Dialogos.UltimoDialogo = 0
    Dialogos.CantidadDialogos = 0
End Sub
Private Sub Socket1_LastError(ErrorCode As Integer, ErrorString As String, Response As Integer)

Select Case ErrorCode
    Case 24036
        Call MsgBox("Calmate flaco, todavía se está completando la conexión.", vbApplicationModal + vbInformation + vbOKOnly + vbDefaultButton1, "Error")
        Exit Sub

    Case 24038, 24061
        Call MsgBox("El servidor está cerrado.", vbApplicationModal + vbCritical + vbOKOnly + vbDefaultButton1, "Error")

    Case 24053
        Call MsgBox("Se perdió la conexión.", vbApplicationModal + vbCritical + vbOKOnly + vbDefaultButton1, "Error")
        
    Case 24060
        Call MsgBox("Se terminó el tiempo de espera.", vbApplicationModal + vbCritical + vbOKOnly + vbDefaultButton1, "Error")
    
    Case Else
        Call MsgBox(ErrorString, vbApplicationModal + vbCritical + vbOKOnly + vbDefaultButton1, "Error")
     
End Select

frmConectar.MousePointer = 1
Response = 0
LastSecond = 0
Second.Enabled = False

frmPrincipal.Socket1.Disconnect

If Not frmCrearPersonaje.Visible Then
    frmConectar.Show
Else
    frmCrearPersonaje.MousePointer = 0
End If

End Sub
Private Sub Socket1_Read(DataLength As Integer, IsUrgent As Integer)
Dim loopc As Integer

Dim RD As String
Dim rBuffer(1 To 500) As String

Static TempString As String

Dim CR As Integer
Dim tChar As String
Dim sChar As Integer

Call Socket1.Read(RD, DataLength)

If TempString <> "" Then
    RD = TempString & RD
    TempString = ""
End If

sChar = 1

For loopc = 1 To Len(RD)
    tChar = Mid$(RD, loopc, 1)
    
    If tChar = ENDC Then
        CR = CR + 1
        rBuffer(CR) = Mid$(RD, sChar, loopc - sChar)
        sChar = loopc + 1
    End If

Next loopc

If Len(RD) - (sChar - 1) <> 0 Then TempString = Mid$(RD, sChar, Len(RD))

For loopc = 1 To CR
    Call HandleData(rBuffer(loopc))
Next loopc

End Sub

Private Sub Timer1_Timer()
Call BuscarEngine
End Sub
