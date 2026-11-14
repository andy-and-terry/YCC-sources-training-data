with Ada.Text_IO; use Ada.Text_IO;

procedure Discriminant_Demo is
   type Buffer (Size : Positive) is record
      Data : String (1 .. Size);
   end record;
   B : Buffer (5) := (Size => 5, Data => "hello");
begin
   Put_Line (B.Data & Integer'Image (B.Size));
end Discriminant_Demo;
