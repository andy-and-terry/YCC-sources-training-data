with Ada.Text_IO; use Ada.Text_IO;

procedure Named_Loop_Exit is
begin
   Outer :
   for I in 1 .. 5 loop
      for J in 1 .. 5 loop
         if I * J = 12 then
            Put_Line ("Found" & I'Image & " *" & J'Image & " = 12");
            exit Outer;       --  leave both loops at once
         end if;
      end loop;
   end loop Outer;
end Named_Loop_Exit;
