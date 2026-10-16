program ArrayOfRecordsSearchDemo;

type
  TItem = record
    Name: string[20];
    Price: Double;
    Qty: Integer;
  end;

var
  stock: array[1..4] of TItem;

function FindByName(const name: string): Integer;
var
  i: Integer;
begin
  for i := 1 to 4 do
    if stock[i].Name = name then
      Exit(i);
  Result := 0;
end;

var
  i: Integer;
  total: Double;
begin
  stock[1].Name := 'bolt';   stock[1].Price := 0.25; stock[1].Qty := 400;
  stock[2].Name := 'nut';    stock[2].Price := 0.10; stock[2].Qty := 900;
  stock[3].Name := 'washer'; stock[3].Price := 0.05; stock[3].Qty := 1200;
  stock[4].Name := 'gear';   stock[4].Price := 7.50; stock[4].Qty := 12;

  WriteLn('nut at index ', FindByName('nut'));
  WriteLn('cog at index ', FindByName('cog'));

  total := 0;
  for i := 1 to 4 do
    total := total + stock[i].Price * stock[i].Qty;
  WriteLn('inventory value: ', total:0:2);
end.
