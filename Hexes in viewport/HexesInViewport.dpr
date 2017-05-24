program HexesInViewport;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  I, J, N, X, Y, W, H, StartX, StartY, CurrX, CurrY: Integer;
  Grid: Array[-500 .. 500, -500 .. 500] of Char;

procedure PutSegment(const X, Y: Integer);
var
  I: Integer;
begin
  for I := 0 to N - 1 do begin
    Grid[X + I, Y] := '_';
    Grid[X + N + I, Y - I] := '/';
    Grid[X + N + I, Y + I + 1] := '\';
  end;
end;

begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(N, X, Y, W, H);

  StartX := - (X mod (4 * N));
  StartY := - (Y mod (2 * N));

  for I := 0 to W - 1 do
    for J := 0 to H - 1 do
      Grid[I, J] := '.';

  I := 1;
  CurrY := StartY - N;
  while CurrY - N < H do begin
    CurrX := StartX - I * 2 * N;
    while CurrX - N < W do begin
      PutSegment(CurrX, CurrY);
      Inc(CurrX, 4 * N);
    end;
    Inc(CurrY, N);
    I := 1 - I;
  end;

  PutSegment(StartX, StartY);

  for J := 0 to H - 1 do begin
    for I := 0 to W - 1 do
      Write(Grid[I, J]);
    Writeln;
  end;

  CloseFile(Input);
  CloseFile(Output);
end.
