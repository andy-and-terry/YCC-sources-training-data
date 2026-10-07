with Ada.Text_IO; use Ada.Text_IO;

procedure Builder_Pattern_Demo is
   type Sandwich is record
      Bread   : String (1 .. 8) := "        ";
      Filling : String (1 .. 8) := "        ";
      Toasted : Boolean := False;
   end record;

   type Sandwich_Builder is record
      Product : Sandwich;
   end record;

   procedure With_Bread (B : in out Sandwich_Builder; Value : String) is
   begin
      B.Product.Bread := Value & (Value'Length + 1 .. 8 => ' ');
   end With_Bread;

   procedure With_Filling (B : in out Sandwich_Builder; Value : String) is
   begin
      B.Product.Filling := Value & (Value'Length + 1 .. 8 => ' ');
   end With_Filling;

   procedure Toast (B : in out Sandwich_Builder) is
   begin
      B.Product.Toasted := True;
   end Toast;

   function Build (B : Sandwich_Builder) return Sandwich is (B.Product);

   Builder : Sandwich_Builder;
   Result  : Sandwich;
begin
   With_Bread (Builder, "Rye");
   With_Filling (Builder, "Turkey");
   Toast (Builder);
   Result := Build (Builder);

   Put_Line ("Bread: " & Result.Bread);
   Put_Line ("Filling: " & Result.Filling);
   Put_Line ("Toasted: " & Result.Toasted'Image);
end Builder_Pattern_Demo;
