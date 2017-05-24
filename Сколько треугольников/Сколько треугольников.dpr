program GadaniyeNaRomashkah;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

var
  I, J, N, Counter: Longint;
  Res, Love, UnLove: Int64;

begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(N);

  for I := 0 to N - 1 do
    Inc(Res, (1 + N - I) * (N - I) div 2);

  for I := 1 to N div 2 do begin
    Counter := 1;
    for J := I to N - I do begin
      Inc(Res, Counter);
      Inc(Counter);
    end;
  end;

  Write(Res);

  CloseFile(Input);
  CloseFile(Output);
end.
