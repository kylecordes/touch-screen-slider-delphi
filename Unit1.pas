{
Slider Control for Touch-Screen Applications
Copyright 2006, Kyle Cordes
Released under the Apache License 2.0

This file is just example code, the slider itself is in uSlider.pas.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, uSlider, ComCtrls;

type
  TSliderExampleForm = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Label10: TLabel;
    PageControl1: TPageControl;
    ExampleSheet: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Panel2: TPanel;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  SliderExampleForm: TSliderExampleForm;

implementation

{$R *.dfm}

{ **************** IMPORTANT *************************

  The Timer is here, on the test/demo form, and not in the slider
  component, because Windows does not like having many timers running; thus
  we make one here, and share it all the sliders by calling all of them
  when it ticks.
}

procedure TSliderExampleForm.Timer1Timer(Sender: TObject);
var
  I: integer;
begin
  for I := 0 to ComponentCount-1 do begin
    if Components[I] is TSlider then
      (Components[I] as TSlider).MoveCloser;
  end;
end;

procedure TSliderExampleForm.FormCreate(Sender: TObject);
var
  Slider: TSlider;
  I: integer;
begin
  for I := 0 to 5 do begin
    Slider := TSlider.Create(Self);
    Slider.Parent := ExampleSheet;
    Slider.Left := 24 + I * 75;
    Slider.Top := 16;
    Slider.Width := 49;
    Slider.Height := 249;
  end;
end;

end.

