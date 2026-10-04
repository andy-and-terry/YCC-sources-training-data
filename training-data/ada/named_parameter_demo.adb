with Ada.Text_IO; use Ada.Text_IO;

procedure Named_Parameter_Demo is
   function Volume (Length : Natural; Width : Natural := 1; Height : Natural := 1)
     return Natural is
   begin
      return Length * Width * Height;
   end Volume;
begin
   Put_Line ("Positional:" & Natural'Image (Volume (2, 3, 4)));
   Put_Line ("Named:     " & Natural'Image (Volume (Height => 4, Length => 2, Width => 3)));
   Put_Line ("Defaults:  " & Natural'Image (Volume (5)));
   Put_Line ("Mixed:     " & Natural'Image (Volume (5, Height => 2)));
end Named_Parameter_Demo;
