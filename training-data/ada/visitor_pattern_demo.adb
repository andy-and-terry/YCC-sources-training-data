with Ada.Text_IO; use Ada.Text_IO;

procedure Visitor_Pattern_Demo is
   type Shape is interface;
   type Shape_Visitor is interface;

   -- Double dispatch: each shape knows how to "accept" a visitor, and
   -- calls back the visitor's method that matches its own concrete
   -- type, without either side needing a big type-case statement.
   procedure Accept_Visitor
     (S : Shape; V : in out Shape_Visitor'Class) is abstract;

   procedure Visit_Circle (V : in out Shape_Visitor; Radius : Float) is abstract;
   procedure Visit_Square (V : in out Shape_Visitor; Side : Float) is abstract;

   type Circle is new Shape with record
      Radius : Float;
   end record;

   overriding procedure Accept_Visitor
     (S : Circle; V : in out Shape_Visitor'Class)
   is
   begin
      V.Visit_Circle (S.Radius);
   end Accept_Visitor;

   type Square is new Shape with record
      Side : Float;
   end record;

   overriding procedure Accept_Visitor
     (S : Square; V : in out Shape_Visitor'Class)
   is
   begin
      V.Visit_Square (S.Side);
   end Accept_Visitor;

   -- Concrete visitor: accumulates the total area of every shape visited.
   type Area_Visitor is new Shape_Visitor with record
      Total : Float := 0.0;
   end record;

   overriding procedure Visit_Circle (V : in out Area_Visitor; Radius : Float) is
   begin
      V.Total := V.Total + 3.14159 * Radius * Radius;
   end Visit_Circle;

   overriding procedure Visit_Square (V : in out Area_Visitor; Side : Float) is
   begin
      V.Total := V.Total + Side * Side;
   end Visit_Square;

   C  : constant Circle := (Radius => 2.0);
   Sq : constant Square := (Side => 3.0);
   AV : Area_Visitor;
begin
   C.Accept_Visitor (AV);
   Sq.Accept_Visitor (AV);
   Put_Line ("Total area:" & AV.Total'Image);
end Visitor_Pattern_Demo;
