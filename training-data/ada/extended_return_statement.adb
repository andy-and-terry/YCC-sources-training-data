with Ada.Text_IO; use Ada.Text_IO;

procedure Extended_Return_Statement is
   type Stats is record
      Min, Max, Sum : Integer;
   end record;

   type Int_Array is array (Positive range <>) of Integer;

   function Compute (Data : Int_Array) return Stats is
   begin
      return Result : Stats := (Data (Data'First), Data (Data'First), 0) do
         for X of Data loop
            Result.Min := Integer'Min (Result.Min, X);
            Result.Max := Integer'Max (Result.Max, X);
            Result.Sum := Result.Sum + X;
         end loop;
      end return;
   end Compute;

   S : constant Stats := Compute ((5, -2, 9, 4));
begin
   Put_Line (S.Min'Image & S.Max'Image & S.Sum'Image);
end Extended_Return_Statement;
