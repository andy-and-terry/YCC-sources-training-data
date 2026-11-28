with Ada.Text_IO; use Ada.Text_IO;

procedure Protected_Demo is
   protected Counter is
      procedure Inc;
      function Get return Natural;
   private
      N : Natural := 0;
   end Counter;

   protected body Counter is
      procedure Inc is begin N := N + 1; end Inc;
      function Get return Natural is begin return N; end Get;
   end Counter;
begin
   for I in 1 .. 5 loop Counter.Inc; end loop;
   Put_Line (Natural'Image (Counter.Get));
end Protected_Demo;
