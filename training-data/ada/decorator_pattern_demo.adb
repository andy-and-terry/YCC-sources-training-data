with Ada.Text_IO; use Ada.Text_IO;

procedure Decorator_Pattern_Demo is
   type Beverage is interface;
   function Cost (B : Beverage) return Float is abstract;
   function Description (B : Beverage) return String is abstract;

   type Beverage_Access is access all Beverage'Class;

   type Espresso is new Beverage with null record;
   overriding function Cost (B : Espresso) return Float is (1.50);
   overriding function Description (B : Espresso) return String is ("Espresso");

   -- Each decorator wraps another beverage and adds to its cost and
   -- description, without touching the wrapped object's code at all.
   type Milk_Decorator is new Beverage with record
      Wrapped : Beverage_Access;
   end record;
   overriding function Cost (B : Milk_Decorator) return Float is
     (B.Wrapped.Cost + 0.40);
   overriding function Description (B : Milk_Decorator) return String is
     (B.Wrapped.Description & " + Milk");

   type Sugar_Decorator is new Beverage with record
      Wrapped : Beverage_Access;
   end record;
   overriding function Cost (B : Sugar_Decorator) return Float is
     (B.Wrapped.Cost + 0.10);
   overriding function Description (B : Sugar_Decorator) return String is
     (B.Wrapped.Description & " + Sugar");

   Base      : constant Beverage_Access := new Espresso;
   With_Milk : constant Beverage_Access := new Milk_Decorator'(Wrapped => Base);
   With_Both : constant Beverage_Access :=
     new Sugar_Decorator'(Wrapped => With_Milk);
begin
   Put_Line (Base.Description & " costs" & Base.Cost'Image);
   Put_Line (With_Milk.Description & " costs" & With_Milk.Cost'Image);
   Put_Line (With_Both.Description & " costs" & With_Both.Cost'Image);
end Decorator_Pattern_Demo;
