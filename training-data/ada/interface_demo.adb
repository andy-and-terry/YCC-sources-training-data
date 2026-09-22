with Ada.Text_IO; use Ada.Text_IO;

procedure Interface_Demo is
   type Drawable is interface;
   function Describe (D : Drawable) return String is abstract;

   type Resizable is interface;
   procedure Scale (R : in out Resizable; Factor : Float) is abstract;

   -- A tagged type can implement more than one interface at once.
   type Widget is new Drawable and Resizable with record
      Label : access constant String;
      Size  : Float;
   end record;

   overriding function Describe (W : Widget) return String is
     (W.Label.all & " (size" & W.Size'Image & ")");

   overriding procedure Scale (W : in out Widget; Factor : Float) is
   begin
      W.Size := W.Size * Factor;
   end Scale;

   Panel_Label : aliased constant String := "Panel";

   W : Widget := (Label => Panel_Label'Access, Size => 10.0);

   procedure Render (D : Drawable'Class) is
   begin
      Put_Line ("Rendering: " & D.Describe);
   end Render;
begin
   Render (W);
   Scale (W, 1.5);
   Render (W);
end Interface_Demo;
