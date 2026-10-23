with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Discrete_Random_Dice is
   --  Ada.Numerics.Discrete_Random is generic over a discrete result type.
   subtype Die_Face is Positive range 1 .. 6;
   package Random_Die is new Ada.Numerics.Discrete_Random (Die_Face);

   Gen    : Random_Die.Generator;
   Tally  : array (Die_Face) of Natural := (others => 0);
   Rolls  : constant := 600;
   Face   : Die_Face;
begin
   --  A fixed seed makes the sequence repeatable between runs.
   Random_Die.Reset (Gen, Initiator => 12345);

   for I in 1 .. Rolls loop
      Face := Random_Die.Random (Gen);
      Tally (Face) := Tally (Face) + 1;
   end loop;

   declare
      Total : Natural := 0;
   begin
      for F in Die_Face loop
         Total := Total + Tally (F);
      end loop;
      Put_Line ("Total rolls:" & Total'Image);
   end;

   for F in Die_Face loop
      Put_Line ("Face" & F'Image & ":" & Boolean'Image (Tally (F) > 0));
   end loop;
end Discrete_Random_Dice;
