program ClassInheritanceVirtualX2;
type
  TBase = class
    procedure Say; virtual;
  end;
  TDerived = class(TBase)
    procedure Say; override;
  end;
procedure TBase.Say; begin writeln('base'); end;
procedure TDerived.Say; begin writeln('derived'); end;
var o: TBase;
begin
  o := TDerived.Create;
  o.Say;
  o.Free;
end.
