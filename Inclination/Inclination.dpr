program Inclination;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Segm = record
    Len: Longint;
    Tp: Char;
  end;
  TSegmArr = object
    Arr: array[1..1010] of Segm;
    Len: Longint;
    procedure New;
    procedure Add(AddLen: Integer; Ch: Char);
  end;
var
  N, I, J, OldLen: Longint;
  Str: String;
  Fence, Fence2: TSegmArr;
  Ch: Char;

procedure TSegmArr.Add(AddLen: Integer; Ch: Char);
begin
  if (Len = 0) or (Arr[Len].Tp <> Ch) then
    Self.New;
  Inc(Arr[Len].Len, AddLen);
  Arr[Len].Tp := Ch;
end;

procedure TSegmArr.New;
begin
  Inc(Len);
  Arr[Len].Len := 0;
end;

begin

  AssignFile(Input, 'Input.txt');
  AssignFile(Output, 'Output.txt');
  Reset(Input);
  ReWrite(Output);

  Readln(Str);

  Fence.Len := 1;
  Fence.Arr[1].Len := 1;
  Fence.Arr[1].Tp := Str[1];
  for I := 2 to Length(Str) do begin
    if Str[I] = Fence.Arr[Fence.Len].Tp then begin
      Inc(Fence.Arr[Fence.Len].Len);
    end else begin
      Inc(Fence.Len);
      Fence.Arr[Fence.Len].Len := 1;
      Fence.Arr[Fence.Len].Tp := Str[I];
    end;
  end;

  OldLen := Fence.Len;
  Fence2.Len := 0;
  while OldLen <> Fence2.Len do begin

    I := 1;
    Fence2.Len := 0;

    if Fence.Arr[1].Tp = '\' then begin
      Fence2.New;
      Fence2.Arr[Fence2.Len] := Fence.Arr[1];
      I := 2;
    end;

    while I < Fence.Len do begin

      if Fence.Arr[I].Len = Fence.Arr[I + 1].Len then begin

        Fence2.Add(Fence.Arr[I].Len, Fence.Arr[I].Tp);
        Fence2.Add(Fence.Arr[I].Len, Fence.Arr[I + 1].Tp);

      end else begin

        if Fence.Arr[I].Len > Fence.Arr[I + 1].Len then
          Ch := Fence.Arr[I].Tp
        else
          Ch := Fence.Arr[I + 1].Tp;

        Fence2.Add(Fence.Arr[I].Len + Fence.Arr[I + 1].Len, Ch);
      end;
      Inc(I, 2);
    end;

    if I = Fence.Len then begin
      Fence2.Add(Fence.Arr[Fence.Len].Len, Fence.Arr[Fence.Len].Tp);
    end;

    OldLen := Fence.Len;
    Fence := Fence2;

  end;

  for I := 1 to Fence.Len do begin
    for J := 1 to Fence.Arr[I].Len do
      Write(Fence.Arr[I].Tp);
  end;


  Close(Input);
  Close(Output);

end.
