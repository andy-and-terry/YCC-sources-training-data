with Ada.Text_IO; use Ada.Text_IO;

--  n is triangular iff 8n + 1 is a perfect square.
procedure Triangular_Check is
   function Is_Triangular (N : Natural) return Boolean is
      S : constant Natural := 8 * N + 1;
      R : Natural := 0;
   begin
      while (R + 1) * (R + 1) <= S loop
         R := R + 1;
      end loop;
      return R * R = S;
   end Is_Triangular;
begin
   for N in 0 .. 20 loop
      if Is_Triangular (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Triangular_Check;
