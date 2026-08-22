with Ada.Text_IO; use Ada.Text_IO;

procedure Merge_Sort is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Merge (Arr : in out Int_Array; Low, Mid, High : Integer) is
      Left : Int_Array (Low .. Mid) := Arr (Low .. Mid);
      Right : Int_Array (Mid + 1 .. High) := Arr (Mid + 1 .. High);
      I, J, K : Integer;
   begin
      I := Left'First;
      J := Right'First;
      K := Low;
      while I <= Left'Last and then J <= Right'Last loop
         if Left (I) <= Right (J) then
            Arr (K) := Left (I);
            I := I + 1;
         else
            Arr (K) := Right (J);
            J := J + 1;
         end if;
         K := K + 1;
      end loop;
      while I <= Left'Last loop
         Arr (K) := Left (I);
         I := I + 1;
         K := K + 1;
      end loop;
      while J <= Right'Last loop
         Arr (K) := Right (J);
         J := J + 1;
         K := K + 1;
      end loop;
   end Merge;

   procedure Sort (Arr : in out Int_Array; Low, High : Integer) is
      Mid : Integer;
   begin
      if Low < High then
         Mid := (Low + High) / 2;
         Sort (Arr, Low, Mid);
         Sort (Arr, Mid + 1, High);
         Merge (Arr, Low, Mid, High);
      end if;
   end Sort;

   Data : Int_Array := (5, 3, 8, 1, 9, 2);
begin
   Sort (Data, Data'First, Data'Last);
   for V of Data loop
      Put (V'Image);
   end loop;
   New_Line;
end Merge_Sort;
