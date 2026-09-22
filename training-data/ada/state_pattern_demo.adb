with Ada.Text_IO; use Ada.Text_IO;

procedure State_Pattern_Demo is
   type Order_State is abstract tagged null record;
   type Order_State_Access is access all Order_State'Class;

   function Next (State : Order_State) return Order_State_Access is abstract;
   function Label (State : Order_State) return String is abstract;

   type Pending_State   is new Order_State with null record;
   type Shipped_State   is new Order_State with null record;
   type Delivered_State is new Order_State with null record;

   overriding function Label (State : Pending_State) return String is ("Pending");
   overriding function Label (State : Shipped_State) return String is ("Shipped");
   overriding function Label (State : Delivered_State) return String is ("Delivered");

   overriding function Next (State : Pending_State) return Order_State_Access is
   begin
      return new Shipped_State;
   end Next;

   overriding function Next (State : Shipped_State) return Order_State_Access is
   begin
      return new Delivered_State;
   end Next;

   overriding function Next (State : Delivered_State) return Order_State_Access is
   begin
      return new Delivered_State;
   end Next;

   Current : Order_State_Access := new Pending_State;
begin
   for I in 1 .. 3 loop
      Put_Line (Label (Current.all));
      Current := Next (Current.all);
   end loop;
   Put_Line (Label (Current.all));
end State_Pattern_Demo;
