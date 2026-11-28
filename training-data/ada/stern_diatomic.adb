with Ada.Text_IO; use Ada.Text_IO;

procedure Stern_Diatomic is
   Seq : array (0 .. 14) of Natural := (0 => 0, 1 => 1, others => 0);
begin
   for I in 2 .. 14 loop
      if I mod 2 = 0 then
         Seq (I) := Seq (I / 2);
      else
         Seq (I) := Seq (I / 2) + Seq (I / 2 + 1);
      end if;
   end loop;
   for V of Seq loop
      Put (Natural'Image (V));
   end loop;
   New_Line;  --  0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
end Stern_Diatomic;
