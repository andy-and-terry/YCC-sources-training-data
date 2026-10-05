with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Range_Demo is
   subtype Percent is Integer range 0 .. 100;
   subtype Letter is Character range 'A' .. 'Z';
   type Day is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
   subtype Weekday is Day range Mon .. Fri;

   P : Percent := 100;
   D : Day := Sat;
begin
   Put_Line ("Percent'Last =" & Percent'Last'Image);
   Put_Line ("Letter 'M' in range: " & Boolean'Image ('M' in Letter));
   Put_Line ("Sat is weekday: " & Boolean'Image (D in Weekday));
   begin
      P := P + 1;
      Put_Line ("not reached");
   exception
      when Constraint_Error =>
         Put_Line ("Constraint_Error: Percent out of range");
   end;
end Subtype_Range_Demo;
