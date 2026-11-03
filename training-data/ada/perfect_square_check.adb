with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Perfect_Square_Check is
   function Is_Perfect_Square (N : Integer) return Boolean is
      R : Integer;
   begin
      if N < 0 then
         return False;
      end if;
      R := Integer (Sqrt (Float (N)));
      return R * R = N;
   end Is_Perfect_Square;
begin
   for N in 0 .. 29 loop
      if Is_Perfect_Square (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Perfect_Square_Check;
