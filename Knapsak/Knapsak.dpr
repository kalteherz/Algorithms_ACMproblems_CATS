program Knapsak;

{$APPTYPE CONSOLE}

type
  TSum = object
    LastSum: Longint;
    NewElem: Byte;
    procedure Change(const Last, New: Longint);
  end;

var
  N, W, I, J, Pos: Longint;
  A: array of Longint;
  AllSum: array of TSum;
  Result: array of Byte;

procedure TSum.Change;
begin
  LastSum := Last;
  NewElem := New;
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  Read(N, W);
  SetLength(A, N + 1);
  SetLength(Result, N + 1);
  for I := 1 to N do begin
    Read(A[I]);
    Result[I] := 0;
  end;
  SetLength(AllSum, W + 1);
  AllSum[0].Change(0, 0);
  for I := 1 to W do
    AllSum[I].Change(0, 255);

  for I := 1 to N do
    for J := W - A[I] downto 0 do
      if (AllSum[J].NewElem <> 255) and (AllSum[J + A[I]].NewElem = 255) then
        AllSum[J + A[I]].Change(J, I);

  if AllSum[W].NewElem <> 255 then begin
    I := W;
    repeat
      Result[AllSum[I].NewElem] := 1;
      I := AllSum[I].LastSum;
    until I = 0;
    for I := 1 to N do
      Write(Result[I], ' ');
  end else
    Write('-1');

  Close(Input);
  Close(Output);
end.
