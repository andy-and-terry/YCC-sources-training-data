with Ada.Text_IO; use Ada.Text_IO;

procedure Enum_Demo is
   type Suit is (Hearts, Spades, Clubs, Diamonds);

   function Color (S : Suit) return String is
   begin
      case S is
         when Hearts | Diamonds => return "red";
         when Spades | Clubs => return "black";
      end case;
   end Color;
begin
   for S in Suit loop
      Put_Line (S'Image & ": " & Color (S));
   end loop;
end Enum_Demo;
