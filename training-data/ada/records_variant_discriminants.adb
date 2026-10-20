with Ada.Text_IO; use Ada.Text_IO;

procedure Records_Variant_Discriminants is
   type Kind is (Circle, Square, Triangle);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle   => Radius : Float;
         when Square   => Side : Float;
         when Triangle => Base, Height : Float;
      end case;
   end record;

   function Area (S : Shape) return Float is
   begin
      case S.K is
         when Circle   => return 3.14159 * S.Radius ** 2;
         when Square   => return S.Side ** 2;
         when Triangle => return 0.5 * S.Base * S.Height;
      end case;
   end Area;

   Shapes : constant array (1 .. 3) of Shape :=
     ((K => Circle, Radius => 1.0), (K => Square, Side => 2.0), (K => Triangle, Base => 3.0, Height => 4.0));
begin
   for S of Shapes loop
      Put_Line (Kind'Image (S.K) & Float'Image (Area (S)));
   end loop;
end Records_Variant_Discriminants;
