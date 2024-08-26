
// general up or down counter

module up_down_counter
#(parameter n=3)
(
input clk,
input up,
input reset_n,
output [n-1:0] Q
);

reg [n-1:0] Q_next,Q_current;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end

always @(Q_current,up)
begin
	Q_next=Q_current;
	if(up==1'b1)
		Q_next=Q_current+1;
	else
		Q_next=Q_current-1;
end

assign Q=Q_current;

endmodule
