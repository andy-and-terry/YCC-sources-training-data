with Ada.Text_IO; use Ada.Text_IO;

procedure Aspect_Inline_Preelaborate is
   function Square (X : Integer) return Integer is (X * X)
     with Inline;

   function Cube (X : Integer) return Integer
     with Pre  => abs X < 1000,
          Post => Cube'Result = X * X * X
   is
   begin
      return X * Square (X);
   end Cube;
begin
   Put_Line (Square (12)'Image);
   Put_Line (Cube (-4)'Image);
end Aspect_Inline_Preelaborate;
