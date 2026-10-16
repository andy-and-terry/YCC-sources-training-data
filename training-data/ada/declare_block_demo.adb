with Ada.Text_IO; use Ada.Text_IO;

procedure Declare_Block_Demo is
   N : constant Integer := 5;
begin
   Put_Line ("Before block");
   declare
      Squares : array (1 .. N) of Integer;
   begin
      for I in Squares'Range loop
         Squares (I) := I * I;
      end loop;
      for S of Squares loop
         Put (S'Image);
      end loop;
      New_Line;
   end;
   Put_Line ("After block");
end Declare_Block_Demo;
