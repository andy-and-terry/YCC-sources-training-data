with Ada.Text_IO; use Ada.Text_IO;

procedure Interface_Types_Multiple is
   type Printable is interface;
   procedure Print (P : Printable) is abstract;

   type Comparable is interface;
   function Less (L, R : Comparable) return Boolean is abstract;

   type Version is new Printable and Comparable with record
      Major, Minor : Natural;
   end record;

   overriding procedure Print (V : Version) is
   begin
      Put_Line (V.Major'Image & "." & V.Minor'Image);
   end Print;

   overriding function Less (L, R : Version) return Boolean is
     (L.Major < R.Major or else (L.Major = R.Major and then L.Minor < R.Minor));

   A : constant Version := (1, 4);
   B : constant Version := (2, 0);
begin
   Print (A);
   Print (B);
   Put_Line (Boolean'Image (Less (A, B)));
end Interface_Types_Multiple;
