with Ada.Text_IO; use Ada.Text_IO;

--  Lucky numbers below 100: start with the odd numbers, then repeatedly
--  delete every k-th survivor, where k is the next surviving number
procedure Lucky_Numbers is
   List : array (1 .. 100) of Integer := (others => 0);
   Len  : Integer := 0;
   Idx  : Integer := 2;
   K    : Integer;
   Last : Integer;
begin
   for N in 1 .. 99 loop
      if N mod 2 = 1 then
         Len := Len + 1;
         List (Len) := N;
      end if;
   end loop;
   while Idx <= Len and then List (Idx) <= Len loop
      K := List (Idx);
      Last := 0;
      for P in 1 .. Len loop
         if P mod K /= 0 then
            Last := Last + 1;
            List (Last) := List (P);
         end if;
      end loop;
      Len := Last;
      Idx := Idx + 1;
   end loop;
   for P in 1 .. Len loop
      Put (Integer'Image (List (P)));
   end loop;
   New_Line;
end Lucky_Numbers;
