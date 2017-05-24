program KMP;

{$APPTYPE CONSOLE}

var
  Str1, Str2: AnsiString;

procedure Prefix(const Str: AnsiString; var Pi: array of Longint);
var
  I, K: Longint;
begin
  Pi[0] := 0;
  K:= 0;
  for I := 2 to Length(Str) do begin
    while (K > 0) and (Str[K + 1] <> Str[I]) do
      K := Pi[K - 1];
    if Str[K + 1] = Str[I] then
      Inc(K);
    Pi[I - 1] := K;
  end;
end;

function KMPSearch(Str, SubStr: AnsiString): Longint;
var
  Pi: array of Longint;
  SubLen, I, K: Longint;
begin
  Result := -1;
  SubLen := Length(SubStr);
  SetLength(Pi, SubLen);
  Prefix(SubStr, Pi);
  K := 0;
  for I := 1 to Length(Str) do begin
    while (K > 0) and (SubStr[K + 1] <> Str[I]) do
      K := Pi[K - 1];
    if SubStr[K + 1] = Str[I] then
      Inc(K);
    if K = SubLen then begin
      Result := I - SubLen + 1;
      Exit;
    end;
  end;
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  Readln(Str1);
  Readln(Str2);
  Write(KMPSearch(Str1, Str2));
  Close(Input);
  Close(Output);
end.
