with Ada.Text_IO; use Ada.Text_IO;

procedure Power_Set is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Print_Subsets (A : Int_Array) is
      N          : constant Natural := A'Length;
      Subset_Cnt : constant Natural := 2 ** N;
   begin
      for Mask in 0 .. Subset_Cnt - 1 loop
         Put ("{");
         for I in 0 .. N - 1 loop
            if (Mask / (2 ** I)) mod 2 = 1 then
               Put (A (A'First + I)'Image);
            end if;
         end loop;
         Put (" }");
         New_Line;
      end loop;
   end Print_Subsets;

   Values : constant Int_Array := (1, 2, 3);
begin
   Print_Subsets (Values);
end Power_Set;
