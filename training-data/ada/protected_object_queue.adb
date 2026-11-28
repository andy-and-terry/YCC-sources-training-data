with Ada.Text_IO; use Ada.Text_IO;

procedure Protected_Object_Queue is
   protected type Counter is
      procedure Increment;
      function Value return Natural;
   private
      N : Natural := 0;
   end Counter;

   protected body Counter is
      procedure Increment is
      begin
         N := N + 1;
      end Increment;
      function Value return Natural is (N);
   end Counter;

   C : Counter;
begin
   for I in 1 .. 5 loop
      C.Increment;
   end loop;
   Put_Line (Natural'Image (C.Value));
end Protected_Object_Queue;
