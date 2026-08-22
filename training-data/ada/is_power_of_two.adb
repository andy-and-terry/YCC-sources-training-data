with Ada.Text_IO; use Ada.Text_IO;

procedure Is_Power_Of_Two is
   type Int_Array is array (Positive range <>) of Integer;

   function Is_Power (N : Integer) return Boolean is
      M : Integer := N;
   begin
      if N <= 0 then
         return False;
      end if;
      while M mod 2 = 0 loop
         M := M / 2;
      end loop;
      return M = 1;
   end Is_Power;
begin
   for N of Int_Array'(1, 2, 3, 4, 16, 18) loop
      Put_Line (N'Image & ": " & Is_Power (N)'Image);
   end loop;
end Is_Power_Of_Two;
