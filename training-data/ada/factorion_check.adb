with Ada.Text_IO; use Ada.Text_IO;

procedure Factorion_Check is
   type Fact_Table is array (0 .. 9) of Natural;
   Fact : constant Fact_Table := (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);

   function Is_Factorion (N : Natural) return Boolean is
      M   : Natural := N;
      Sum : Natural := 0;
   begin
      while M > 0 loop
         Sum := Sum + Fact (M mod 10);
         M := M / 10;
      end loop;
      return Sum = N;
   end Is_Factorion;
begin
   for N in 1 .. 49_999 loop
      if Is_Factorion (N) then
         Put (Natural'Image (N));
      end if;
   end loop;
   New_Line;
end Factorion_Check;
