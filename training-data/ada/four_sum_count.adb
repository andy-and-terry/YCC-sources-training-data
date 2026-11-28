with Ada.Text_IO; use Ada.Text_IO;

procedure Four_Sum_Count is
   A : constant array (1 .. 2) of Integer := (1, 2);
   B : constant array (1 .. 2) of Integer := (-2, -1);
   C : constant array (1 .. 2) of Integer := (-1, 2);
   D : constant array (1 .. 2) of Integer := (0, 2);
   Count : Natural := 0;
begin
   for X of A loop
      for Y of B loop
         for Z of C loop
            for W of D loop
               if X + Y + Z + W = 0 then
                  Count := Count + 1;
               end if;
            end loop;
         end loop;
      end loop;
   end loop;
   Put_Line (Natural'Image (Count)); -- 2
end Four_Sum_Count;
