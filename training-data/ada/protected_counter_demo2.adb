with Ada.Text_IO; use Ada.Text_IO;
procedure Protected_Counter_Demo2 is
   protected Counter is
      procedure Increment;
      function Value return Natural;
   private
      N : Natural := 0;
   end Counter;
   protected body Counter is
      procedure Increment is begin N := N + 1; end Increment;
      function Value return Natural is begin return N; end Value;
   end Counter;
begin
   for I in 1 .. 5 loop Counter.Increment; end loop;
   Put_Line (Natural'Image (Counter.Value));
end Protected_Counter_Demo2;
