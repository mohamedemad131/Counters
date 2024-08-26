

// pwm gegeration

module pwm_gegerate
#(parameter n=8)
(
input clk,
input reset_n,
input [n-1:0] duty_cycle,
output  pwm_out   
);

reg [n-1:0] Q_current,Q_next;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end

always @(Q_current)
begin
		Q_next=Q_current+1;
end

assign pwm_out=Q_current<duty_cycle?1'b1:1'b0;

endmodule
