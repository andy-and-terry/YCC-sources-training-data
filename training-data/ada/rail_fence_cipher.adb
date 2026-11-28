with Ada.Text_IO; use Ada.Text_IO;

procedure Rail_Fence_Cipher is
   Text : constant String := "WEAREDISCOVERED";
   K : constant := 3;
   Cycle : constant := 2 * (K - 1);

   function Rail (I : Natural) return Natural is
      R : constant Natural := I mod Cycle;
   begin
      return (if R < K then R else Cycle - R);
   end Rail;
begin
   for R in 0 .. K - 1 loop
      for I in Text'Range loop
         if Rail (I - Text'First) = R then
            Put (Text (I));
         end if;
      end loop;
   end loop;
   New_Line;
end Rail_Fence_Cipher;
