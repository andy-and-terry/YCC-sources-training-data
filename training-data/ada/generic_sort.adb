with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Sort is
   -- A generic insertion sort, parameterized over the element type and
   -- the comparison used to order elements. The default for "<" picks
   -- up the predefined operator when one is visible for Element_Type.
   generic
      type Element_Type is private;
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
   package Generic_Sort_Pkg is
      type Element_Array is array (Positive range <>) of Element_Type;
      procedure Insertion_Sort (A : in out Element_Array);
   end Generic_Sort_Pkg;

   package body Generic_Sort_Pkg is
      procedure Insertion_Sort (A : in out Element_Array) is
         Key : Element_Type;
         J   : Integer;
      begin
         for I in A'First + 1 .. A'Last loop
            Key := A (I);
            J := I - 1;
            while J >= A'First and then Key < A (J) loop
               A (J + 1) := A (J);
               J := J - 1;
            end loop;
            A (J + 1) := Key;
         end loop;
      end Insertion_Sort;
   end Generic_Sort_Pkg;

   package Int_Sort is new Generic_Sort_Pkg (Integer);

   function Descending (Left, Right : Float) return Boolean is (Left > Right);
   package Float_Sort_Desc is new Generic_Sort_Pkg (Float, Descending);

   Ints   : Int_Sort.Element_Array := (5, 3, 8, 1, 9, 2);
   Floats : Float_Sort_Desc.Element_Array := (3.5, 1.2, 9.9, 0.5, 4.4);
begin
   Int_Sort.Insertion_Sort (Ints);
   for V of Ints loop
      Put (V'Image);
   end loop;
   New_Line;

   Float_Sort_Desc.Insertion_Sort (Floats);
   for V of Floats loop
      Put (V'Image);
   end loop;
   New_Line;
end Generic_Sort;
