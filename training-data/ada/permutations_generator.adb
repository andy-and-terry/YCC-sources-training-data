with Ada.Text_IO; use Ada.Text_IO;

procedure Permutations_Generator is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Print (A : Int_Array) is
   begin
      for V of A loop
         Put (V'Image);
      end loop;
      New_Line;
   end Print;

   procedure Permute (A : in out Int_Array; K : Positive) is
      Temp : Integer;
   begin
      if K > A'Last then
         Print (A);
         return;
      end if;
      for I in K .. A'Last loop
         Temp := A (K);
         A (K) := A (I);
         A (I) := Temp;

         Permute (A, K + 1);

         Temp := A (K);
         A (K) := A (I);
         A (I) := Temp;
      end loop;
   end Permute;

   Values : Int_Array := (1, 2, 3);
begin
   Permute (Values, Values'First);
end Permutations_Generator;
