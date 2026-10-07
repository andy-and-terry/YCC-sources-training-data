with Ada.Text_IO; use Ada.Text_IO;

procedure Armstrong_Number is
   function Is_Armstrong (N : Natural) return Boolean is
      Digits_Count : Natural := 0;
      Temp         : Natural := N;
      Sum          : Natural := 0;
   begin
      while Temp > 0 loop
         Digits_Count := Digits_Count + 1;
         Temp := Temp / 10;
      end loop;

      Temp := N;
      while Temp > 0 loop
         declare
            D : constant Natural := Temp mod 10;
            P : Natural := 1;
         begin
            for I in 1 .. Digits_Count loop
               P := P * D;
            end loop;
            Sum := Sum + P;
         end;
         Temp := Temp / 10;
      end loop;
      return Sum = N;
   end Is_Armstrong;
begin
   for N in Natural range 1 .. 1000 loop
      if Is_Armstrong (N) then
         Put (N'Image);
      end if;
   end loop;
   New_Line;
end Armstrong_Number;
