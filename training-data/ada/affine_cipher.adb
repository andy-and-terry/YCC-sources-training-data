with Ada.Text_IO; use Ada.Text_IO;

procedure Affine_Cipher is
   A : constant := 5;
   B : constant := 8;
   Msg : constant String := "AFFINE";
   Result : String (Msg'Range);
begin
   for I in Msg'Range loop
      Result (I) := Character'Val (((A * (Character'Pos (Msg (I)) - 65) + B) mod 26) + 65);
   end loop;
   Put_Line (Result);
end Affine_Cipher;
