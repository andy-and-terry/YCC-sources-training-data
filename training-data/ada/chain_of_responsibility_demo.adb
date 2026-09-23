with Ada.Text_IO; use Ada.Text_IO;

procedure Chain_Of_Responsibility_Demo is
   type Approver is interface;
   type Approver_Access is access all Approver'Class;

   function Limit (A : Approver) return Float is abstract;
   function Title (A : Approver) return String is abstract;

   type Base_Approver is abstract new Approver with record
      Next : Approver_Access := null;
   end record;

   -- Each link only decides whether it can approve; if not, it passes
   -- the request further down the chain instead of the caller having
   -- to know the whole hierarchy.
   procedure Approve (A : Base_Approver'Class; Amount : Float) is
   begin
      if Amount <= A.Limit then
         Put_Line (A.Title & " approved" & Amount'Image);
      elsif A.Next /= null then
         Approve (A.Next.all, Amount);
      else
         Put_Line ("No approver available for" & Amount'Image);
      end if;
   end Approve;

   type Manager is new Base_Approver with null record;
   overriding function Limit (A : Manager) return Float is (1_000.0);
   overriding function Title (A : Manager) return String is ("Manager");

   type Director is new Base_Approver with null record;
   overriding function Limit (A : Director) return Float is (10_000.0);
   overriding function Title (A : Director) return String is ("Director");

   type VP is new Base_Approver with null record;
   overriding function Limit (A : VP) return Float is (100_000.0);
   overriding function Title (A : VP) return String is ("VP");

   M : aliased Manager;
   D : aliased Director;
   V : aliased VP;
begin
   D.Next := V'Access;
   M.Next := D'Access;

   Approve (M, 500.0);
   Approve (M, 5_000.0);
   Approve (M, 50_000.0);
   Approve (M, 500_000.0);
end Chain_Of_Responsibility_Demo;
