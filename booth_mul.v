module booth_mul(input signed [3:0] qr, br,
output reg signed [7:0] ac);
reg [1:0] temp;
integer i;
reg e1;
reg [3:0] y1;
always @(qr ,br)
begin
ac = 8'd0;
e1= 1'd0;
for (i = 0; i < 4; i = i + 1)
begin
temp = {qr[i], e1};
y1 = -br;
case(temp)
2'd2: ac[7:4] = ac[7:4] + y1;
2'd1: ac[7:4] = ac[7:4] + br;
default: begin  end
endcase
ac = ac >> 1;
//ac[7] = ac[6];
e1 = qr[i];
end
if(br == 4'd8)
begin
ac = -ac;
end
end
endmodule







