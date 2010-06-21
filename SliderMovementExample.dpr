program SliderMovementExample;

uses
  Forms,
  Unit1 in 'Unit1.pas' {SliderExampleForm},
  uSlider in 'uSlider.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSliderExampleForm, SliderExampleForm);
  Application.Run;
end.


