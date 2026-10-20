with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Text_IO_Files_Formatting is
   F : File_Type;
   N : Integer;
begin
   Create (F, Out_File, "ada_demo.txt");
   Put_Line (F, "first line");
   Put (F, 42); New_Line (F);
   Put (F, 3.5, Fore => 2, Aft => 2, Exp => 0); New_Line (F);
   Close (F);
   Open (F, In_File, "ada_demo.txt");
   Put_Line ("read: " & Get_Line (F));
   Get (F, N); Put_Line ("int:" & Integer'Image (N));
   Skip_Line (F);
   Put_Line ("end of file: " & Boolean'Image (End_Of_File (F)));
   Delete (F);
   Put (7, Width => 5); Put (-3, Width => 4); New_Line;
   Put (2.71828, Fore => 1, Aft => 3, Exp => 0); New_Line;
   Put (12345.678, Fore => 1, Aft => 1, Exp => 3); New_Line;
end Text_IO_Files_Formatting;
