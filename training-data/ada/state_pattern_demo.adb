with Ada.Text_IO; use Ada.Text_IO;

procedure State_Pattern_Demo is
   type State is interface;
   type State_Access is access all State'Class;

   function Name (S : State) return String is abstract;
   function Next (S : State) return State_Access is abstract;

   -- Each concrete state knows only its own name and which state
   -- follows it; the traffic light itself never branches on a mode flag.
   type Red_State is new State with null record;
   type Green_State is new State with null record;
   type Yellow_State is new State with null record;

   overriding function Name (S : Red_State) return String is ("Red");
   overriding function Name (S : Green_State) return String is ("Green");
   overriding function Name (S : Yellow_State) return String is ("Yellow");

   overriding function Next (S : Red_State) return State_Access is
     (new Green_State);
   overriding function Next (S : Green_State) return State_Access is
     (new Yellow_State);
   overriding function Next (S : Yellow_State) return State_Access is
     (new Red_State);

   Current : State_Access := new Red_State;
begin
   for I in 1 .. 4 loop
      Put_Line (Current.Name);
      Current := Current.Next;
   end loop;
end State_Pattern_Demo;
