with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure String_Builder_Append is
   Result : Unbounded_String;
begin
   for I in 1 .. 5 loop
      Append (Result, Integer'Image (I));
      if I < 5 then
         Append (Result, ",");
      end if;
   end loop;
   Put_Line (To_String (Result));
   Put_Line ("Length:" & Length (Result)'Image);
   Put_Line (Slice (Result, 1, 4));
   Replace_Slice (Result, 1, 2, "#");
   Put_Line (To_String (Result));
end String_Builder_Append;
