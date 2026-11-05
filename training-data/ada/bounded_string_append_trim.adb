with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Bounded;

procedure Bounded_String_Append_Trim is
   package B is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 32);
   use B;
   S : Bounded_String := To_Bounded_String ("  hello ");
begin
   S := S & To_Bounded_String ("world  ");
   Put_Line ("[" & To_String (S) & "]");
   Put_Line ("Length =" & Natural'Image (Length (S)));
end Bounded_String_Append_Trim;
