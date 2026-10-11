with Ada.Text_IO; use Ada.Text_IO;

procedure Abstract_Tagged_Shapes is
   type Shape is abstract tagged null record;
   function Area (S : Shape) return Float is abstract;
   function Name (S : Shape) return String is abstract;

   type Rect is new Shape with record
      W, H : Float;
   end record;
   overriding function Area (R : Rect) return Float is (R.W * R.H);
   overriding function Name (R : Rect) return String is ("rect");

   type Circle is new Shape with record
      R : Float;
   end record;
   overriding function Area (C : Circle) return Float is (3.14159 * C.R * C.R);
   overriding function Name (C : Circle) return String is ("circle");

   procedure Report (S : Shape'Class) is
   begin
      Put_Line (Name (S) & ":" & Float'Image (Area (S)));
   end Report;
begin
   Report (Rect'(W => 3.0, H => 4.0));
   Report (Circle'(R => 1.0));
end Abstract_Tagged_Shapes;
