with Ada.Text_IO; use Ada.Text_IO;

procedure Fletcher16_Checksum is
   Data : constant String := "abcde";
   S1, S2 : Natural := 0;
begin
   for C of Data loop
      S1 := (S1 + Character'Pos (C)) mod 255;
      S2 := (S2 + S1) mod 255;
   end loop;
   Put_Line (Natural'Image (S2 * 256 + S1));  --  51440 = 16#C8F0#
end Fletcher16_Checksum;
