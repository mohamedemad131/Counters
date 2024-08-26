


// general up or down or load counter

module up_down_load_counter
#(parameter n=3)
(
input clk,
input up,
input load,
input reset_n,
input [n-1:0] I,
input enable, 
output [n-1:0] Q

);

reg [n-1:0] Q_next,Q_current;
//current logic
always @(posedge clk,negedge reset_n,enable)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else if(enable == 1)
		Q_current<=Q_next;
	else
		Q_current<=Q_current;
end
// next logic
always @(Q_current,up,load)
begin
	Q_next=Q_current;
	case({up , load})
		2'b00:Q_next=Q_current-1;
		2'b01:Q_next=I;
		2'b10:Q_next=Q_current+1;
		2'b11:Q_next=I;
		default:Q_next=Q_current;
	
	endcase
end

assign Q=Q_current;

endmodule