with Ada.Text_IO; use Ada.Text_IO;
procedure Varint_Encode is
   N : Natural := 300;
begin
   while N >= 128 loop
      Put (Natural'Image ((N mod 128) + 128));
      N := N / 128;
   end loop;
   Put_Line (Natural'Image (N));
end Varint_Encode;
