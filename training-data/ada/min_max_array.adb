with Ada.Text_IO; use Ada.Text_IO;

procedure Min_Max_Array is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Find_Min_Max (Arr : Int_Array; Min, Max : out Integer) is
   begin
      Min := Arr (Arr'First);
      Max := Arr (Arr'First);
      for V of Arr loop
         if V < Min then Min := V; end if;
         if V > Max then Max := V; end if;
      end loop;
   end Find_Min_Max;

   Data : constant Int_Array := (5, 3, 8, 1, 9, 2);
   Min_V, Max_V : Integer;
begin
   Find_Min_Max (Data, Min_V, Max_V);
   Put_Line ("Min: " & Min_V'Image);
   Put_Line ("Max: " & Max_V'Image);
end Min_Max_Array;
