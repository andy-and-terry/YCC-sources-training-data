with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Streams;      use Ada.Streams;
with Ada.Streams.Stream_IO;

procedure Stream_Attributes_Demo is
   type Point is record
      X, Y : Integer;
   end record;

   File : Ada.Streams.Stream_IO.File_Type;
   P    : constant Point := (X => 3, Y => 4);
   Q    : Point;
begin
   Ada.Streams.Stream_IO.Create (File, Ada.Streams.Stream_IO.Out_File, "point.bin");
   Point'Write (Ada.Streams.Stream_IO.Stream (File), P);
   Ada.Streams.Stream_IO.Close (File);

   Ada.Streams.Stream_IO.Open (File, Ada.Streams.Stream_IO.In_File, "point.bin");
   Point'Read (Ada.Streams.Stream_IO.Stream (File), Q);
   Ada.Streams.Stream_IO.Delete (File);

   Put_Line ("Read back:" & Q.X'Image & "," & Q.Y'Image);
end Stream_Attributes_Demo;
