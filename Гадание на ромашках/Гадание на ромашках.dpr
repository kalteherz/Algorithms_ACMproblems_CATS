program GadaniyeNaRomashkah;

{$APPTYPE CONSOLE}

uses
  SysUtils, Math;

var
  I, J, N: Longint;
  Res, Love, UnLove: Int64;

function Combination(N, K: Int64): Int64;
var
  eResult, A, B: Extended;
  I: Longint;
  NK, Split: Int64;
begin

  if K > N then begin
    Result := 0;
    Exit;
  end;

  eResult := 1;

  NK := N - K;

  Split := Min(K, NK);

  for I := 1 to Split do begin
    A := N - Split + I;
    B := I;
    eResult := eResult / B * A;
  end;

  Result := Round(eResult);

end;

begin
  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  Rewrite(Output);

  Read(N);

  for I := 1 to N do begin
    Read(J);
    if (J mod 2) = 1 then
      Inc(Love);
  end;

  UnLove := N - Love;

  Res := 0;

  for I := 1 to N do begin
    for J := Max(I div 2 + 1, I - UnLove) to I do begin
      Res := Res + Combination(Love, J) * Combination(UnLove, I - J);
    end;
  end;

  Write(Res);

  CloseFile(Input);
  CloseFile(Output);
end.
