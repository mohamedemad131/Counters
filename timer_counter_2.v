

// counter as timer

module timer_counter_2
#(parameter n=8)
(
input clk,
input reset_n,
input [n-1:0] final_value,
output done
);

reg [n-1:0] Q_current,Q_next;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end
assign done=Q_current==final_value?1'b1:1'b0;
always @(Q_current,final_value)
begin
	if(Q_current==final_value)
		Q_next=0;
	else
		Q_next=Q_current+1;
end
endmodule
