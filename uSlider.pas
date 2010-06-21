{
Slider Control for Touch-Screen Applications
Copyright 2006, Kyle Cordes
Released under the Apache License 2.0


Critical usage note:

In order to avoid consuming excessive resources in applications where many
instances of this slider are used, it does NOT create its own timer or
background thread. You must set up a timer on your form, and call the
MoveCloser method from it. There is an example of this in the sample
application provided.
}

unit uSlider;

interface

uses
  Classes, Windows, Graphics, Controls, ExtCtrls;

type
  TSlider = class(TPaintBox)
  protected
    procedure MouseMove(Shift: TShiftState; X: Integer; Y: Integer);
      override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: Integer; Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X: Integer;
      Y: Integer); override;
    procedure Paint; override;
  private
    SliderY, TargetY: integer;
    WhenPushed: Cardinal;
    procedure CalculateTargetY(const Y: integer);
    procedure MoveOneStepCloser;
  public
    procedure MoveCloser;
  end;

implementation

{ TSlider }

uses
  Math;

const
  SliderHeight = 15;

procedure TSlider.CalculateTargetY(const Y: integer);
begin
  TargetY := Y - (SliderHeight div 2);
  if TargetY < 0 then
    TargetY := 0;

  if TargetY > Height - SliderHeight then
    TargetY := Height - SliderHeight;
end;

procedure TSlider.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  WhenPushed := GetTickCount;
  CalculateTargetY(Y);
  MoveOneStepCloser;
end;

procedure TSlider.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssLeft in Shift then begin
    CalculateTargetY(Y);
  end;
end;

procedure TSlider.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  TargetY := SliderY; // stop motion when mouse released
end;

procedure TSlider.MoveCloser;
var
  SpeedLimit: integer;
  Gap: integer;
  CurrentTickCount: Cardinal;
begin
  if TargetY = SliderY then
    Exit;

  CurrentTickCount := GetTickCount;

  // Wait briefly, so a single click does not move it
  if CurrentTickCount < WhenPushed+120 then
    Exit;

  // Go up slowly at first, then after 700 milliseconds go up more quickly
  SpeedLimit := 1;
  if CurrentTickCount > WhenPushed+700 then
    SpeedLimit := 2;

  // Go down very fast
  if TargetY > SliderY then
    SpeedLimit := 15;

  Gap := Abs(TargetY - SliderY);

  SliderY := SliderY + Sign(TargetY - SliderY) * Min(Gap, SpeedLimit);

  Invalidate;
end;

procedure TSlider.MoveOneStepCloser;
begin
  if TargetY = SliderY then
    Exit;

  // In this example, assume one step is one pixel.  In reality we need to
  // do all this based on target and actual slider "Value" which is not
  // the same as pixels, rather it is the configured 0..100 or -72..0 scale.

  if TargetY > SliderY then
    SliderY := SliderY + 1;

  if TargetY < SliderY then
    SliderY := SliderY - 1;

  Invalidate;
end;

procedure TSlider.Paint;
begin
  inherited;

  // I have used an ugly, but visible color scheme in this code. I suggest
  // changing this to a more attractive and suitable scheme, or even using
  // a tasteful bitmap for the "handle", in any real application.

  Canvas.Pen.Color := clGray;
  Canvas.Rectangle(0, 0, Width, Height);
  Canvas.Rectangle(30, 5, 34, Height - 5);

  Canvas.TextOut(2, 1, '0');
  Canvas.TextOut(2, Height - canvas.TextHeight('-72')-1, '-72');

  Canvas.Pen.Color := clRed;
  Canvas.Brush.Color := clYellow;
  Canvas.Rectangle(20, SliderY, Width - 5, SLiderY + SliderHeight);
end;

end.

