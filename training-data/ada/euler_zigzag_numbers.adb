with Ada.Text_IO; use Ada.Text_IO;
procedure Euler_Zigzag_Numbers is
   --  Euler zigzag numbers via the Seidel-Entringer boustrophedon.
   type Vec is array (0 .. 15) of Long_Long_Integer;
   Row, Next : Vec := (others => 0);
   Len       : Natural := 1;
begin
   Row (0) := 1;
   Put (" 1");
   for Step in 1 .. 9 loop
      Next (0) := 0;
      for J in 1 .. Len loop
         Next (J) := Next (J - 1) + Row (Len - J);
      end loop;
      Len := Len + 1;
      Row := Next;
      Put (Long_Long_Integer'Image (Row (Len - 1)));
   end loop;
   New_Line;
end Euler_Zigzag_Numbers;
