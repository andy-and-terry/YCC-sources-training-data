with Ada.Text_IO; use Ada.Text_IO;

procedure Counter_Singleton is
   package Counter is
      function Next return Natural;
   end Counter;

   package body Counter is
      Value : Natural := 0;
      function Next return Natural is
      begin
         Value := Value + 1;
         return Value;
      end Next;
   end Counter;
begin
   Put_Line (Counter.Next'Image);
   Put_Line (Counter.Next'Image);
   Put_Line (Counter.Next'Image);
end Counter_Singleton;
