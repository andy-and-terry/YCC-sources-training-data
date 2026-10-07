with Ada.Text_IO; use Ada.Text_IO;

procedure State_Pattern_Demo is
   type Traffic_State is (Red, Green, Yellow);

   function Next (S : Traffic_State) return Traffic_State is
   begin
      case S is
         when Red    => return Green;
         when Green  => return Yellow;
         when Yellow => return Red;
      end case;
   end Next;

   Current : Traffic_State := Red;
begin
   for I in 1 .. 6 loop
      Put_Line (Current'Image);
      Current := Next (Current);
   end loop;
end State_Pattern_Demo;
