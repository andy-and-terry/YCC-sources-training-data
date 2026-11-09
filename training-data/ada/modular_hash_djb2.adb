with Ada.Text_IO; use Ada.Text_IO;
procedure Modular_Hash_Djb2 is
   type U32 is mod 2 ** 32;
   function Hash (S : String) return U32 is
      H : U32 := 5381;
   begin
      for C of S loop
         H := H * 33 + U32 (Character'Pos (C));
      end loop;
      return H;
   end Hash;
begin
   Put_Line (U32'Image (Hash ("hello")));
end Modular_Hash_Djb2;
