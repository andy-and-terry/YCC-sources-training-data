with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed;

procedure String_Map_Translate is
   From : constant Character_Sequence := "aeiou";
   To   : constant Character_Sequence := "AEIOU";
   Mapping : constant Character_Mapping := To_Mapping (From, To);
   Digits_Set : constant Character_Set := To_Set ("0123456789");
   Input : constant String := "room 101 is available";
begin
   Put_Line (Ada.Strings.Fixed.Translate (Input, Mapping));
   Put_Line ("Digits:" & Ada.Strings.Fixed.Count (Input, Digits_Set)'Image);
end String_Map_Translate;
