with Ada.Text_IO; use Ada.Text_IO;

procedure Template_Method_Pattern_Demo is
   type Beverage_Maker is interface;
   procedure Boil_Water (M : Beverage_Maker) is null;
   procedure Brew (M : Beverage_Maker) is abstract;
   procedure Add_Condiments (M : Beverage_Maker) is abstract;

   procedure Prepare (M : Beverage_Maker'Class) is
   begin
      Put_Line ("Boiling water");
      Boil_Water (M);
      Brew (M);
      Add_Condiments (M);
   end Prepare;

   type Tea_Maker is new Beverage_Maker with null record;
   overriding procedure Brew (M : Tea_Maker) is
   begin
      Put_Line ("Steeping tea");
   end Brew;
   overriding procedure Add_Condiments (M : Tea_Maker) is
   begin
      Put_Line ("Adding lemon");
   end Add_Condiments;

   type Coffee_Maker is new Beverage_Maker with null record;
   overriding procedure Brew (M : Coffee_Maker) is
   begin
      Put_Line ("Dripping coffee through filter");
   end Brew;
   overriding procedure Add_Condiments (M : Coffee_Maker) is
   begin
      Put_Line ("Adding sugar and milk");
   end Add_Condiments;

   Tea    : constant Tea_Maker := (null record);
   Coffee : constant Coffee_Maker := (null record);
begin
   Prepare (Tea);
   Prepare (Coffee);
end Template_Method_Pattern_Demo;
