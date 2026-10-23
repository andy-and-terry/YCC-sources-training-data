with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters;

procedure Latin_1_Control_Chars is
   Line : constant String :=
     "name" & Latin_1.HT & "age" & Latin_1.HT & "city";

   function Count_Tabs (S : String) return Natural is
      N : Natural := 0;
   begin
      for C of S loop
         if C = Latin_1.HT then
            N := N + 1;
         end if;
      end loop;
      return N;
   end Count_Tabs;

   function Is_Control (C : Character) return Boolean is
     (C < Latin_1.Space or else C = Latin_1.DEL);
begin
   Put_Line ("tabs in line:" & Natural'Image (Count_Tabs (Line)));
   Put_Line ("HT code:" & Integer'Image (Character'Pos (Latin_1.HT)));
   Put_Line ("LF code:" & Integer'Image (Character'Pos (Latin_1.LF)));
   Put_Line ("NUL code:" & Integer'Image (Character'Pos (Latin_1.NUL)));

   Put_Line ("quoted: " & Latin_1.Quotation & "hi" & Latin_1.Quotation);
   Put_Line ("price: " & Latin_1.Dollar_Sign & "5");
   Put_Line ("two lines:" & Latin_1.LF & "second line");

   Put_Line ("HT is control: " & Boolean'Image (Is_Control (Latin_1.HT)));
   Put_Line ("'A' is control: " & Boolean'Image (Is_Control ('A')));
end Latin_1_Control_Chars;
