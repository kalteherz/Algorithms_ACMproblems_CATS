program BFS;

{$APPTYPE CONSOLE}

var
  I, N, S, QueueStart, QueueSize: Longint;
  Vertex: array of array of Longint;
  UsedVertex: array of Boolean;
  Queue: array of Longint;

procedure AddEdge(const U, V: Longint);
begin
  SetLength(Vertex[U - 1], High(Vertex[U - 1]) + 2);
  Vertex[U - 1, High(Vertex[U - 1])] := V;
end;

procedure Initialize;
var
  I, M, U, V: Longint;
begin
  Assign(Input, 'Input.txt');
  Reset(Input);
  Read(N, M, S);
  SetLength(Vertex, N);
  for I := 1 to M do begin
    Read(U, V);
    AddEdge(U, V);
    AddEdge(V, U);
  end;
  Close(Input);
  SetLength(UsedVertex, N);
  SetLength(Queue, N);
  for I := 0 to N - 1 do begin
    UsedVertex[I] := False;
  end;
  UsedVertex[S - 1] := True;
  QueueStart := 0;
  QueueSize := 1;
  Queue[QueueStart] := S;
end;

begin
  Initialize;
  while QueueSize > 0 do begin
    for I := 0 to High(Vertex[S - 1]) do
      if not UsedVertex[Vertex[S - 1, I] - 1] then begin
        Queue[QueueStart + QueueSize] := Vertex[S - 1, I];
        Inc(QueueSize); 
        UsedVertex[Vertex[S - 1, I] - 1] := True;
      end;
    Inc(QueueStart);         
    Dec(QueueSize);
    S := Queue[QueueStart];
  end;
  Assign(Output, 'Output.txt');
  Rewrite(Output);
  if QueueStart = N then
    for I := 0 to N - 1 do
      Write(Queue[I], ' ')
  else
    Write('-1');
  Close(Output);
end.
