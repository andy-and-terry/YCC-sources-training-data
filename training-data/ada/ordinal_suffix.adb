with Ada.Text_IO; use Ada.Text_IO;

procedure Ordinal_Suffix is
   function Ordinal (N : Natural) return String is
      Img : constant String := Natural'Image (N);
      Num : constant String := Img (Img'First + 1 .. Img'Last);
      R100 : constant Natural := N mod 100;
   begin
      if R100 in 11 .. 13 then
         return Num & "th";
      end if;
      case N mod 10 is
         when 1      => return Num & "st";
         when 2      => return Num & "nd";
         when 3      => return Num & "rd";
         when others => return Num & "th";
      end case;
   end Ordinal;
begin
   for N of (1, 2, 3, 4, 11, 12, 13, 21, 101, 111) loop
      Put (Ordinal (N) & " ");
   end loop;
   New_Line;
end Ordinal_Suffix;
