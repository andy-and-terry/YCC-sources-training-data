with Ada.Text_IO; use Ada.Text_IO;

procedure Max_Subarray is
   type Int_Array is array (Positive range <>) of Integer;

   function Max_Sub (Arr : Int_Array) return Integer is
      Max_So_Far, Max_Ending_Here : Integer;
   begin
      Max_So_Far := Arr (Arr'First);
      Max_Ending_Here := Arr (Arr'First);
      for I in Arr'First + 1 .. Arr'Last loop
         Max_Ending_Here := Integer'Max (Arr (I), Max_Ending_Here + Arr (I));
         Max_So_Far := Integer'Max (Max_So_Far, Max_Ending_Here);
      end loop;
      return Max_So_Far;
   end Max_Sub;

   Data : constant Int_Array := (-2, 1, -3, 4, -1, 2, 1, -5, 4);
begin
   Put_Line (Max_Sub (Data)'Image);
end Max_Subarray;
