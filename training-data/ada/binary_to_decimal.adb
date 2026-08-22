with Ada.Text_IO; use Ada.Text_IO;

procedure Binary_To_Decimal is
   function To_Decimal (Bin : String) return Natural is
      Result : Natural := 0;
   begin
      for Ch of Bin loop
         Result := Result * 2 + (Character'Pos (Ch) - Character'Pos ('0'));
      end loop;
      return Result;
   end To_Decimal;
begin
   Put_Line (To_Decimal ("1010")'Image);
   Put_Line (To_Decimal ("11111111")'Image);
end Binary_To_Decimal;
