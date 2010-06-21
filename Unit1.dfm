object SliderExampleForm: TSliderExampleForm
  Left = 307
  Top = 232
  Caption = 'Slider Movement Example'
  ClientHeight = 337
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 481
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Label10: TLabel
      Left = 4
      Top = 6
      Width = 278
      Height = 13
      Caption = 'Kyle Cordes - Oasis Digital Solutions Inc. - oasisdigital.com'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 481
    Height = 311
    ActivePage = ExampleSheet
    Align = alClient
    TabOrder = 1
    object ExampleSheet: TTabSheet
      Caption = 'Example'
      object Bevel1: TBevel
        Left = 8
        Top = 8
        Width = 457
        Height = 265
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Explanation'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 473
        Height = 283
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 10
          Width = 453
          Height = 263
          Align = alClient
          AutoSize = False
          Caption = 
            'This example program shows how our slider controls will work for' +
            ' "touch screen" use in a GUI for controlling an audio amplificat' +
            'ion system.  The important design attributes:'#13#10#13#10'1) it does not ' +
            'matter if you click (touch) the control on the handle or not; on' +
            ' a touch screen, hitting the handle is hard.'#13#10#13#10'2) when increasi' +
            'ng the volume, the rate of change is limited, to make it hard to' +
            ' accidentally create loud "feedback"'#13#10#13#10'3) when decreasing the v' +
            'olume, the rate of change is much faster but still limited'#13#10#13#10'Th' +
            'is example is for the movement - the real controls will be "skin' +
            'ned" to look good.'
          WordWrap = True
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 15
    OnTimer = Timer1Timer
    Left = 224
    Top = 224
  end
end
