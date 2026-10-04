with Ada.Text_IO; use Ada.Text_IO;

procedure Operator_Overloading_Demo is
   type Vec2 is record
      X, Y : Integer;
   end record;

   function "+" (L, R : Vec2) return Vec2 is
   begin
      return (L.X + R.X, L.Y + R.Y);
   end "+";

   function "-" (L, R : Vec2) return Vec2 is
   begin
      return (L.X - R.X, L.Y - R.Y);
   end "-";

   function "*" (K : Integer; V : Vec2) return Vec2 is
   begin
      return (K * V.X, K * V.Y);
   end "*";

   function "abs" (V : Vec2) return Natural is
   begin
      return abs V.X + abs V.Y;  --  Manhattan length
   end "abs";

   procedure Show (Label : String; V : Vec2) is
   begin
      Put_Line (Label & ": (" & V.X'Image & "," & V.Y'Image & " )");
   end Show;

   A : constant Vec2 := (1, 2);
   B : constant Vec2 := (3, -4);
begin
   Show ("A + B", A + B);
   Show ("A - B", A - B);
   Show ("3 * A", 3 * A);
   Put_Line ("|B| =" & Natural'Image (abs B));
   Put_Line ("Equal: " & Boolean'Image (A = (1, 2)));
end Operator_Overloading_Demo;
