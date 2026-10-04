with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Access_Type_Dealloc_Demo is
   type Int_Array is array (Positive range <>) of Integer;
   type Int_Array_Access is access Int_Array;
   type Int_Access is access Integer;

   procedure Free_Array is new Ada.Unchecked_Deallocation (Int_Array, Int_Array_Access);
   procedure Free_Int   is new Ada.Unchecked_Deallocation (Integer, Int_Access);

   P   : Int_Access := new Integer'(42);
   Arr : Int_Array_Access := new Int_Array (1 .. 5);
   Sum : Integer := 0;
begin
   P.all := P.all + 1;
   Put_Line ("P.all =" & P.all'Image);

   for I in Arr'Range loop
      Arr (I) := I * I;
      Sum := Sum + Arr (I);
   end loop;
   Put_Line ("Sum of squares =" & Sum'Image);
   Put_Line ("Last index    =" & Arr'Last'Image);

   Free_Int (P);
   Free_Array (Arr);
   Put_Line ("P is null: " & Boolean'Image (P = null));
   Put_Line ("Arr is null: " & Boolean'Image (Arr = null));
end Access_Type_Dealloc_Demo;
