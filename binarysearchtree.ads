
package BinarySearchTree is
	type String10 is new String(1..10);  -- You may use an enumeration type if desired.
	
	
	type BinarySearchTreePoint is private;  -- or type BinarySearchTreePoint is private;  

	
   
   
	procedure InsertBinarySearchTree(Root:  in out BinarySearchTreePoint;
				          custName: in String10; custPhone: String10 );

	
	procedure FindCustomerIterative(Root: in BinarySearchTreePoint; 
				          CustomerName:  in String10;
				          CustomerPoint:  out BinarySearchTreePoint);
	
   
   
	procedure FindCustomerRecursive(Root: in BinarySearchTreePoint; 
				          CustomerName:  in String10;
				          CustomerPoint:  out BinarySearchTreePoint);
	 
-- function or iterater (no recursion).
	function InOrderSuccessor(TreePoint: in out BinarySearchTreePoint) 
                           return BinarySearchTreePoint;
   function InOrderPredecessor(TreePoint: in BinarySearchTreePoint)
                               return BinarySearchTreePoint;
   

	-- Access functions to return customer names and phone numbers.
	function CustomerName(TreePoint: in BinarySearchTreePoint) return String10;
	function CustomerPhone(TreePoint: in BinarySearchTreePoint) return String10;
	 
      -- Pre/Post order traversal of a tree using using a stack allocated explicitly by the programmer!
	procedure PreOrderTraversalIterative(TreePoint: in BinarySearchTreePoint);
   procedure PostOrderTraversalIterative(TreePoint: in BinarySearchTreePoint); 
   procedure InOrderTraversalIterative(TreePoint: in BinarySearchTreePoint);

private
	type Customer is 
		record
			Name:  String10;  -- use enumeration type if desired.
			PhoneNumber: String10;
		end record;
	
	type Node;
	type BinarySearchTreePoint is access Node;
	type Node is 
		record
			Llink, Rlink:  BinarySearchTreePoint;
			Ltag, Rtag:  Boolean;  -- True indicates pointer to lower level, False a thread.
			Info:  Customer;
		end record;
end BinarySearchTree;
