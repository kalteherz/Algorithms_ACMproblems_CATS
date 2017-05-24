program Moneybox;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TCoin = record
    Cost, Weight: Longint;
  end;

var
  I, J, E, F, N, CoinsWeight, TmpWeight, TmpCost: Longint;
  Coins: array of TCoin;
  Costs: array of Longint;

begin
  try
    Assign(Input, 'Input.txt');
    Assign(Output, 'Output.txt');
    Reset(Input);
    Rewrite(Output);

    Read(E, F, N);
    SetLength(Coins, N + 1);
    for I := 1 to N do
      Read(Coins[I].Cost, Coins[I].Weight);

    CoinsWeight := F - E;
    SetLength(Costs, CoinsWeight + 1);
    for I := 1 to CoinsWeight do
      Costs[I] := MaxLongint;
    Costs[0] := 0;

    for I := 0 to CoinsWeight do begin
      if Costs[I] = MaxLongint then
        Continue;
      for J := 1 to N do begin
        TmpWeight := I + Coins[J].Weight;
        if TmpWeight > CoinsWeight then
          Continue;
        TmpCost := Costs[I] + Coins[J].Cost;
        if Costs[TmpWeight] > TmpCost then
          Costs[TmpWeight] := TmpCost;
      end;
    end;

    if Costs[CoinsWeight] = MaxLongint then
      Write('-1')
    else
      Write(Costs[CoinsWeight]);
    
    Close(Input);
    Close(Output);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
