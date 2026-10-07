with Ada.Text_IO; use Ada.Text_IO;

procedure Operator_Overloading_Demo is
   type Vec2 is record
      X, Y : Integer;
   end record;

   function "+" (L, R : Vec2) return Vec2 is
   begin
      return (L.X + R.X, L.Y + R.Y);
   end "+";

   function "*" (K : Integer; V : Vec2) return Vec2 is
   begin
      return (K * V.X, K * V.Y);
   end "*";

   A : constant Vec2 := (1, 2);
   B : constant Vec2 := (3, 4);
   C : constant Vec2 := A + 2 * B;
begin
   Put_Line ("(" & C.X'Image & "," & C.Y'Image & " )");
end Operator_Overloading_Demo;
