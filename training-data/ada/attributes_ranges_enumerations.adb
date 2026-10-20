with Ada.Text_IO; use Ada.Text_IO;

procedure Attributes_Ranges_Enumerations is
   type Day is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
   subtype Weekday is Day range Mon .. Fri;
   type Percent is range 0 .. 100;
   type Small is mod 8;
   type Money is delta 0.01 range 0.0 .. 1000.0;
begin
   Put_Line (Day'Image (Day'First) & " " & Day'Image (Day'Last) & Integer'Image (Day'Pos (Wed)));
   Put_Line (Day'Image (Day'Succ (Mon)) & " " & Day'Image (Day'Pred (Sun)) & " " & Day'Image (Day'Val (3)));
   Put_Line (Integer'Image (Weekday'Pos (Weekday'Last)) & Boolean'Image (Sat in Weekday));
   Put_Line (Percent'Image (Percent'Last) & Integer'Image (Percent'Size));
   Put_Line (Small'Image (Small'Last + 1) & Small'Image (Small (7) + 3));
   Put_Line (Money'Image (12.34) & Integer'Image (Money'Size));
   Put_Line (Integer'Image (Integer'Max (3, 9)) & Integer'Image (Integer'Min (3, 9)) & Integer'Image (Integer'Last / 2**28));
   Put_Line (Float'Image (Float'Floor (2.7)) & Float'Image (Float'Rounding (2.5)) & Integer'Image (Integer (2.5)));
end Attributes_Ranges_Enumerations;
