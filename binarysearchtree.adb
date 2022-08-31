with Ada.Text_IO; use Ada.Text_IO;
package body BinarySearchTree is
   
   
   procedure AllocateNode( q: in out BinarySearchTreePoint; cust : in Customer)is
   begin 
      q := new Node;
      q.info := cust;
      q.Llink := null;
      q.RLink := null;
      q.Ltag :=false;
      q.Rtag := false;
   end;
   
   procedure InsertNode(p,q: in out BinarySearchTreePoint; cust : in Customer) is
   begin
      if cust.Name < p.info.Name then
         p.Llink := q;
         p.Ltag := true;  
         
      else
         p.Rlink := q;
         p.Rtag :=true;
         
      end if;
         
    
   end;
         
        
   procedure InsertBinarySearchTree(Root:  in out BinarySearchTreePoint;
                                    custName: in String10; custPhone: String10 )
   is
      cust : Customer;
      q : BinarySearchTreePoint;
      p : BinarySearchTreePoint;
   begin
      cust.Name := custName;
      cust.PhoneNumber := custPhone;
      
      
      
      if(Root = null)then
         AllocateNode(q,cust);
         Root := q;
      else 
         p := Root;
         Loop
            if cust.Name < p.info.Name then
               if P.Llink /= null then
                  P := P.Llink;
                  
               else
                  AllocateNode(q, cust);
                  InsertNode(p, q, cust);
                  exit;
               end if;
            elsif cust.Name > p.info.Name then
               if P.Rlink /= null then
                  P:=P.Rlink;
               else
                  AllocateNode(q,cust);
                  InsertNode(p,q,cust);
                  exit;
               end if;
            else
               AllocateNode(q,cust);
               InsertNode(p,q,cust);
               exit;
            end if;
         end loop;
      end if;
   end InsertBinarySearchTree;
            
             
                
      

	
   procedure FindCustomerIterative(Root: in BinarySearchTreePoint;
 			          CustomerName:  in String10;
                                 CustomerPoint:  out BinarySearchTreePoint)
   is
   begin
      CustomerPoint := Root;
      
      loop
         if(CustomerPoint.info.name > CustomerName)then
            if(CustomerPoint.Ltag = false)then
               put("Node not found.");
               New_Line;
               exit;
            else
               CustomerPoint := CustomerPoint.Llink;
            end if;
         elsif(CustomerPoint.info.name < CustomerName)then
            if(CustomerPoint.Rtag = false)then
               put("Node not found.");
               New_Line;
               exit;
            else
               CustomerPoint := CustomerPoint.Rlink;
            end if;
         else
            --CustomerPoint := p;
            Put("Node found.");
            new_line;
            Put("Node: ");
            Put(String(CustomerPoint.info.name));
            Put(" ");
            put(String(CustomerPoint.info.PhoneNumber));
            New_Line;
            exit;
         end if;
      end loop;
   end FindCustomerIterative;
           
      
      
   procedure FindCustomerRecursive(Root: in BinarySearchTreePoint;
   	          CustomerName:  in String10;
                                   CustomerPoint:  out BinarySearchTreePoint)is
   
   begin
      if (Root /= null) then
         if (Root.info.name > CustomerName) then
            FindCustomerRecursive(Root.Llink, CustomerName, CustomerPoint);
         elsif (Root.info.name < CustomerName) then
            if(Root.Rtag = false) then
               put("Node not found");
               New_Line;
            else   
               FindCustomerRecursive(Root.Rlink, CustomerName, CustomerPoint);
            end if;
         else
            CustomerPoint := Root;
            Put("Node found.");
            new_line;
            Put("Node: ");
            Put(String(CustomerPoint.info.name));
            Put(" ");
            put(String(CustomerPoint.info.PhoneNumber));
            New_Line;
         end if;
      else
         put("Node not found");
         New_Line;
      end if;
         
               
         
   end FindCustomerRecursive;
      
         
     
                     
 
 
   function InOrderSuccessor(TreePoint: in out BinarySearchTreePoint) return BinarySearchTreePoint is
   p : BinarySearchTreePoint;   
   begin
      p := TreePoint.Rlink;
      if TreePoint.Rtag = false then
         TreePoint:=TreePoint.Rlink;
         return TreePoint;
      else
         while p.LTag = true loop
            p := p.Llink;
         end loop;
      end if;
      return p;
         
   end InOrderSuccessor;   
   
   function InOrderPredecessor(TreePoint: in BinarySearchTreePoint) return BinarySearchTreePoint is
   p : BinarySearchTreePoint;
   begin
      p := TreePoint.Llink;
      if (TreePoint.Ltag /= false) then
         while(p.Rtag = true)loop
            p := p.Rlink;
         end loop;
      end if;
      return p;
   
   end InOrderPredecessor;
      
 
 --  -- Access functions to return customer names and phone numbers.
   function CustomerName(TreePoint: in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.Info.Name;
   end CustomerName;
   
   function CustomerPhone(TreePoint: in BinarySearchTreePoint) return String10 is
   begin
      return TreePoint.Info.PhoneNumber;
   end CustomerPhone;
 --  
   procedure PreOrderTraversalIterative(TreePoint: in BinarySearchTreePoint)is
   Stack: array(1..10) of BinarySearchTreePoint;
   Knt: Integer;
   p: BinarySearchTreePoint;
   begin
      Knt:=0;
      p := TreePoint;
      loop
         if p /= null then
            put("Node: "); put(String(p.Info.Name)); put(String(p.info.PhoneNumber));New_Line; 
            Knt := Knt + 1;
            Stack(Knt) := p;
            p := p.Llink;
         else
            exit when Knt = 0;
            p := Stack(Knt);
            Knt := Knt - 1;
            p := p.Rlink;
            
         end if;
      end loop;
   end PreOrderTraversalIterative;
   
   procedure InOrderTraversalIterative(TreePoint: in BinarySearchTreePoint)is
   Stack: array(1..10) of BinarySearchTreePoint;  
   Knt: Integer;
   p: BinarySearchTreePoint;
   begin
      Knt:=0;
      p := TreePoint;
      loop
         if p /= null then
         
            Knt := Knt + 1;
            Stack(Knt) := p;
            p := p.Llink;
         else
            exit when Knt = 0;
            p := Stack(Knt);
            Knt := Knt - 1;
            put("Node: "); put(String(p.Info.Name)); put(String(p.info.PhoneNumber));New_Line; 
            p := p.Rlink;
            
         end if;
      end loop;
   end InOrderTraversalIterative;
      
      
   procedure PostOrderTraversalIterative(TreePoint: in BinarySearchTreePoint)is
   Stack: array(1..10) of BinarySearchTreePoint;
   StackInt: array(1..10) of Integer;   
   Knt: Integer;
   p: BinarySearchTreePoint;
   d: Integer;   
   begin 
      Knt := 1;
      p := TreePoint;
      loop
         if p /= null then
            Knt := Knt + 1;
            Stack(Knt) := p;
            StackInt(Knt) := 0;
            p := p.Llink;
         else 
            exit when Knt = 0;
            p := Stack(Knt);
            d := StackInt(Knt);
            exit when p = null;
            Knt := Knt - 1;
            if(d = 0)then
               Knt := Knt + 1;
               Stack(Knt) := p;
               StackInt(Knt) := 1;
               p := p.Rlink;
            else
               loop
                  exit when Knt = 0;
                  put("Node: "); put(String(p.Info.Name)); put(String(p.info.PhoneNumber));New_Line;
                  
                  p := Stack(Knt);
                  d := StackInt(Knt);
                  exit when p = null;
                  Knt := Knt - 1;
                  if(d = 0)then
                     Knt := Knt + 1;
                     Stack(Knt) := p;
                     StackInt(Knt) := 1;
                     p:=p.Rlink;
                  end if;
                  exit when d = 0;
               end loop;
            end if;
         end if;
      end loop;
   end PostOrderTraversalIterative;
                
               
         
      
end BinarySearchTree;
