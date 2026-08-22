with Ada.Text_IO; use Ada.Text_IO;

procedure Count_Digits is
   function Digit_Count (N : Natural) return Natural is
      M : Natural := N;
      Count : Natural := 0;
   begin
      if M = 0 then
         return 1;
      end if;
      while M > 0 loop
         Count := Count + 1;
         M := M / 10;
      end loop;
      return Count;
   end Digit_Count;
begin
   Put_Line (Digit_Count (12345)'Image);
   Put_Line (Digit_Count (0)'Image);
end Count_Digits;
