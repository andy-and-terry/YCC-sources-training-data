with Ada.Text_IO;  use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

procedure Interfaces_C_Import_Strlen is
   --  Bind directly to the C library function size_t strlen (const char *).
   function C_Strlen (S : Interfaces.C.Strings.chars_ptr) return size_t;
   pragma Import (C, C_Strlen, "strlen");

   --  abs from <stdlib.h> using the C int type.
   function C_Abs (N : int) return int;
   pragma Import (C, C_Abs, "abs");

   Text : Interfaces.C.Strings.chars_ptr :=
     Interfaces.C.Strings.New_String ("interoperability");
begin
   Put_Line ("strlen =" & size_t'Image (C_Strlen (Text)));
   Put_Line ("abs(-42) =" & int'Image (C_Abs (-42)));

   --  Convert between Ada String and C char_array.
   declare
      Ada_Text : constant String := "Ada";
      C_Text   : constant char_array := To_C (Ada_Text);
   begin
      Put_Line ("C array length including NUL:" & size_t'Image (C_Text'Length));
      Put_Line ("Back to Ada: " & To_Ada (C_Text));
   end;

   Interfaces.C.Strings.Free (Text);
end Interfaces_C_Import_Strlen;
