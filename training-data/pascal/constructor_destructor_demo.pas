program ConstructorDestructorDemo;

type
  TResource = class
  private
    FName: string;
  public
    constructor Create(const AName: string);
    destructor Destroy; override;
    property Name: string read FName;
  end;

constructor TResource.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
  WriteLn('acquired ', FName);
end;

destructor TResource.Destroy;
begin
  WriteLn('released ', FName);
  inherited Destroy;
end;

var
  r: TResource;
begin
  r := TResource.Create('db-connection');
  try
    WriteLn('using ', r.Name);
  finally
    r.Free;
  end;
end.
