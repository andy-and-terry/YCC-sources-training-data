with Ada.Text_IO; use Ada.Text_IO;

procedure Trie is
   type Trie_Node;
   type Trie_Node_Access is access Trie_Node;
   type Child_Array is array (Character range 'a' .. 'z') of Trie_Node_Access;
   type Trie_Node is record
      Children : Child_Array := (others => null);
      Is_End   : Boolean := False;
   end record;

   Root : constant Trie_Node_Access := new Trie_Node;

   procedure Insert (Word : String) is
      Current : Trie_Node_Access := Root;
   begin
      for Ch of Word loop
         if Current.Children (Ch) = null then
            Current.Children (Ch) := new Trie_Node;
         end if;
         Current := Current.Children (Ch);
      end loop;
      Current.Is_End := True;
   end Insert;

   function Contains (Word : String) return Boolean is
      Current : Trie_Node_Access := Root;
   begin
      for Ch of Word loop
         if Current.Children (Ch) = null then
            return False;
         end if;
         Current := Current.Children (Ch);
      end loop;
      return Current.Is_End;
   end Contains;
begin
   Insert ("cat");
   Insert ("car");
   Insert ("card");
   Insert ("dog");

   Put_Line ("cat:  " & Contains ("cat")'Image);
   Put_Line ("ca:   " & Contains ("ca")'Image);
   Put_Line ("card: " & Contains ("card")'Image);
   Put_Line ("dogs: " & Contains ("dogs")'Image);
end Trie;
