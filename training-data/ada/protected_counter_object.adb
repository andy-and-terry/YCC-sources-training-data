with Ada.Text_IO; use Ada.Text_IO;
procedure Protected_Counter_Obj is
   protected Counter is
      procedure Inc;
      function Get return Integer;
   private
      N : Integer := 0;
   end Counter;
   protected body Counter is
      procedure Inc is begin N := N + 1; end Inc;
      function Get return Integer is begin return N; end Get;
   end Counter;
begin
   Counter.Inc; Counter.Inc;
   Put_Line (Integer'Image (Counter.Get));
end Protected_Counter_Obj;
