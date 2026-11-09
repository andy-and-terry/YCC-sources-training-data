with Ada.Text_IO; use Ada.Text_IO;
procedure Interface_Type_Demo is
   type Printable is interface;
   procedure Show (P : Printable) is abstract;
   type Num is new Printable with record
      V : Integer;
   end record;
   overriding procedure Show (P : Num) is
   begin
      Put_Line ("Num" & Integer'Image (P.V));
   end Show;
   N : Num := (V => 5);
begin
   Show (N);
end Interface_Type_Demo;
