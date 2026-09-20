with Ada.Text_IO; use Ada.Text_IO;

procedure Strategy_Pattern_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   -- The "strategy" is an access-to-function value that can be swapped
   -- at runtime, giving the same effect as a Strategy interface in OOP
   -- languages without needing a class hierarchy.
   type Reduce_Strategy is access function (Arr : Int_Array) return Integer;

   function Sum_Strategy (Arr : Int_Array) return Integer is
      Total : Integer := 0;
   begin
      for Value of Arr loop
         Total := Total + Value;
      end loop;
      return Total;
   end Sum_Strategy;

   function Max_Strategy (Arr : Int_Array) return Integer is
      Best : Integer := Arr (Arr'First);
   begin
      for Value of Arr loop
         if Value > Best then
            Best := Value;
         end if;
      end loop;
      return Best;
   end Max_Strategy;

   procedure Apply (Strategy : Reduce_Strategy; Arr : Int_Array; Label : String) is
   begin
      Put_Line (Label & ": " & Strategy (Arr)'Image);
   end Apply;

   Data : constant Int_Array := (4, 9, 1, 6, 3);
begin
   Apply (Sum_Strategy'Access, Data, "Sum");
   Apply (Max_Strategy'Access, Data, "Max");
end Strategy_Pattern_Demo;
