program Floyd_Warshall;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

const
  WeightLimit = 100 * 1000 + 1;

var
  I, J, K, N, M, U, V, W: Longint;
  Edges: array of array of Longint;
begin
  try
    AssignFile(Input, 'Input.txt');
    AssignFile(Output, 'Output.txt');
    Reset(Input);
    Rewrite(Output);
    Read(N, M);
    SetLength(Edges, N + 1, N + 1);
  
    for I := 1 to N do
      for J := 1 to N do
        if I = J then
          Edges[I, J] := 0
        else
          Edges[I, J] := WeightLimit;
  
    for I := 1 to M do begin
      Read(U, V, W);
      Edges[U, V] := W;
    end;
  
    for K := 1 to N do
      for I := 1 to N do
        for J := 1 to N do
          if (Edges[I, K] < WeightLimit) and (Edges[K, J] < WeightLimit) then
            Edges[I, J] := Min(Edges[I, J], Edges[I, K] + Edges[K, J]);
  
    for I := 1 to N do begin
      for J := 1 to N do
        if (Edges[I, J] = WeightLimit) then
          Write('  ')
        else
          Write(Edges[I, J], ' ');
      Writeln;
    end;
  
    CloseFile(Input);
    CloseFile(Output);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
