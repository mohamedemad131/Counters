

// pwm gegeration

module pwm_gegerate_improved
#(parameter counter_bits=8,timer_bits=16)
(
input clk,
input reset_n,
input [timer_bits-1:0] final_value,
input [counter_bits:0] duty_cycle, // first improvment to make duty cycle in 9 bit to solve 100% duty cycle
output  pwm_out   
);

reg [counter_bits-1:0] Q_current,Q_next;
reg D_current,D_next;
wire enable;

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

timer_counter_2 #(.n(timer_bits)) t0(
	.clk(clk),
	.reset_n(reset_n),
	.done(enable),
	.final_value(final_value)
);
d_flipflop_pos ff(
	.D(D_next),
	.clk(enable),
	.Q(D_current)
);
assign D_next=Q_current<duty_cycle?1'b1:1'b0;
assign pwm_out = D_current;
endmodule