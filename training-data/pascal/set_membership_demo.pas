program SetMembershipDemo;

type
  TDay = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
  TDays = set of TDay;

var
  weekend, workdays, busy: TDays;
  d: TDay;
begin
  weekend := [Sat, Sun];
  workdays := [Mon..Fri];
  busy := [Tue, Thu, Sat];

  if Sat in weekend then WriteLn('Sat is weekend');
  if not (Sat in workdays) then WriteLn('Sat is not a workday');

  WriteLn('busy workdays:');
  for d := Mon to Sun do
    if d in (busy * workdays) then
      WriteLn(Ord(d));

  Include(busy, Mon);
  Exclude(busy, Tue);
  WriteLn(Mon in busy, ' ', Tue in busy);
end.
