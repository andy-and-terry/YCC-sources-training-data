with Ada.Text_IO; use Ada.Text_IO;

procedure Excel_Column_Title is
   function Title (N0 : Positive) return String is
      N   : Natural := N0;
      Buf : String (1 .. 8);
      Pos : Integer := Buf'Last + 1;
   begin
      while N > 0 loop
         N := N - 1;
         Pos := Pos - 1;
         Buf (Pos) := Character'Val (Character'Pos ('A') + N mod 26);
         N := N / 26;
      end loop;
      return Buf (Pos .. Buf'Last);
   end Title;
begin
   Put_Line (Title (28) & " " & Title (701)); -- AB ZY
end Excel_Column_Title;
