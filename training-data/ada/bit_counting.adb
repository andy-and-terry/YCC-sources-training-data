with Ada.Text_IO; use Ada.Text_IO;

procedure Bit_Counting is
   function Count_Set_Bits (N : Natural) return Natural is
      M : Natural := N;
      Count : Natural := 0;
   begin
      while M > 0 loop
         Count := Count + (M mod 2);
         M := M / 2;
      end loop;
      return Count;
   end Count_Set_Bits;
begin
   Put_Line (Count_Set_Bits (13)'Image);
   Put_Line (Count_Set_Bits (255)'Image);
end Bit_Counting;
