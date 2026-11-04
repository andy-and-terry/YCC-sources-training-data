with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Heron_Area is
   function Heron (A, B, C : Float) return Float is
      S : constant Float := (A + B + C) / 2.0;
   begin
      return Sqrt (S * (S - A) * (S - B) * (S - C));
   end Heron;
begin
   Put_Line (Float'Image (Heron (3.0, 4.0, 5.0)));
   Put_Line (Float'Image (Heron (6.0, 7.0, 8.0)));
end Heron_Area;
