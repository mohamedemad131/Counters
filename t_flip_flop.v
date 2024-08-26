
// t flip flop

module t_ff(
input T,
input clk,
input reset_negative, // if 0 reset mean out will be 0 in next posedge if 1 continue 
output Q,
output Q_b
);

reg Q_next,Q_current;
assign Q_b=~Q;
// current state logic
always @(posedge clk,negedge reset_negative)
begin
	Q_current=Q_current;
	if(reset_negative==0)
		Q_current=1'b0;
	else
		#2 Q_current <=Q_next;
end

// next state logic

always @(T)
begin
	Q_next=Q_current;
	if(T==0)
		Q_next=Q_current;
	else
		Q_next=~Q_current;
end

assign Q=Q_current;

endmodule
