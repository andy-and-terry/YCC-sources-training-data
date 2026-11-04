with Ada.Text_IO; use Ada.Text_IO;

procedure Zigzag_Convert is
   function Zigzag (S : String; Rows : Positive) return String is
      Result : String (1 .. S'Length);
      Pos    : Natural := 0;
      Period : constant Natural := 2 * (Rows - 1);
   begin
      if Rows = 1 or else Rows >= S'Length then
         return S;
      end if;
      for R in 0 .. Rows - 1 loop
         declare
            I : Integer := S'First + R;
         begin
            while I <= S'Last loop
               Pos := Pos + 1;
               Result (Pos) := S (I);
               declare
                  K : constant Integer := I + Period - 2 * R;
               begin
                  if R > 0 and then R < Rows - 1 and then K <= S'Last then
                     Pos := Pos + 1;
                     Result (Pos) := S (K);
                  end if;
               end;
               I := I + Period;
            end loop;
         end;
      end loop;
      return Result;
   end Zigzag;
begin
   Put_Line (Zigzag ("PAYPALISHIRING", 3));
end Zigzag_Convert;
