with Ada.Text_IO; use Ada.Text_IO;

procedure Protected_Object_Demo is
   protected type Safe_Counter is
      procedure Increment;
      function Value return Integer;
   private
      Count : Integer := 0;
   end Safe_Counter;

   protected body Safe_Counter is
      procedure Increment is
      begin
         Count := Count + 1;
      end Increment;

      function Value return Integer is
      begin
         return Count;
      end Value;
   end Safe_Counter;

   Counter : Safe_Counter;
begin
   for I in 1 .. 5 loop
      Counter.Increment;
   end loop;
   Put_Line (Counter.Value'Image);
end Protected_Object_Demo;
