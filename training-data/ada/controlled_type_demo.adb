with Ada.Text_IO; use Ada.Text_IO;
with Ada.Finalization; use Ada.Finalization;

procedure Controlled_Type_Demo is
   type Resource is new Controlled with null record;

   overriding procedure Initialize (R : in out Resource) is
   begin
      Put_Line ("Acquiring resource");
   end Initialize;

   overriding procedure Finalize (R : in out Resource) is
   begin
      Put_Line ("Releasing resource");
   end Finalize;

   procedure Use_Resource is
      R : Resource;
   begin
      Put_Line ("Using resource");
   end Use_Resource;
begin
   Put_Line ("Before block");
   Use_Resource;
   Put_Line ("After block");
end Controlled_Type_Demo;
