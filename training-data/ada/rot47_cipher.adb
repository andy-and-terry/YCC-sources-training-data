with Ada.Text_IO; use Ada.Text_IO;
procedure Rot47_Cipher is
   function Rot (S : String) return String is
      R : String := S;
   begin
      for I in R'Range loop
         if Character'Pos (R (I)) in 33 .. 126 then
            R (I) := Character'Val (33 + (Character'Pos (R (I)) - 33 + 47) mod 94);
         end if;
      end loop;
      return R;
   end Rot;
   E : constant String := Rot ("Hello, World!");
begin
   Put_Line (E);
   Put_Line (Rot (E));
end Rot47_Cipher;
