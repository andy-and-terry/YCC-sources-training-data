with Ada.Text_IO; use Ada.Text_IO;

procedure Record_Demo is
   type Point is record
      X : Float;
      Y : Float;
   end record;

   function "+" (A, B : Point) return Point is
   begin
      return (X => A.X + B.X, Y => A.Y + B.Y);
   end "+";

   P1 : constant Point := (X => 1.0, Y => 2.0);
   P2 : constant Point := (X => 3.0, Y => 4.0);
   P3 : constant Point := P1 + P2;
begin
   Put_Line ("(" & P3.X'Image & "," & P3.Y'Image & " )");
end Record_Demo;
