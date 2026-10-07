with Ada.Text_IO; use Ada.Text_IO;

procedure Limited_Private_Demo is
   package Counters is
      type Counter is limited private;
      procedure Reset (C : out Counter);
      procedure Increment (C : in out Counter; By : Positive := 1);
      function Value (C : Counter) return Natural;
   private
      type Counter is limited record
         Count : Natural := 0;
      end record;
   end Counters;

   package body Counters is
      procedure Reset (C : out Counter) is
      begin
         C.Count := 0;
      end Reset;

      procedure Increment (C : in out Counter; By : Positive := 1) is
      begin
         C.Count := C.Count + By;
      end Increment;

      function Value (C : Counter) return Natural is
      begin
         return C.Count;
      end Value;
   end Counters;

   use Counters;
   A : Counter;
   B : Counter;
begin
   Increment (A);
   Increment (A, 5);
   Increment (B, 2);
   --  A := B;  -- illegal: limited types cannot be copied
   Put_Line ("A =" & Value (A)'Image);
   Put_Line ("B =" & Value (B)'Image);
   Reset (A);
   Put_Line ("A after reset =" & Value (A)'Image);
end Limited_Private_Demo;
