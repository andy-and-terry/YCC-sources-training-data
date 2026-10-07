with Ada.Text_IO; use Ada.Text_IO;

procedure Cycle_Detection is
   -- Directed graph as an adjacency matrix; detect a cycle via DFS with
   -- a "currently on the recursion stack" marker in addition to Visited.
   V : constant := 4;
   type Adjacency is array (0 .. V - 1, 0 .. V - 1) of Boolean;
   type Bool_Array is array (0 .. V - 1) of Boolean;

   Graph : constant Adjacency :=
     ((False, True,  False, False),
      (False, False, True,  False),
      (False, False, False, True),
      (True,  False, False, False));  -- 3 -> 0 closes a cycle

   Visited  : Bool_Array := (others => False);
   On_Stack : Bool_Array := (others => False);

   function Has_Cycle (U : Natural) return Boolean is
   begin
      Visited (U) := True;
      On_Stack (U) := True;
      for W in 0 .. V - 1 loop
         if Graph (U, W) then
            if not Visited (W) then
               if Has_Cycle (W) then
                  return True;
               end if;
            elsif On_Stack (W) then
               return True;
            end if;
         end if;
      end loop;
      On_Stack (U) := False;
      return False;
   end Has_Cycle;

   Found : Boolean := False;
begin
   for U in 0 .. V - 1 loop
      if not Visited (U) and then Has_Cycle (U) then
         Found := True;
      end if;
   end loop;
   Put_Line ("Cycle found: " & Found'Image);
end Cycle_Detection;
