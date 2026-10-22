with Ada.Text_IO; use Ada.Text_IO;

--  Lucky numbers: start with odds, then delete every k-th survivor for each surviving k
procedure Lucky_Numbers is
   Limit : constant := 50;
   Lucky : array (1 .. Limit) of Integer;
   N     : Integer := 0;
   M     : Integer;
   I     : Integer := 2;
   Step  : Integer;
begin
   for V in 1 .. Limit loop
      if V mod 2 = 1 then
         N := N + 1;
         Lucky (N) := V;
      end if;
   end loop;
   while I <= N and then Lucky (I) <= N loop
      Step := Lucky (I);
      M := 0;
      for J in 1 .. N loop
         if J mod Step /= 0 then
            M := M + 1;
            Lucky (M) := Lucky (J);
         end if;
      end loop;
      N := M;
      I := I + 1;
   end loop;
   for J in 1 .. N loop
      Put (Integer'Image (Lucky (J)));
   end loop;
   New_Line;
end Lucky_Numbers;
