with Ada.Text_IO; use Ada.Text_IO;

procedure Decimal_To_Hex is
   Digits_Table : constant String := "0123456789ABCDEF";

   function To_Hex (N : Natural) return String is
      Value  : Natural := N;
      Result : String (1 .. 8);
      Pos    : Natural := Result'Last + 1;
   begin
      if N = 0 then
         return "0";
      end if;
      while Value > 0 loop
         Pos := Pos - 1;
         Result (Pos) := Digits_Table (Value mod 16 + 1);
         Value := Value / 16;
      end loop;
      return Result (Pos .. Result'Last);
   end To_Hex;
begin
   Put_Line ("255 = 0x" & To_Hex (255));
   Put_Line ("4096 = 0x" & To_Hex (4096));
   Put_Line ("0 = 0x" & To_Hex (0));
end Decimal_To_Hex;
