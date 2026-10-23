with Ada.Sequential_IO;
with Ada.Text_IO;

procedure Sequential_IO_Integers is
   package Int_IO is new Ada.Sequential_IO (Integer);

   File  : Int_IO.File_Type;
   Value : Integer;
   Total : Integer := 0;
begin
   Int_IO.Create (File, Int_IO.Out_File, "squares.tmp");
   for I in 1 .. 5 loop
      Int_IO.Write (File, I * I);
   end loop;

   Int_IO.Reset (File, Int_IO.In_File);
   while not Int_IO.End_Of_File (File) loop
      Int_IO.Read (File, Value);
      Total := Total + Value;
   end loop;

   Int_IO.Delete (File);
   Ada.Text_IO.Put_Line ("sum of squares:" & Integer'Image (Total));
end Sequential_IO_Integers;
