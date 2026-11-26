--  Squarefree numbers up to 100; expect 61.
with Ada.Text_IO; use Ada.Text_IO;

procedure Squarefree_Numbers is
   function Squarefree (N : Integer) return Boolean is
      D : Integer := 2;
   begin
      while D * D <= N loop
         if N mod (D * D) = 0 then
            return False;
         end if;
         D := D + 1;
      end loop;
      return True;
   end Squarefree;
   C : Integer := 0;
begin
   for N in 1 .. 100 loop
      if Squarefree (N) then
         C := C + 1;
      end if;
   end loop;
   Put_Line (Integer'Image (C));
end Squarefree_Numbers;
