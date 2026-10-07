with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Run_Length_Encode is
   function Encode (S : String) return String is
      Result : Unbounded_String;
      I : Positive := S'First;
   begin
      while I <= S'Last loop
         declare
            C : constant Character := S (I);
            Count : Natural := 0;
         begin
            while I <= S'Last and then S (I) = C loop
               Count := Count + 1;
               I := I + 1;
            end loop;
            Append (Result, Ada.Strings.Fixed.Trim (Count'Image, Ada.Strings.Left) & C);
         end;
      end loop;
      return To_String (Result);
   end Encode;
begin
   Put_Line (Encode ("aaabbbccd"));
   Put_Line (Encode ("abcd"));
end Run_Length_Encode;
