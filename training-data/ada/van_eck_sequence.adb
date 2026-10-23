with Ada.Text_IO; use Ada.Text_IO;

--  Van Eck's sequence: next term is the distance to the previous occurrence
--  of the last term, or 0 if the last term has not appeared before
procedure Van_Eck_Sequence is
   Count : constant := 20;
   Seq   : array (0 .. Count - 1) of Integer := (others => 0);
begin
   for N in 1 .. Count - 1 loop
      for K in reverse 0 .. N - 2 loop
         if Seq (K) = Seq (N - 1) then
            Seq (N) := N - 1 - K;
            exit;
         end if;
      end loop;
   end loop;
   for N in Seq'Range loop
      Put (Integer'Image (Seq (N)));
   end loop;
   New_Line;
end Van_Eck_Sequence;
