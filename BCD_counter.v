
// modulus counter with limit as a parameter

module bcd_counter
#(parameter limit=9)
(
input clk,
input reset_n,
output done,
output [$clog2(limit)-1:0] Q
);
reg [$clog2(limit)-1:0] Q_current,Q_next;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end

always @(Q_current,limit)
begin
	if(Q_current==limit)
		Q_next=0;
	else
		Q_next=Q_current+1;
end
assign done=Q_current==limit?1:0;
assign Q=Q_current;

endmodule