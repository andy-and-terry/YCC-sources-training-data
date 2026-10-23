with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Environment_Variables;  use Ada.Environment_Variables;

procedure Environment_Variables_Demo is
   Name : constant String := "ADA_DEMO_VARIABLE";
begin
   Put_Line ("Exists before set: " & Boolean'Image (Exists (Name)));

   Set (Name, "hello from Ada");
   Put_Line ("Exists after set: " & Boolean'Image (Exists (Name)));
   Put_Line ("Value: " & Value (Name));

   Clear (Name);
   Put_Line ("Exists after clear: " & Boolean'Image (Exists (Name)));

   begin
      Put_Line (Value (Name));
   exception
      when Constraint_Error =>
         Put_Line ("Value raised Constraint_Error for an unset variable");
   end;
end Environment_Variables_Demo;
