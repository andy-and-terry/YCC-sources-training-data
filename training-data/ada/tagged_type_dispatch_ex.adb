with Ada.Text_IO; use Ada.Text_IO;

procedure Tagged_Type_Dispatch_Ex is
   package P is
      type Animal is tagged null record;
      procedure Speak (A : Animal);
      type Dog is new Animal with null record;
      overriding procedure Speak (D : Dog);
   end P;
   package body P is
      procedure Speak (A : Animal) is begin Put_Line ("..."); end Speak;
      procedure Speak (D : Dog) is begin Put_Line ("Woof"); end Speak;
   end P;
   use P;
   A : Animal'Class := Dog'(null record);
begin
   Speak (A);
end Tagged_Type_Dispatch_Ex;
