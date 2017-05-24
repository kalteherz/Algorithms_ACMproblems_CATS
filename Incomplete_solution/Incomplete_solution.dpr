program Incomplete_solution;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TIntermediateResult = record
    Last: array[1..1000] of Longint;
    Op: array[1..1000] of Char;
  end;

var
  I, J, K, N, R, TmpResult: Longint;
  A: array[1..1001] of Longint;
  IntermediateResult: array[-1000..1000] of TIntermediateResult;
  OperatorList: array[1..4] of Char = ('+', '-', '*', '/');
  Ch: Char;
  NumStr, ResultStr: AnsiString;
  
function Calc(const A, B: Longint; const OpType: Char): Longint;
begin
  case OpType of
    '+': Result := A + B;
    '-': Result := A - B;
    '*': Result := A * B;
    '/': Result := A div B;
  end;
end;

procedure AddValue;
begin
  Inc(N);
  A[N] := StrToInt(NumStr);
  NumStr := '';
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);

  N := 0;
  NumStr := '';
  while not Eof(Input) do begin
    Read(Ch);
    if (Ch in ['-', '+', '0'..'9']) then
      NumStr := NumStr + Ch
    else if NumStr <> '' then
      AddValue;
  end;
  if NumStr <> '' then
    AddValue;

  R := A[N];
  Dec(N);

  IntermediateResult[A[1]].Op[1] := '=';

  for I := 2 to N do
    for J := -1000 to 1000 do
      if IntermediateResult[J].Op[I - 1] <> #0 then
        for K := 1 to 4 do begin
          if (A[I] = 0) and (OperatorList[K] = '/') then
            Continue;
          TmpResult := Calc(J, A[I], OperatorList[K]);
          if (Abs(TmpResult) <= 1000) and (IntermediateResult[TmpResult].Op[I] = #0) then begin
            IntermediateResult[TmpResult].Op[I] := OperatorList[K];
            IntermediateResult[TmpResult].Last[I] := J;
          end;
        end;

  if IntermediateResult[R].Op[N] <> #0 then begin
    ResultStr := '';
    J := R;
    for I := N downto 2 do begin
      ResultStr := IntermediateResult[J].Op[I] + ResultStr;
      J := IntermediateResult[J].Last[I];
    end;
    Write(ResultStr);
  end else
    Write('IMPOSSIBLE');    
  Close(Input);
  Close(Output);
end.
