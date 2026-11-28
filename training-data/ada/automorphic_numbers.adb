with Ada.Text_IO; use Ada.Text_IO;

procedure Automorphic_Numbers is
   function Is_Automorphic (N : Natural) return Boolean is
      Modulus : Long_Long_Integer := 1;
      M       : Natural := N;
   begin
      while M > 0 loop
         Modulus := Modulus * 10;
         M := M / 10;
      end loop;
      return (Long_Long_Integer (N) ** 2) mod Modulus = Long_Long_Integer (N);
   end Is_Automorphic;
begin
   for N in 1 .. 999 loop
      if Is_Automorphic (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;  --  1 5 6 25 76 376 625
end Automorphic_Numbers;
