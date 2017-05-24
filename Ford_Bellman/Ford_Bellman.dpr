program Ford_Bellman;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

const
  WeightLimit = 100 * 1000 + 1;

type
  TEdge = record
    U, V, Weight: Longint;
  end;

var
  I, J, N, M, S: Longint;
  Edges: array of TEdge;
  Result: array of Longint;

begin
  try
    AssignFile(Input, 'Input.txt');
    AssignFile(Output, 'Output.txt');
    Reset(Input);
    Rewrite(Output);
    Read(N, M, S);
    SetLength(Edges, M + 1);
    SetLength(Result, N + 1);

    for I := 1 to N do
      Result[I] := WeightLimit;
    Result[S] := 0;

    for I := 1 to M do
      Read(Edges[I].U, Edges[I].V, Edges[I].Weight);
  
    for I := 1 to N do
      for J := 1 to M do
        if Result[Edges[J].U] < WeightLimit then
          Result[Edges[J].V] := Min(Result[Edges[J].V],
            Result[Edges[J].U] + Edges[J].Weight);

    for I := 1 to N do
      if Result[I] < WeightLimit then
        Write(Result[I], ' ');

    CloseFile(Input);
    CloseFile(Output);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
