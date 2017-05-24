program Network_Saboteur;

{$APPTYPE CONSOLE}

var
  I, J, N, MaxCount, MaxTraffic: Longint;
  NodesTraffic: array of array of Longint;
  NodesMap: array of Boolean;

function Traffic: Longint;
var
  I, J: Longint;
begin
  Result := 0;
  for I := 0 to N - 1 do
    if NodesMap[I] then
      for J := 0 to N - 1 do
        if not NodesMap[J] then
          Inc(Result, NodesTraffic[I, J]);
end;

procedure Generation(const Curr, Count: Longint);
var
  I, CurrTraffic: Longint;
begin
  for I := Curr to N do begin
    NodesMap[I - 1] := True;
    CurrTraffic := Traffic;
    if CurrTraffic > MaxTraffic then
      MaxTraffic := CurrTraffic;
    if Count < MaxCount then
      Generation(I + 1, Count + 1);
    NodesMap[I - 1] := False;
  end;
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  Readln(N);
  SetLength(NodesTraffic, N, N);
  SetLength(NodesMap, N);
  for I := 0 to N - 1 do begin
    NodesMap[I] := False;
    for J := 0 to N - 1 do
      Read(NodesTraffic[I, J]);
  end;
  MaxCount := N div 2;
  MaxTraffic := 0;
  Generation(1, 1);
  Write(MaxTraffic);
  Close(Input);
  Close(Output);
end.
