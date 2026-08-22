with Ada.Text_IO; use Ada.Text_IO;

procedure Tagged_Type_Demo is
   type Shape is tagged null record;
   function Area (S : Shape) return Float is (0.0);

   type Circle is new Shape with record
      Radius : Float;
   end record;
   overriding function Area (C : Circle) return Float is
     (3.14159 * C.Radius * C.Radius);

   type Rectangle is new Shape with record
      Width, Height : Float;
   end record;
   overriding function Area (R : Rectangle) return Float is (R.Width * R.Height);

   C : constant Circle := (Radius => 2.0);
   R : constant Rectangle := (Width => 3.0, Height => 4.0);
begin
   Put_Line (Area (C)'Image);
   Put_Line (Area (R)'Image);
end Tagged_Type_Demo;
