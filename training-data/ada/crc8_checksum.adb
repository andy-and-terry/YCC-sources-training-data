with Ada.Text_IO; use Ada.Text_IO;
with Interfaces; use Interfaces;
procedure Crc8_Checksum is
   function Crc8 (S : String) return Unsigned_8 is
      Crc : Unsigned_8 := 0;
   begin
      for C of S loop
         Crc := Crc xor Unsigned_8 (Character'Pos (C));
         for K in 1 .. 8 loop
            if (Crc and 16#80#) /= 0 then
               Crc := Shift_Left (Crc, 1) xor 16#07#;
            else
               Crc := Shift_Left (Crc, 1);
            end if;
         end loop;
      end loop;
      return Crc;
   end Crc8;
begin
   Put_Line (Unsigned_8'Image (Crc8 ("123456789")));
end Crc8_Checksum;
