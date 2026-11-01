with Ada.Text_IO; use Ada.Text_IO;

--  Greedy sequence whose pairwise sums are all distinct.
procedure Mian_Chowla_Sequence is
   Seq   : array (1 .. 8) of Natural;
   Used  : array (0 .. 255) of Boolean := (others => False);
   Fresh : array (0 .. 255) of Boolean;
   N     : Natural := 0;
   Cand  : Natural := 1;
   Ok    : Boolean;
   S     : Natural;
begin
   while N < 8 loop
      Fresh := (others => False);
      Ok := True;
      Seq (N + 1) := Cand;
      for I in 1 .. N + 1 loop
         S := Seq (I) + Cand;
         if Used (S) or else Fresh (S) then
            Ok := False;
         else
            Fresh (S) := True;
         end if;
      end loop;
      if Ok then
         for K in Fresh'Range loop
            if Fresh (K) then
               Used (K) := True;
            end if;
         end loop;
         N := N + 1;
      end if;
      Cand := Cand + 1;
   end loop;
   for V of Seq loop
      Put (Integer'Image (V));
   end loop;
   New_Line;
end Mian_Chowla_Sequence;
