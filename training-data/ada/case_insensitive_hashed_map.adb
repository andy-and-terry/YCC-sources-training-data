with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Hash_Case_Insensitive;
with Ada.Strings.Equal_Case_Insensitive;
with Ada.Containers.Indefinite_Hashed_Maps;

--  A hashed map whose String keys ignore letter case.
procedure Case_Insensitive_Hashed_Map is
   package Setting_Maps is new Ada.Containers.Indefinite_Hashed_Maps
     (Key_Type        => String,
      Element_Type    => Integer,
      Hash            => Ada.Strings.Hash_Case_Insensitive,
      Equivalent_Keys => Ada.Strings.Equal_Case_Insensitive);

   Settings : Setting_Maps.Map;
begin
   Settings.Include ("Timeout", 30);
   Settings.Include ("RETRIES", 3);

   --  Same key under different casing overwrites the earlier entry
   Settings.Include ("timeout", 60);

   Put_Line ("Entries:" & Integer'Image (Integer (Settings.Length)));
   Put_Line ("TIMEOUT =" & Integer'Image (Settings.Element ("TIMEOUT")));
   Put_Line ("retries =" & Integer'Image (Settings.Element ("retries")));
   Put_Line ("Has 'Missing': "
             & Boolean'Image (Settings.Contains ("Missing")));
end Case_Insensitive_Hashed_Map;
