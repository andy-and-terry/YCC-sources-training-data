program IntegerRangeTypesDemo;

begin
  WriteLn('ShortInt: ', Low(ShortInt), '..', High(ShortInt));
  WriteLn('Byte: ', Low(Byte), '..', High(Byte));
  WriteLn('SmallInt: ', Low(SmallInt), '..', High(SmallInt));
  WriteLn('Word: ', Low(Word), '..', High(Word));
  WriteLn('LongInt: ', Low(LongInt), '..', High(LongInt));
  WriteLn('Cardinal: ', Low(Cardinal), '..', High(Cardinal));
  WriteLn('Int64: ', Low(Int64), '..', High(Int64));
  WriteLn('SizeOf(Integer): ', SizeOf(Integer));
  WriteLn('SizeOf(Int64): ', SizeOf(Int64));
  WriteLn('SizeOf(Double): ', SizeOf(Double));
  WriteLn('SizeOf(Char): ', SizeOf(Char));
end.
