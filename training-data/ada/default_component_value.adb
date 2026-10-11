with Ada.Text_IO; use Ada.Text_IO;

procedure Default_Component_Value is
   type Counter_Array is array (Character range 'a' .. 'e') of Natural
     with Default_Component_Value => 0;

   Counts : Counter_Array;
begin
   for C of String'("abacabad") loop
      if C in Counts'Range then
         Counts (C) := Counts (C) + 1;
      end if;
   end loop;
   for C in Counts'Range loop
      Put_Line (C & ":" & Counts (C)'Image);
   end loop;
end Default_Component_Value;
