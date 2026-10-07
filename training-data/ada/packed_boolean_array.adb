with Ada.Text_IO; use Ada.Text_IO;

procedure Packed_Boolean_Array is
   type Bit_Set is array (0 .. 31) of Boolean;
   pragma Pack (Bit_Set);

   Flags : Bit_Set := (others => False);

   function Count (B : Bit_Set) return Natural is
      N : Natural := 0;
   begin
      for Bit of B loop
         if Bit then
            N := N + 1;
         end if;
      end loop;
      return N;
   end Count;
begin
   Flags (1) := True;
   Flags (5) := True;
   Flags (31) := True;
   Put_Line ("Bits set:" & Count (Flags)'Image);
   Put_Line ("Bit_Set size in bits:" & Natural'Image (Bit_Set'Size));
   Flags := not Flags;
   Put_Line ("After complement:" & Count (Flags)'Image);
end Packed_Boolean_Array;
