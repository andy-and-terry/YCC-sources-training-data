with Ada.Text_IO; use Ada.Text_IO;

procedure Discriminant_Record_Demo is
   type Shape_Kind is (Circle_Kind, Rectangle_Kind);

   type Shape (Kind : Shape_Kind) is record
      case Kind is
         when Circle_Kind =>
            Radius : Float;
         when Rectangle_Kind =>
            Width, Height : Float;
      end case;
   end record;

   function Area (S : Shape) return Float is
   begin
      case S.Kind is
         when Circle_Kind =>
            return 3.14159 * S.Radius * S.Radius;
         when Rectangle_Kind =>
            return S.Width * S.Height;
      end case;
   end Area;

   C : constant Shape := (Kind => Circle_Kind, Radius => 2.0);
   R : constant Shape := (Kind => Rectangle_Kind, Width => 3.0, Height => 4.0);
begin
   Put_Line (Area (C)'Image);
   Put_Line (Area (R)'Image);
end Discriminant_Record_Demo;
