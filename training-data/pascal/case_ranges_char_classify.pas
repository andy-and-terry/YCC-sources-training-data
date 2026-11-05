program CaseRangesCharClassify;
var C: Char;
begin
  for C in 'a7Z!' do
    case C of
      'a'..'z': WriteLn(C, ' lower');
      'A'..'Z': WriteLn(C, ' upper');
      '0'..'9': WriteLn(C, ' digit');
    else
      WriteLn(C, ' other');
    end;
end.
