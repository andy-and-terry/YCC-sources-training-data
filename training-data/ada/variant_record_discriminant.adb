with Ada.Text_IO; use Ada.Text_IO;
procedure Variant_Record_Disc is
   type Kind is (Circle, Rect);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle => R : Float;
         when Rect   => W, H : Float;
      end case;
   end record;
   S : Shape := (K => Rect, W => 2.0, H => 3.0);
begin
   Put_Line (Float'Image (S.W * S.H));
end Variant_Record_Disc;
