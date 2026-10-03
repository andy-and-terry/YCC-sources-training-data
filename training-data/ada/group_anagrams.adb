with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Group_Anagrams is
   type Word_Array is array (Positive range <>) of Unbounded_String;

   function Sorted_Key (W : String) return String is
      Result : String := W;
      Temp   : Character;
   begin
      for I in Result'First .. Result'Last loop
         for J in Result'First .. Result'Last - (I - Result'First) - 1 loop
            if Result (J) > Result (J + 1) then
               Temp := Result (J);
               Result (J) := Result (J + 1);
               Result (J + 1) := Temp;
            end if;
         end loop;
      end loop;
      return Result;
   end Sorted_Key;

   Words : constant Word_Array :=
     (To_Unbounded_String ("eat"), To_Unbounded_String ("tea"),
      To_Unbounded_String ("tan"), To_Unbounded_String ("ate"),
      To_Unbounded_String ("nat"), To_Unbounded_String ("bat"));
begin
   for I in Words'Range loop
      declare
         Key : constant String := Sorted_Key (To_String (Words (I)));
      begin
         Put (To_String (Words (I)) & " -> " & Key);
         New_Line;
      end;
   end loop;
end Group_Anagrams;
