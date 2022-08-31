with Ada.Text_IO; use Ada.Text_IO;
with BinarySearchTree; use BinarySearchTree;
procedure Lab4 is
   
   Root : BinarySearchTreePoint;
   CustomerPoint : BinarySearchTreePoint;
   SearchPoint : BinarySearchTreePoint;
   
   
begin
   --Instruction 1
   InsertBinarySearchTree(Root, "Hayden    ", "295-1492  ");
   InsertBinarySearchTree(Root, "Garcia    ", "291-1864  ");
   InsertBinarySearchTree(Root, "Medina    ", "293-6122  ");
   InsertBinarySearchTree(Root, "Perez     ", "295-1882  ");
   InsertBinarySearchTree(Root, "Barton    ", "291-7890  ");
   InsertBinarySearchTree(Root, "Lee       ", "294-8075  ");
   InsertBinarySearchTree(Root, "McCoy     ", "584-3622  ");
   
   --Instrcution 2
   FindCustomerIterative(Root          => Root,
                         CustomerName  => "Perez     ",
                         CustomerPoint => CustomerPoint);
   --Instruction 3
   FindCustomerRecursive(Root          => Root,
                         CustomerName  => "Perez     ",
                         CustomerPoint => CustomerPoint);
   --instrcution 4
   FindCustomerIterative(Root          => Root,
                         CustomerName  => "Reasons   ",
                         CustomerPoint => CustomerPoint);
   -- inStruction 5
   FindCustomerRecursive(Root          => Root,
                         CustomerName  => "Reasons   ",
                         CustomerPoint => CustomerPoint);
   -- instruction 6
   New_Line;
   FindCustomerIterative(Root          => Root,
                         CustomerName  => "Lee       ",
                         CustomerPoint => SearchPoint);
   put("In Order Traversal from Lee"); New_Line;
   InOrderTraversalIterative(TreePoint => SearchPoint);
   -- instruction 7
   InsertBinarySearchTree(Root, "Afroze    ", "294-1568  ");
   InsertBinarySearchTree(Root, "Spruell   ", "294-1882  ");
   InsertBinarySearchTree(Root, "Harlow    ", "295-6622  ");
   
   -- instrcution 8
   New_Line;
   Put("InOrder Traversal");
   New_Line;
   InOrderTraversalIterative(Root);
   
   --instruction 9
   New_Line;
   Put("PreOrder Traversal");
   New_Line;
   PreOrderTraversalIterative(Root);
  
   -- instruction 10
   New_Line;
   Put("PostOrder Traversal");
   New_Line;
   PostOrderTraversalIterative(Root);
  
    
end Lab4;
