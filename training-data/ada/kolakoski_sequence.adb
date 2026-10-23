with Ada.Text_IO; use Ada.Text_IO;

--  Kolakoski sequence: a sequence of 1s and 2s that describes its own run lengths
procedure Kolakoski_Sequence is
   Count : constant := 20;
   Seq   : array (1 .. Count + 2) of Integer := (1, 2, 2, others => 0);
   Len   : Integer := 3;
   I     : Integer := 3;  --  index of the term giving the next run length
   Sym   : Integer;
begin
   while Len < Count loop
      Sym := (if I mod 2 = 1 then 1 else 2);
      for J in 1 .. Seq (I) loop
         Len := Len + 1;
         Seq (Len) := Sym;
      end loop;
      I := I + 1;
   end loop;
   for K in 1 .. Count loop
      Put (Integer'Image (Seq (K)));
   end loop;
   New_Line;
end Kolakoski_Sequence;
