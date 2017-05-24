program Jokers;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  N: Integer;

begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(N);

  Write(1.0 - (54.0 - N) * (53.0 - N) / (54.0 * 53.0) : 0 : 6);

  CloseFile(Input);
  CloseFile(Output);
end.
