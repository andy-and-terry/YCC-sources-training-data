with Ada.Text_IO; use Ada.Text_IO;

procedure Contracts_Preconditions_Invariants is
   function Sqrt_Int (N : Natural) return Natural
     with Pre => N < 10_000, Post => Sqrt_Int'Result ** 2 <= N and then (Sqrt_Int'Result + 1) ** 2 > N;

   function Sqrt_Int (N : Natural) return Natural is
      R : Natural := 0;
   begin
      while (R + 1) ** 2 <= N loop R := R + 1; end loop;
      return R;
   end Sqrt_Int;

   subtype Even is Integer with Dynamic_Predicate => Even mod 2 = 0;
   type Counter is record Value : Natural := 0; end record with Type_Invariant => Counter.Value <= 100;

   procedure Halve (X : in out Even) with Pre => X > 0 is begin X := X / 2; end Halve;
   E : Even := 40;
begin
   Put_Line (Natural'Image (Sqrt_Int (99)));
   Halve (E);
   Put_Line (Integer'Image (E));
   begin
      Put_Line (Natural'Image (Sqrt_Int (20_000)));
   exception
      when others => Put_Line ("precondition violated");
   end;
end Contracts_Preconditions_Invariants;
