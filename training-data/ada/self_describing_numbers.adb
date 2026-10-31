with Ada.Text_IO; use Ada.Text_IO;

procedure Self_Describing_Numbers is
   function Is_Self_Describing (S : String) return Boolean is
      Count : Natural;
   begin
      for I in 0 .. S'Length - 1 loop
         Count := 0;
         for C of S loop
            if Character'Pos (C) - Character'Pos ('0') = I then
               Count := Count + 1;
            end if;
         end loop;
         if Count /= Character'Pos (S (S'First + I)) - Character'Pos ('0') then
            return False;
         end if;
      end loop;
      return True;
   end Is_Self_Describing;
begin
   Put_Line ("1210 " & Boolean'Image (Is_Self_Describing ("1210")));
   Put_Line ("2020 " & Boolean'Image (Is_Self_Describing ("2020")));
   Put_Line ("21200 " & Boolean'Image (Is_Self_Describing ("21200")));
   Put_Line ("1211 " & Boolean'Image (Is_Self_Describing ("1211")));
end Self_Describing_Numbers;
