with Ada.Text_IO; use Ada.Text_IO;

procedure Strategy_Pattern_Demo is
   type Strategy is access function (A, B : Integer) return Integer;

   function Add (A, B : Integer) return Integer is (A + B);
   function Multiply (A, B : Integer) return Integer is (A * B);
   function Max_Of (A, B : Integer) return Integer is
     (if A > B then A else B);

   type Context is record
      Op : Strategy;
   end record;

   function Execute (C : Context; A, B : Integer) return Integer is
   begin
      return C.Op (A, B);
   end Execute;

   Adder      : constant Context := (Op => Add'Access);
   Multiplier : constant Context := (Op => Multiply'Access);
   Maximizer  : constant Context := (Op => Max_Of'Access);
begin
   Put_Line (Execute (Adder, 3, 4)'Image);
   Put_Line (Execute (Multiplier, 3, 4)'Image);
   Put_Line (Execute (Maximizer, 3, 4)'Image);
end Strategy_Pattern_Demo;
