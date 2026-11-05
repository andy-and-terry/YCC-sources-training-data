with Ada.Text_IO; use Ada.Text_IO;

procedure Discriminated_Record_Shapes is
   type Kind is (Circle, Rectangle);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle    => Radius : Float;
         when Rectangle => W, H   : Float;
      end case;
   end record;

   function Area (S : Shape) return Float is
   begin
      case S.K is
         when Circle    => return 3.14159 * S.Radius ** 2;
         when Rectangle => return S.W * S.H;
      end case;
   end Area;

   A : constant Shape := (K => Circle, Radius => 2.0);
   B : constant Shape := (K => Rectangle, W => 3.0, H => 4.0);
begin
   Put_Line (Float'Image (Area (A)));
   Put_Line (Float'Image (Area (B)));
end Discriminated_Record_Shapes;
