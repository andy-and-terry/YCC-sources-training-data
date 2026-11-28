with Ada.Text_IO; use Ada.Text_IO;

procedure Armstrong_Numbers is
   function Is_Armstrong (N : Positive) return Boolean is
      Len : Natural := 0;
      M   : Natural := N;
      Sum : Natural := 0;
   begin
      while M > 0 loop
         Len := Len + 1;
         M := M / 10;
      end loop;
      M := N;
      while M > 0 loop
         Sum := Sum + (M mod 10) ** Len;
         M := M / 10;
      end loop;
      return Sum = N;
   end Is_Armstrong;
begin
   for N in 1 .. 999 loop
      if Is_Armstrong (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;  --  1 .. 9 153 370 371 407
end Armstrong_Numbers;
