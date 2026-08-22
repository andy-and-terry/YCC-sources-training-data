with Ada.Text_IO; use Ada.Text_IO;

procedure Power_Function is
   function Power (Base : Integer; Exp : Natural) return Long_Long_Integer is
      Result : Long_Long_Integer := 1;
   begin
      for I in 1 .. Exp loop
         Result := Result * Long_Long_Integer (Base);
      end loop;
      return Result;
   end Power;
begin
   Put_Line (Power (2, 10)'Image);
   Put_Line (Power (3, 5)'Image);
end Power_Function;
