with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure Characters_Handling_Demo is
   Text : constant String := "Hello, World 123";
   Letters, Digits : Natural := 0;
begin
   for C of Text loop
      if Is_Letter (C) then
         Letters := Letters + 1;
      elsif Is_Digit (C) then
         Digits := Digits + 1;
      end if;
   end loop;
   Put_Line ("Letters:" & Letters'Image);
   Put_Line ("Digits:" & Digits'Image);
   Put_Line (To_Upper (Text));
   Put_Line (To_Lower (Text));
end Characters_Handling_Demo;
