with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;

procedure Hashed_Map_Word_Count is
   package Count_Maps is new Ada.Containers.Indefinite_Hashed_Maps
     (Key_Type => String, Element_Type => Natural,
      Hash => Ada.Strings.Hash, Equivalent_Keys => "=");
   use Count_Maps;

   Counts : Map;
   Text   : constant String := "the cat the dog the cat";
   First  : Positive := Text'First;

   procedure Add (W : String) is
   begin
      if Counts.Contains (W) then
         Counts.Replace (W, Counts.Element (W) + 1);
      else
         Counts.Insert (W, 1);
      end if;
   end Add;
begin
   for I in Text'Range loop
      if Text (I) = ' ' then
         Add (Text (First .. I - 1));
         First := I + 1;
      end if;
   end loop;
   Add (Text (First .. Text'Last));
   Put_Line ("the:" & Counts.Element ("the")'Image);
   Put_Line ("cat:" & Counts.Element ("cat")'Image);
   Put_Line ("dog:" & Counts.Element ("dog")'Image);
end Hashed_Map_Word_Count;
