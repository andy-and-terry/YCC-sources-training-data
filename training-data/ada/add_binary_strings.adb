with Ada.Text_IO; use Ada.Text_IO;

procedure Add_Binary_Strings is
   function Add_Binary (A, B : String) return String is
      I     : Integer := A'Last;
      J     : Integer := B'Last;
      Carry : Integer := 0;
      Sum   : Integer;
      Out_S : String (1 .. 64);
      Pos   : Integer := Out_S'Last + 1;
   begin
      while I >= A'First or else J >= B'First or else Carry > 0 loop
         Sum := Carry;
         if I >= A'First then
            Sum := Sum + Character'Pos (A (I)) - Character'Pos ('0');
            I := I - 1;
         end if;
         if J >= B'First then
            Sum := Sum + Character'Pos (B (J)) - Character'Pos ('0');
            J := J - 1;
         end if;
         Pos := Pos - 1;
         Out_S (Pos) := Character'Val (Character'Pos ('0') + Sum mod 2);
         Carry := Sum / 2;
      end loop;
      return Out_S (Pos .. Out_S'Last);
   end Add_Binary;
begin
   Put_Line (Add_Binary ("1010", "1011")); -- 10101
end Add_Binary_Strings;
