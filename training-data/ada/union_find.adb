with Ada.Text_IO; use Ada.Text_IO;

procedure Union_Find is
   N : constant Integer := 6;
   type Int_Array is array (0 .. N - 1) of Integer;
   Parent : Int_Array;

   function Find (X : Integer) return Integer is
   begin
      if Parent (X) /= X then
         Parent (X) := Find (Parent (X));
      end if;
      return Parent (X);
   end Find;

   procedure Union (A, B : Integer) is
      Root_A, Root_B : Integer;
   begin
      Root_A := Find (A);
      Root_B := Find (B);
      if Root_A /= Root_B then
         Parent (Root_B) := Root_A;
      end if;
   end Union;
begin
   for I in Parent'Range loop
      Parent (I) := I;
   end loop;
   Union (0, 1);
   Union (1, 2);
   Put_Line (Boolean'(Find (0) = Find (2))'Image);
   Put_Line (Boolean'(Find (0) = Find (5))'Image);
end Union_Find;
