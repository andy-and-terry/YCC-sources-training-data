with Ada.Text_IO; use Ada.Text_IO;
procedure Bouncy_Numbers is
   --  Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
   function Is_Bouncy (N : Positive) return Boolean is
      M : Natural := N / 10;
      Prev : Natural := N mod 10;
      D : Natural;
      Inc, Dec : Boolean := True;
   begin
      while M > 0 loop
         D := M mod 10;
         if D > Prev then Inc := False; end if;
         if D < Prev then Dec := False; end if;
         Prev := D;
         M := M / 10;
      end loop;
      return (not Inc) and (not Dec);
   end Is_Bouncy;
   Count : Natural := 0;
begin
   for N in 1 .. 999 loop
      if Is_Bouncy (N) then
         Count := Count + 1;
      end if;
   end loop;
   Put_Line (Natural'Image (Count));
end Bouncy_Numbers;
