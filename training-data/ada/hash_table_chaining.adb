with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Hash_Table_Chaining is
   Bucket_Count : constant := 8;

   type Entry_Record;
   type Entry_Access is access Entry_Record;
   type Entry_Record is record
      Key   : Unbounded_String;
      Value : Integer;
      Next  : Entry_Access;
   end record;

   type Bucket_Array is array (0 .. Bucket_Count - 1) of Entry_Access;
   Buckets : Bucket_Array := (others => null);

   function Hash (Key : String) return Natural is
      Total : Natural := 0;
   begin
      for Ch of Key loop
         Total := Total + Character'Pos (Ch);
      end loop;
      return Total mod Bucket_Count;
   end Hash;

   procedure Put (Key : String; Value : Integer) is
      Idx : constant Natural := Hash (Key);
      Cur : Entry_Access := Buckets (Idx);
   begin
      while Cur /= null loop
         if To_String (Cur.Key) = Key then
            Cur.Value := Value;
            return;
         end if;
         Cur := Cur.Next;
      end loop;
      Buckets (Idx) := new Entry_Record'(Key   => To_Unbounded_String (Key),
                                          Value => Value,
                                          Next  => Buckets (Idx));
   end Put;

   function Get (Key : String; Found : out Boolean) return Integer is
      Idx : constant Natural := Hash (Key);
      Cur : Entry_Access := Buckets (Idx);
   begin
      while Cur /= null loop
         if To_String (Cur.Key) = Key then
            Found := True;
            return Cur.Value;
         end if;
         Cur := Cur.Next;
      end loop;
      Found := False;
      return 0;
   end Get;

   Found : Boolean;
   Value : Integer;
begin
   Put ("apple", 3);
   Put ("banana", 7);
   Put ("cherry", 12);
   Put ("apple", 5);

   Value := Get ("apple", Found);
   if Found then
      Put_Line ("apple -> " & Value'Image);
   end if;

   Value := Get ("banana", Found);
   if Found then
      Put_Line ("banana -> " & Value'Image);
   end if;

   Value := Get ("durian", Found);
   if not Found then
      Put_Line ("durian -> not found");
   end if;
end Hash_Table_Chaining;
