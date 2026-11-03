with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure Vowel_Counter is
   Text   : constant String := "Education is beautiful";
   Vowels : constant String := "aeiou";
   N      : Natural;
begin
   for V of Vowels loop
      N := 0;
      for C of Text loop
         if To_Lower (C) = V then
            N := N + 1;
         end if;
      end loop;
      Put (V & "=" & Natural'Image (N) & " ");
   end loop;
   New_Line;
end Vowel_Counter;
