with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Function_Formal_Subprogram is
   generic
      type Element is private;
      type Index is range <>;
      type Vector is array (Index) of Element;
      with function "+" (L, R : Element) return Element;
      Zero : Element;
   function Fold (V : Vector) return Element;

   function Fold (V : Vector) return Element is
      Acc : Element := Zero;
   begin
      for X of V loop
         Acc := Acc + X;
      end loop;
      return Acc;
   end Fold;

   type Idx is range 1 .. 4;
   type Int_Vec is array (Idx) of Integer;
   type Flt_Vec is array (Idx) of Float;

   function Sum_Int is new Fold (Integer, Idx, Int_Vec, "+", 0);
   function Sum_Flt is new Fold (Float, Idx, Flt_Vec, "+", 0.0);
begin
   Put_Line (Sum_Int ((1, 2, 3, 4))'Image);
   Put_Line (Sum_Flt ((0.5, 0.25, 0.25, 1.0))'Image);
end Generic_Function_Formal_Subprogram;
