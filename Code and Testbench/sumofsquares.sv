module part2(clk, reset, a,valid_in,f, valid_out);
input clk, reset, valid_in;
input [7:0] a;
output logic [19:0] f;
output logic valid_out;
logic enable_a, enable_f, enable_g;
logic [19:0] d1, m1, m2,m3, ad1;
always_ff @(posedge clk) begin
	if (!reset) begin
		if (enable_a) begin
			d1<=a;
		end
	end 
always_comb begin

			m1=d1;
			m2=d1;
			m3=m1*m2;
			ad1=m3+f;
end

always_comb begin
	if(valid_in)
		enable_a=1;
	else 
		enable_a=0;
end
//Combo block enable_a=valid_1 
always_ff @(posedge clk) begin 
	if(reset) 
	  enable_f<=0;
	else 
	enable_f<=enable_a; 
end


//enable_g conne by ff enable_f

always_ff@(posedge clk) begin
 	if(!reset) begin
		if(enable_f) begin
			f<=ad1;
		end
    end
endmodule

			