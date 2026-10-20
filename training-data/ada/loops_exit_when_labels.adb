with Ada.Text_IO; use Ada.Text_IO;

procedure Loops_Exit_When_Labels is
   I : Integer := 0;
   type Int_List is array (Positive range <>) of Integer;
   Values : constant Int_List := (3, 1, 4, 1, 5);
begin
   Outer :
   for A in 1 .. 5 loop
      for B in 1 .. 5 loop
         exit Outer when A * B = 12;
         if B > A then exit; end if;
         Put (Integer'Image (A * B));
      end loop;
   end loop Outer;
   New_Line;
   loop
      I := I + 3;
      exit when I > 10;
   end loop;
   Put_Line (Integer'Image (I));
   while I > 0 loop I := I - 4; end loop;
   Put_Line (Integer'Image (I));
   for K in reverse 1 .. 5 loop Put (Integer'Image (K)); end loop;
   New_Line;
   for C in Character range 'a' .. 'e' loop Put (C); end loop;
   New_Line;
   declare Total : Integer := 0; begin
      for X of Values loop Total := Total + X; end loop;
      Put_Line (Integer'Image (Total));
   end;
end Loops_Exit_When_Labels;
