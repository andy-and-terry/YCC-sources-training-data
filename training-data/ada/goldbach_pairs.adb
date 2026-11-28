with Ada.Text_IO; use Ada.Text_IO;

procedure Goldbach_Pairs is
   function Is_Prime (N : Integer) return Boolean is
   begin
      if N < 2 then return False; end if;
      for D in 2 .. N - 1 loop
         exit when D * D > N;
         if N mod D = 0 then return False; end if;
      end loop;
      return True;
   end Is_Prime;
   N : constant Integer := 28;
begin
   for P in 2 .. N / 2 loop
      if Is_Prime (P) and then Is_Prime (N - P) then
         Put_Line (Integer'Image (P) & " +" & Integer'Image (N - P));
      end if;
   end loop;
end Goldbach_Pairs;
