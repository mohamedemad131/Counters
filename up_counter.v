
// general up counter

module up_counter
#(parameter n=4)
(
input clk,
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

always @(Q_current)
begin
	Q_next=Q_current;
	Q_next=Q_current+1;
end

assign Q=Q_current;

endmodule