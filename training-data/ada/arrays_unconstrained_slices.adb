with Ada.Text_IO; use Ada.Text_IO;

procedure Arrays_Unconstrained_Slices is
   type Int_Array is array (Positive range <>) of Integer;
   type Matrix is array (1 .. 3, 1 .. 3) of Integer;

   function Sum (A : Int_Array) return Integer is
      S : Integer := 0;
   begin
      for X of A loop S := S + X; end loop;
      return S;
   end Sum;

   A : Int_Array (1 .. 8) := (1, 2, 3, 4, 5, 6, 7, 8);
   M : Matrix := (others => (others => 0));
begin
   Put_Line (Integer'Image (Sum (A)) & Integer'Image (Sum (A (3 .. 5))) & Integer'Image (A'Length));
   A (1 .. 4) := A (5 .. 8);
   for X of A loop Put (Integer'Image (X)); end loop;
   New_Line;
   for I in M'Range (1) loop M (I, I) := I; end loop;
   Put_Line (Integer'Image (M (2, 2) + M (3, 3)) & Integer'Image (M'Length (2)));
   Put_Line (Boolean'Image (A = A) & Boolean'Image (A (1 .. 2) < A (3 .. 4)));
   declare B : constant Int_Array := A & (9, 10); begin Put_Line (Integer'Image (B'Last)); end;
end Arrays_Unconstrained_Slices;
