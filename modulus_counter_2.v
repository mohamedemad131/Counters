
// modulus counter with limit as an input

module modulus_counter_2
#(parameter n=3)
(
input clk,
input reset_n,
input [n-1:0] done,
output [n-1:0] Q
);

reg [n-1:0] Q_current,Q_next;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end

always @(Q_current,done)
begin
	if(Q_current==done)
		Q_next=0;
	else
		Q_next=Q_current+1;
end

assign Q=Q_current;

endmodule
