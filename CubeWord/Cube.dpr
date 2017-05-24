program Cube;

{$APPTYPE CONSOLE}

const
  CubeSize = 6;

var
  UsedCube: array of Boolean;
  Cubes: array of String[CubeSize];
  SearchResult : array of Longint;
  Str: String;
  I, N, K: Longint;

function Search(Curr: Longint): Boolean;
var
  I, J: Longint;
begin
  Result := True;
  if Curr > K then
    Exit;
  for I := 0 to N - 1 do begin
    if UsedCube[I] then
      Continue;
    for J := 1 to CubeSize do begin
      if Str[Curr] = Cubes[I, J] then begin
        UsedCube[I] := True;
        SearchResult[Curr - 1] := I + 1;
        if Search(Curr + 1) then
          Exit;
        UsedCube[I] := False;
        Break;
      end;
    end;
  end;
  Result := False;
end;

procedure WriteResult(OK: Boolean);
var
  I: Longint;
begin
  if OK then begin
    for I := 0 to K - 1 do
      Write(SearchResult[I], ' ');
  end else
    Write(0);
  Close(Input);
  Close(Output);
  Halt;
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  Readln(N);
  Readln(Str);
  K := Length(Str);
  if N < K then
    WriteResult(False);  
  SetLength(SearchResult, K);
  SetLength(Cubes, N);
  SetLength(UsedCube, N);
  for I := 0 to N - 1 do begin
    Readln(Cubes[I]);
    UsedCube[I] := False;
  end;
  WriteResult(Search(1));
end.
