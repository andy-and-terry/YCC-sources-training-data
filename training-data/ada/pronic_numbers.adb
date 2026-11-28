with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Pronic_Numbers is
   function Is_Pronic (X : Natural) return Boolean is
      N : constant Natural := Natural (Float'Floor (Sqrt (Float (X))));
   begin
      return N * (N + 1) = X;
   end Is_Pronic;
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (N * (N + 1)));
   end loop;
   New_Line;  --  0 2 6 12 20 30 42 56 72 90
   Put_Line (Boolean'Image (Is_Pronic (56)) & " " & Boolean'Image (Is_Pronic (57)));
end Pronic_Numbers;
