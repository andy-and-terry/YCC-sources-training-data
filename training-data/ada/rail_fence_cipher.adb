with Ada.Text_IO; use Ada.Text_IO;
procedure Rail_Fence_Cipher is
   S : constant String := "WEAREDISCOVERED";
   Rail : array (S'Range) of Natural;
   R : Natural := 0;
   Down : Boolean := True;
begin
   for I in S'Range loop
      Rail (I) := R;
      if R = 0 then Down := True; end if;
      if R = 2 then Down := False; end if;
      if Down then R := R + 1; else R := R - 1; end if;
   end loop;
   for Row in 0 .. 2 loop
      for I in S'Range loop
         if Rail (I) = Row then Put (S (I)); end if;
      end loop;
   end loop;
   New_Line;
end Rail_Fence_Cipher;
