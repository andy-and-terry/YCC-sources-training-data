with Ada.Text_IO; use Ada.Text_IO;

procedure Ugly_Numbers_Merge is
   N   : constant := 12;
   Seq : array (1 .. N) of Long_Long_Integer;
   I2, I3, I5 : Positive := 1;
   C2, C3, C5, Next : Long_Long_Integer;
begin
   Seq (1) := 1;
   for K in 2 .. N loop
      C2 := Seq (I2) * 2;
      C3 := Seq (I3) * 3;
      C5 := Seq (I5) * 5;
      Next := Long_Long_Integer'Min (C2, Long_Long_Integer'Min (C3, C5));
      Seq (K) := Next;
      if Next = C2 then I2 := I2 + 1; end if;
      if Next = C3 then I3 := I3 + 1; end if;
      if Next = C5 then I5 := I5 + 1; end if;
   end loop;
   for V of Seq loop
      Put (Long_Long_Integer'Image (V));
   end loop;
   New_Line;
end Ugly_Numbers_Merge;
