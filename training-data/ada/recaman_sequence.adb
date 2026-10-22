with Ada.Text_IO; use Ada.Text_IO;

--  Recaman sequence: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
procedure Recaman_Sequence is
   Count : constant := 20;
   Seen  : array (0 .. 200) of Boolean := (others => False);
   Cur   : Integer := 0;
   Nxt   : Integer;
begin
   Seen (0) := True;
   Put (Integer'Image (Cur));
   for I in 1 .. Count - 1 loop
      Nxt := Cur - I;
      if Nxt < 0 or else Seen (Nxt) then
         Nxt := Cur + I;
      end if;
      Seen (Nxt) := True;
      Cur := Nxt;
      Put (Integer'Image (Cur));
   end loop;
   New_Line;
end Recaman_Sequence;
