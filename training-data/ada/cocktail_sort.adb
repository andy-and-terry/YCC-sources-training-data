with Ada.Text_IO; use Ada.Text_IO;

procedure Cocktail_Sort is
   type Int_Array is array (Positive range <>) of Integer;

   -- Cocktail shaker sort: like bubble sort, but alternates sweeping
   -- forward and backward each pass, so both large and small
   -- out-of-place elements move toward their final position quickly.
   procedure Sort (A : in out Int_Array) is
      Low     : Integer := A'First;
      High    : Integer := A'Last;
      Swapped : Boolean;
      Temp    : Integer;
   begin
      loop
         Swapped := False;
         for I in Low .. High - 1 loop
            if A (I) > A (I + 1) then
               Temp := A (I);
               A (I) := A (I + 1);
               A (I + 1) := Temp;
               Swapped := True;
            end if;
         end loop;
         exit when not Swapped;
         High := High - 1;

         Swapped := False;
         for I in reverse Low .. High - 1 loop
            if A (I) > A (I + 1) then
               Temp := A (I);
               A (I) := A (I + 1);
               A (I + 1) := Temp;
               Swapped := True;
            end if;
         end loop;
         exit when not Swapped;
         Low := Low + 1;
      end loop;
   end Sort;

   Data : Int_Array := (5, 1, 4, 2, 8, 0, 2, -3);
begin
   Sort (Data);
   for V of Data loop
      Put (V'Image);
   end loop;
   New_Line;
end Cocktail_Sort;
