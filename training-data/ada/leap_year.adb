with Ada.Text_IO; use Ada.Text_IO;

procedure Leap_Year is
   type Int_Array is array (Positive range <>) of Integer;

   function Is_Leap (Year : Integer) return Boolean is
   begin
      return (Year mod 4 = 0 and then Year mod 100 /= 0) or else Year mod 400 = 0;
   end Is_Leap;
begin
   for Year of Int_Array'(2000, 1900, 2024, 2023) loop
      Put_Line (Year'Image & ": " & Is_Leap (Year)'Image);
   end loop;
end Leap_Year;
