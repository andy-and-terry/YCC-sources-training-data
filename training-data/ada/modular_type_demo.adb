with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Type_Demo is
   type Byte is mod 2 ** 8;
   type Hash_Value is mod 2 ** 32;

   function Djb2 (S : String) return Hash_Value is
      H : Hash_Value := 5381;
   begin
      for C of S loop
         H := H * 33 + Hash_Value (Character'Pos (C));
      end loop;
      return H;
   end Djb2;

   B : Byte := 250;
begin
   B := B + 10;  --  wraps around: 260 mod 256 = 4
   Put_Line ("Wrapped byte:" & B'Image);
   Put_Line ("Negated 1  :" & Byte'Image (-Byte'(1)));
   Put_Line ("Bitwise and:" & Byte'Image (Byte'(16#F0#) and Byte'(16#3C#)));
   Put_Line ("Bitwise xor:" & Byte'Image (Byte'(16#F0#) xor Byte'(16#3C#)));
   Put_Line ("djb2(hello):" & Djb2 ("hello")'Image);
end Modular_Type_Demo;
