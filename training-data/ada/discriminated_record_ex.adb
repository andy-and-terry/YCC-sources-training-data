with Ada.Text_IO; use Ada.Text_IO;

procedure Discriminated_Record_Ex is
   type Kind is (Circle, Rect);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle => R : Float;
         when Rect   => W, H : Float;
      end case;
   end record;

   S : Shape := (K => Rect, W => 2.0, H => 3.0);
begin
   case S.K is
      when Circle => Put_Line ("circle");
      when Rect   => Put_Line (Float'Image (S.W * S.H));
   end case;
end Discriminated_Record_Ex;
