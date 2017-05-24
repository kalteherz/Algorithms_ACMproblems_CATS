program Answers;

{$APPTYPE CONSOLE}

var
  I, P, Q: Longint;
  ShushAnswer: array of String;
  ShushResult: array of Longint;
  SearchResult: String;

function GoodTest: Boolean;
var
  I, J, Sum: Longint;
begin
  Result := True;
  for I := 0 to P - 1 do begin
    Sum := 0;
    for J := 1 to Q do
      if SearchResult[J] = ShushAnswer[I, J] then
        Inc(Sum);
    if Sum <> ShushResult[I] then begin
      Result := False;
      Exit;
    end;
  end;
end;

function Search(const Curr: Longint): Boolean;
var
  I: Longint;
begin
  for I := 1 to 2 do begin
    if Curr < Q then
      Result := Search(Curr + 1)
    else
      Result := GoodTest;
    if Result then
      Exit;
    SearchResult[Curr] := '+';
  end;
  SearchResult[Curr] := '-';
  Result := False;
end;

begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  Readln(P, Q);
  SetLength(ShushAnswer, P);
  SetLength(ShushResult, P);
  for I := 1 to Q do
    SearchResult := SearchResult + '-';    
  for I := 0 to P - 1 do begin
    Readln(ShushAnswer[I]);
    Readln(ShushResult[I]);
  end;
  Search(1);
  Write(SearchResult);
  Close(Input);
  Close(Output);
end.
