with Ada.Text_IO; use Ada.Text_IO;

procedure Rail_Fence_Cipher is
   Text  : constant String := "WEAREDISCOVERED";
   Rails : constant := 3;
   Out_S : String (Text'Range);
   K     : Positive := Out_S'First;
begin
   for Row in 0 .. Rails - 1 loop
      declare
         R    : Integer := 0;
         Step : Integer := 1;
      begin
         for I in Text'Range loop
            if R = Row then
               Out_S (K) := Text (I);
               K := K + 1;
            end if;
            if R = 0 then Step := 1;
            elsif R = Rails - 1 then Step := -1;
            end if;
            R := R + Step;
         end loop;
      end;
   end loop;
   Put_Line (Out_S);
end Rail_Fence_Cipher;
