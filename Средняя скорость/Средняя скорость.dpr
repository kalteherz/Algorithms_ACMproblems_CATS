program SrednyayaSkorost;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

var
  Str: String;
  I, J, N: Integer;
  V, Time, Nreal: Extended;


begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(N);

  Time := 0;

  for I := 1 to N do begin
    Read(V);
    Time := Time + 1/V;
  end;

  Nreal := N;

  Write(N / Time : 0 : 4);

  CloseFile(Input);
  CloseFile(Output);
end.
