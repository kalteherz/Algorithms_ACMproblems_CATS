program Radary;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

var
  Str: String;
  I, J, A, B, DA, DB: Int64;


begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(A, B, DA, DB);

  if (A + DA = B + DB) or (A + DA = B - DB) then
    Write(A + DA)
  else
  if (A - DA = B + DB) or (A - DA = B - DB) then
    Write(A - DA)
  else
    Write('0 0');

  CloseFile(Input);
  CloseFile(Output);
end.
