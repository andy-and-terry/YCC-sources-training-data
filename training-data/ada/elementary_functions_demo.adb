with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics;

procedure Elementary_Functions_Demo is
begin
   Put_Line (Sqrt (2.0)'Image);
   Put_Line (Sin (Ada.Numerics.Pi / 2.0)'Image);
   Put_Line (Log (Ada.Numerics.e)'Image);
   Put_Line ((2.0 ** 10)'Image);
   Put_Line (Float'Rounding (2.5)'Image);
   Put_Line (Float'Floor (-1.5)'Image);
end Elementary_Functions_Demo;
