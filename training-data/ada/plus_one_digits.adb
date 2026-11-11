with Ada.Text_IO; use Ada.Text_IO;

procedure Plus_One_Digits is
   D    : array (0 .. 3) of Integer := (0, 9, 9, 0);  -- leading slot reserved for carry-out
   Done : Boolean := False;
   I    : Integer := 2;
begin
   while I >= 1 and not Done loop
      if D (I) < 9 then
         D (I) := D (I) + 1;
         Done := True;
      else
         D (I) := 0;
      end if;
      I := I - 1;
   end loop;
   if not Done then
      D (0) := 1;
   end if;
   for V of D loop
      Put (Integer'Image (V));
   end loop;
   New_Line; -- 1 0 0 (with leading carry slot)
end Plus_One_Digits;
