with Ada.Text_IO; use Ada.Text_IO;

procedure Factory_Pattern_Demo is
   type Shape is tagged null record;
   function Describe (S : Shape) return String is ("<unknown shape>");

   type Circle is new Shape with record
      Radius : Float;
   end record;
   overriding function Describe (C : Circle) return String is
     ("Circle(radius=" & C.Radius'Image & ")");

   type Square is new Shape with record
      Side : Float;
   end record;
   overriding function Describe (S : Square) return String is
     ("Square(side=" & S.Side'Image & ")");

   type Shape_Kind is (Kind_Circle, Kind_Square);

   -- The factory hides the concrete type behind the tagged Shape'Class
   -- class-wide type, so callers depend only on the abstraction.
   function Make_Shape (Kind : Shape_Kind) return Shape'Class is
   begin
      case Kind is
         when Kind_Circle =>
            return Circle'(Radius => 2.0);
         when Kind_Square =>
            return Square'(Side => 3.0);
      end case;
   end Make_Shape;
begin
   Put_Line (Make_Shape (Kind_Circle).Describe);
   Put_Line (Make_Shape (Kind_Square).Describe);
end Factory_Pattern_Demo;
