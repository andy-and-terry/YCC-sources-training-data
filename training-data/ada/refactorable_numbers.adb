with Ada.Text_IO; use Ada.Text_IO;

procedure Refactorable_Numbers is
   function Tau (N : Positive) return Positive is
      C : Natural := 0;
   begin
      for D in 1 .. N loop
         if N mod D = 0 then C := C + 1; end if;
      end loop;
      return C;
   end Tau;
begin
   for N in 1 .. 59 loop
      if N mod Tau (N) = 0 then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;  --  1 2 8 9 12 18 24 36 40 56
end Refactorable_Numbers;
