with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure Character_Classification is
   Text    : constant String := "Hello, World 2024!";
   Letters : Natural := 0;
   Digits  : Natural := 0;
   Spaces  : Natural := 0;
   Others  : Natural := 0;
begin
   for C of Text loop
      if Is_Letter (C) then
         Letters := Letters + 1;
      elsif Is_Digit (C) then
         Digits := Digits + 1;
      elsif C = ' ' then
         Spaces := Spaces + 1;
      else
         Others := Others + 1;
      end if;
   end loop;

   Put_Line ("Letters:" & Letters'Image);
   Put_Line ("Digits :" & Digits'Image);
   Put_Line ("Spaces :" & Spaces'Image);
   Put_Line ("Others :" & Others'Image);
   Put_Line (To_Upper (Text));
   Put_Line (To_Lower (Text));
end Character_Classification;
