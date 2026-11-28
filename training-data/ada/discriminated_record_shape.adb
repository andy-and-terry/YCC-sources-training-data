with Ada.Text_IO; use Ada.Text_IO;

procedure Discriminated_Record_Shape is
   type Kind is (Circle, Square);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle => Radius : Float;
         when Square => Side   : Float;
      end case;
   end record;

   function Area (S : Shape) return Float is
   begin
      case S.K is
         when Circle => return 3.14159 * S.Radius ** 2;
         when Square => return S.Side ** 2;
      end case;
   end Area;
begin
   Put_Line (Float'Image (Area ((K => Square, Side => 2.0))));
end Discriminated_Record_Shape;
