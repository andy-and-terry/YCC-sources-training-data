with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Exception_Message_Demo is
   Bad_Input : exception;

   procedure Check (N : Integer) is
   begin
      if N < 0 then
         raise Bad_Input with "negative value:" & N'Image;
      end if;
   end Check;
begin
   Check (5);
   Check (-3);
   Put_Line ("not reached");
exception
   when E : Bad_Input =>
      Put_Line ("Caught: " & Exception_Name (E));
      Put_Line ("Message: " & Exception_Message (E));
   when others =>
      Put_Line ("Other error");
end Exception_Message_Demo;
