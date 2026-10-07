with Ada.Text_IO; use Ada.Text_IO;

procedure String_Tokenize is
   procedure Print_Tokens (Text : String; Delimiter : Character) is
      Start : Positive := Text'First;
   begin
      for I in Text'Range loop
         if Text (I) = Delimiter then
            if I > Start then
               Put_Line (Text (Start .. I - 1));
            end if;
            Start := I + 1;
         end if;
      end loop;
      if Start <= Text'Last then
         Put_Line (Text (Start .. Text'Last));
      end if;
   end Print_Tokens;
begin
   Print_Tokens ("red,green,blue", ',');
end String_Tokenize;
