with Ada.Text_IO; use Ada.Text_IO;

procedure Factory_Pattern_Demo is
   type Shape is abstract tagged null record;
   type Shape_Access is access all Shape'Class;

   function Area (S : Shape) return Float is abstract;
   function Name (S : Shape) return String is abstract;

   type Circle is new Shape with record
      Radius : Float;
   end record;
   overriding function Area (S : Circle) return Float is
     (3.14159 * S.Radius * S.Radius);
   overriding function Name (S : Circle) return String is ("Circle");

   type Square is new Shape with record
      Side : Float;
   end record;
   overriding function Area (S : Square) return Float is (S.Side * S.Side);
   overriding function Name (S : Square) return String is ("Square");

   type Shape_Kind is (Circle_Kind, Square_Kind);

   function Create_Shape
     (Kind : Shape_Kind; Size : Float) return Shape_Access
   is
   begin
      case Kind is
         when Circle_Kind =>
            return new Circle'(Radius => Size);
         when Square_Kind =>
            return new Square'(Side => Size);
      end case;
   end Create_Shape;

   S1 : constant Shape_Access := Create_Shape (Circle_Kind, 2.0);
   S2 : constant Shape_Access := Create_Shape (Square_Kind, 3.0);
begin
   Put_Line (S1.Name & " area:" & S1.Area'Image);
   Put_Line (S2.Name & " area:" & S2.Area'Image);
end Factory_Pattern_Demo;
