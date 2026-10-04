with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Rotate is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Rotate_Left (A : in out Int_Array; K : Natural) is
      Copy : constant Int_Array := A;
      N    : constant Natural := A'Length;
   begin
      for I in A'Range loop
         A (I) := Copy (A'First + (I - A'First + K) mod N);
      end loop;
   end Rotate_Left;

   Data : Int_Array := (1, 2, 3, 4, 5);
begin
   Rotate_Left (Data, 2);
   for X of Data loop
      Put (Integer'Image (X));
   end loop;
   New_Line;
end Array_Rotate;
