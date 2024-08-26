
module lfsr
#(parameter n=3)
(
input clk,
input reset_n,
output [1:n] Q
);

reg [1:n] Q_next,Q_current;
wire tab;
// current state logic

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b1;
	else
		Q_current<=Q_next;
end
// next state logic
assign tab=Q[3]^Q[2];
always @(tab,Q_current)
begin
	Q_next=({tab,Q_current[1:n-1]});
end

assign Q=Q_current;


endmodule