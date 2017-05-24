program MezhplanetniyeZanyatiya;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

var
  Str: String;
  I, J, N, M, W: Integer;


begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(M, W);

  if M mod W <> 0 then
    Write(M div W, ' ', M div W + 1)
  else
    Write(M div W);

  CloseFile(Input);
  CloseFile(Output);
end.
