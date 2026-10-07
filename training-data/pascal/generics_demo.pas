{$mode objfpc}{$H+}
program GenericsDemo;

{ Free Pascal's `generic`/`specialize` keywords give a real, type-checked
  generic container, unlike the fixed-Integer array records used by the
  older generic_stack.pas/generic_queue.pas samples in this folder. }

type
  generic TBox<T> = class
  private
    FValue: T;
  public
    constructor Create(value: T);
    function Get: T;
    procedure SetValue(value: T);
  end;

constructor TBox.Create(value: T);
begin
  FValue := value;
end;

function TBox.Get: T;
begin
  Get := FValue;
end;

procedure TBox.SetValue(value: T);
begin
  FValue := value;
end;

type
  TIntBox = specialize TBox<Integer>;
  TStringBox = specialize TBox<string>;

var
  intBox: TIntBox;
  strBox: TStringBox;

begin
  intBox := TIntBox.Create(42);
  strBox := TStringBox.Create('hello');
  WriteLn(intBox.Get);
  WriteLn(strBox.Get);
  intBox.SetValue(100);
  WriteLn(intBox.Get);
end.
