with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Discrete_Random_Dice is
   subtype Die is Integer range 1 .. 6;

   package Die_Random is new Ada.Numerics.Discrete_Random (Die);

   Gen    : Die_Random.Generator;
   Counts : array (Die) of Natural := (others => 0);
   Rolls  : constant := 600;
   Total  : Natural := 0;
   Roll   : Die;
begin
   --  A fixed seed makes a run repeatable on the same implementation
   Die_Random.Reset (Gen, Initiator => 42);

   for I in 1 .. Rolls loop
      Roll := Die_Random.Random (Gen);
      Counts (Roll) := Counts (Roll) + 1;
   end loop;

   for Face in Die loop
      Total := Total + Counts (Face);
      Put_Line ("face" & Integer'Image (Face) & " seen: "
                & (if Counts (Face) > 0 then "yes" else "no"));
   end loop;

   Put_Line ("total rolls:" & Integer'Image (Total));
   Put_Line ("all rolls accounted for: " & Boolean'Image (Total = Rolls));

   --  Two generators with the same seed produce the same sequence
   declare
      G1, G2 : Die_Random.Generator;
      Same   : Boolean := True;
   begin
      Die_Random.Reset (G1, 7);
      Die_Random.Reset (G2, 7);
      for I in 1 .. 20 loop
         if Die_Random.Random (G1) /= Die_Random.Random (G2) then
            Same := False;
         end if;
      end loop;
      Put_Line ("same seed, same sequence: " & Boolean'Image (Same));
   end;
end Discrete_Random_Dice;
