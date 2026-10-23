with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Containers.Generic_Array_Sort;

procedure Generic_Array_Sort_Container is
   type Int_Array is array (Positive range <>) of Integer;

   --  Ascending sort uses the predefined "<"
   procedure Sort_Ascending is new Ada.Containers.Generic_Array_Sort
     (Index_Type   => Positive,
      Element_Type => Integer,
      Array_Type   => Int_Array);

   --  Descending sort passes a custom comparison
   function Greater (Left, Right : Integer) return Boolean is (Left > Right);

   procedure Sort_Descending is new Ada.Containers.Generic_Array_Sort
     (Index_Type   => Positive,
      Element_Type => Integer,
      Array_Type   => Int_Array,
      "<"          => Greater);

   type Name_Array is array (Positive range <>) of Character;

   procedure Sort_Chars is new Ada.Containers.Generic_Array_Sort
     (Index_Type   => Positive,
      Element_Type => Character,
      Array_Type   => Name_Array);

   procedure Show (Label : String; Data : Int_Array) is
   begin
      Put (Label & ":");
      for X of Data loop
         Put (Integer'Image (X));
      end loop;
      New_Line;
   end Show;

   Values : Int_Array := (42, 7, 19, -3, 25, 7);
   Chars  : Name_Array := ('d', 'a', 'c', 'b');
begin
   Show ("original", Values);
   Sort_Ascending (Values);
   Show ("ascending", Values);
   Sort_Descending (Values);
   Show ("descending", Values);

   Sort_Chars (Chars);
   Put ("chars: ");
   for C of Chars loop
      Put (C);
   end loop;
   New_Line;
end Generic_Array_Sort_Container;
