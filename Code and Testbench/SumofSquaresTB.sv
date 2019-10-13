
//This test bench is wriiten taking into account different test cases that is needed to be tested to ensure perfect working of the code.
//Test condition to check the system's behavior on overflow is also added
module tb_part2();                                                                              //Initialzation

   logic clk, reset, valid_in, valid_out, overflow;
   logic [7:0] a;
   logic [19:0] f;

   part2 dut(.clk(clk), .reset(reset), .a(a), .valid_in(valid_in), .f(f), .valid_out(valid_out)); //Module Instantiation 

   initial clk = 0;
   always #5 clk = ~clk;

   initial begin

      reset = 1;                                                                                 // Before first clock edge, initialize
      a = 0;
      valid_in = 0;
	  
      for( int i=0; i<20; i++) begin                                                             //to check design for 20 different random values at input with reset 0 and valid in set

          @(posedge clk);
          #1; // After 1 posedge
          reset = 0; a = $urandom(); valid_in = 1;
	  $display("valid_out = %b. Expected value is 1.", valid_out);
          $display("f = %d", f);
      end
	  
      for(int i=0; i<20; i++) begin                                                              //again checking the design for 20 values of input but now with valid_in 0
                                                                                                  
          @(posedge clk);
          #1; // After 1 posedge
          reset = 0; a = $urandom(); valid_in = 0;
	  $display("valid_out = %b. Expected value is 1.", valid_out);
          $display("f = %d", f);
      end
      
          @(posedge clk);                                                                        // to check the overflow condition.
          #1; // After 1 posedge
          reset = 0; a = 300; valid_in = 1;

          @(posedge clk);
          #1; // After 1 posedge
          reset = 0; a = 300; valid_in = 1;
   end
endmodule
	  
	  
	  
	
