with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Unbounded_String_Demo is
   Message : Unbounded_String := To_Unbounded_String ("Hello");
begin
   Append (Message, ", ");
   Append (Message, "world!");
   Put_Line (To_String (Message));
   Put_Line ("Length:" & Length (Message)'Image);

   Insert (Message, Length (Message) + 1, " Goodbye.");
   Put_Line (To_String (Message));

   Put_Line ("Slice 1..5: " & Slice (Message, 1, 5));

   Delete (Message, 1, 7); -- drop the leading "Hello, "
   Put_Line ("After delete: " & To_String (Message));

   Put_Line ("Index of ""world"":" & Index (Message, "world")'Image);
end Unbounded_String_Demo;
