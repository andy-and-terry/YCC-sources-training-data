--  Bulls and Cows scoring for equal-length digit strings.
with Ada.Text_IO; use Ada.Text_IO;

procedure Bulls_And_Cows is
   Secret : constant String := "1807";
   Guess  : constant String := "7810";
   SC, GC : array (Character range '0' .. '9') of Natural := (others => 0);
   Bulls, Cows : Natural := 0;
begin
   for I in Secret'Range loop
      if Secret (I) = Guess (I) then
         Bulls := Bulls + 1;
      else
         SC (Secret (I)) := SC (Secret (I)) + 1;
         GC (Guess (I)) := GC (Guess (I)) + 1;
      end if;
   end loop;
   for D in SC'Range loop
      Cows := Cows + Natural'Min (SC (D), GC (D));
   end loop;
   Put_Line (Natural'Image (Bulls) & " bull(s)," & Natural'Image (Cows) & " cow(s)");
end Bulls_And_Cows;
