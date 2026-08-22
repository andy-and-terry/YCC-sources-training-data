with Ada.Text_IO; use Ada.Text_IO;

procedure Valid_Parentheses is
   function Is_Valid (S : String) return Boolean is
      Stack : String (1 .. S'Length);
      Top : Integer := 0;
   begin
      for Ch of S loop
         case Ch is
            when '(' | '[' | '{' =>
               Top := Top + 1;
               Stack (Top) := Ch;
            when ')' =>
               if Top = 0 or else Stack (Top) /= '(' then
                  return False;
               end if;
               Top := Top - 1;
            when ']' =>
               if Top = 0 or else Stack (Top) /= '[' then
                  return False;
               end if;
               Top := Top - 1;
            when '}' =>
               if Top = 0 or else Stack (Top) /= '{' then
                  return False;
               end if;
               Top := Top - 1;
            when others =>
               null;
         end case;
      end loop;
      return Top = 0;
   end Is_Valid;
begin
   Put_Line (Is_Valid ("({[]})")'Image);
   Put_Line (Is_Valid ("(]")'Image);
end Valid_Parentheses;
