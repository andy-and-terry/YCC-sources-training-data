with Ada.Text_IO; use Ada.Text_IO;
procedure Practical_Numbers is
   --  Practical numbers: every m in 1..n is a sum of distinct divisors of n.
   function Is_Practical (N : Positive) return Boolean is
      Reach : array (0 .. N) of Boolean := (0 => True, others => False);
      Next  : array (0 .. N) of Boolean;
   begin
      for D in 1 .. N loop
         if N mod D = 0 then
            for I in 0 .. N loop
               Next (I) := Reach (I) or else (I >= D and then Reach (I - D));
            end loop;
            Reach := Next;
         end if;
      end loop;
      for M in 1 .. N loop
         if not Reach (M) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Practical;
begin
   for N in 1 .. 40 loop
      if Is_Practical (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Practical_Numbers;
