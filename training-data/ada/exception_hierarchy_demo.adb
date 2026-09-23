with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Exception_Hierarchy_Demo is
   Validation_Error : exception;
   Not_Found_Error  : exception;

   procedure Validate (Value : Integer) is
   begin
      if Value < 0 then
         raise Validation_Error with "negative value:" & Value'Image;
      end if;
   end Validate;

   procedure Lookup (Key : Integer) is
   begin
      Validate (Key);
      if Key /= 42 then
         raise Not_Found_Error with "no entry for key" & Key'Image;
      end if;
      Put_Line ("Found entry for key" & Key'Image);
   end Lookup;

   procedure Try (Key : Integer) is
   begin
      Lookup (Key);
   exception
      when E : Validation_Error | Not_Found_Error =>
         Put_Line ("Handled: " & Exception_Message (E));
      when E : others =>
         Put_Line ("Unexpected: " & Exception_Information (E));
   end Try;
begin
   Try (42);
   Try (-5);
   Try (7);
end Exception_Hierarchy_Demo;
