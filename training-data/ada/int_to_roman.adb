--  Integer (1..3999) to Roman numeral using a greedy table.
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Int_To_Roman is
   Values  : constant array (1 .. 13) of Positive :=
     (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
   Symbols : constant array (1 .. 13) of String (1 .. 2) :=
     ("M ", "CM", "D ", "CD", "C ", "XC", "L ", "XL", "X ", "IX", "V ", "IV", "I ");

   function To_Roman (Number : Positive) return String is
      N   : Natural := Number;
      Out_S : Unbounded_String;
   begin
      for I in Values'Range loop
         while N >= Values (I) loop
            Append (Out_S, (if Symbols (I) (2) = ' ' then Symbols (I) (1 .. 1) else Symbols (I)));
            N := N - Values (I);
         end loop;
      end loop;
      return To_String (Out_S);
   end To_Roman;
begin
   Put_Line (To_Roman (1994) & " " & To_Roman (58));
end Int_To_Roman;
