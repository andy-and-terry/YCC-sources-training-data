with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Roman_Numerals is
   type Value_Array is array (1 .. 13) of Integer;
   type Symbol_Array is array (1 .. 13) of Unbounded_String;

   Values : constant Value_Array :=
     (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
   Symbols : constant Symbol_Array :=
     (To_Unbounded_String ("M"), To_Unbounded_String ("CM"),
      To_Unbounded_String ("D"), To_Unbounded_String ("CD"),
      To_Unbounded_String ("C"), To_Unbounded_String ("XC"),
      To_Unbounded_String ("L"), To_Unbounded_String ("XL"),
      To_Unbounded_String ("X"), To_Unbounded_String ("IX"),
      To_Unbounded_String ("V"), To_Unbounded_String ("IV"),
      To_Unbounded_String ("I"));

   N : Integer := 1994;
   Result : Unbounded_String := To_Unbounded_String ("");
begin
   for I in Values'Range loop
      while N >= Values (I) loop
         Result := Result & Symbols (I);
         N := N - Values (I);
      end loop;
   end loop;
   Put_Line (To_String (Result));
end Roman_Numerals;
