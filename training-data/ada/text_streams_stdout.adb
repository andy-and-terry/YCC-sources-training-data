with Ada.Text_IO;
with Ada.Text_IO.Text_Streams;

--  Use the standard output as a Stream so stream attributes ('Write,
--  'Output) can send data to the console.
procedure Text_Streams_Stdout is
   use Ada.Text_IO;

   type Point is record
      X, Y : Integer;
   end record;

   Out_Stream : constant Text_Streams.Stream_Access :=
     Text_Streams.Stream (Current_Output);
   Msg : constant String := "Hello via stream" & ASCII.LF;
   P   : constant Point := (X => 3, Y => 4);
begin
   --  String'Write emits the characters only, no bounds
   String'Write (Out_Stream, Msg);

   Put_Line ("Point is (" & Integer'Image (P.X) & ","
             & Integer'Image (P.Y) & " )");

   --  Writing each component's text form via the stream
   String'Write (Out_Stream, "X digit: "
                 & Character'Val (Character'Pos ('0') + P.X) & ASCII.LF);
end Text_Streams_Stdout;
