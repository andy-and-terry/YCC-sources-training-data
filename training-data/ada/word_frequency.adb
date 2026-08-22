with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Word_Frequency is
   type Count_Array is array (Character range 'a' .. 'z') of Natural;
   Counts : Count_Array := (others => 0);
   Text : constant String := "the quick brown fox jumps over the lazy dog the fox runs";
begin
   for Ch of Text loop
      if Ch in 'a' .. 'z' then
         Counts (Ch) := Counts (Ch) + 1;
      end if;
   end loop;
   for Ch in Counts'Range loop
      if Counts (Ch) > 0 then
         Put_Line (Ch & ": " & Counts (Ch)'Image);
      end if;
   end loop;
end Word_Frequency;
