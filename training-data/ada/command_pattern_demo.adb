with Ada.Text_IO; use Ada.Text_IO;

procedure Command_Pattern_Demo is
   type Command is interface;
   procedure Execute (C : Command) is abstract;

   type Light_State is (On, Off);
   State : Light_State := Off;

   type Light_On_Command is new Command with null record;
   overriding procedure Execute (C : Light_On_Command) is
   begin
      State := On;
      Put_Line ("Light turned ON");
   end Execute;

   type Light_Off_Command is new Command with null record;
   overriding procedure Execute (C : Light_Off_Command) is
   begin
      State := Off;
      Put_Line ("Light turned OFF");
   end Execute;

   type Command_Array is array (Positive range <>) of access Command'Class;

   On_Cmd  : aliased Light_On_Command;
   Off_Cmd : aliased Light_Off_Command;
   History : constant Command_Array := (On_Cmd'Access, Off_Cmd'Access, On_Cmd'Access);
begin
   for Cmd of History loop
      Execute (Cmd.all);
   end loop;
end Command_Pattern_Demo;
