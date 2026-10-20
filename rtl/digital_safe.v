
module digital_safe (
    input wire [3:0] entered_code,
    input wire enter,
    input wire reset,
    output reg lock_state,
    output reg [6:0] seg
);

parameter PASSCODE = 4'b1010;

// Start in the locked state
initial begin
    lock_state = 1'b1;
end

// Password checking and reset
always @(posedge enter or posedge reset) begin
    if (reset)
        lock_state <= 1'b1;
    else if (entered_code == PASSCODE)
        lock_state <= 1'b0;
    else
        lock_state <= 1'b1;
end

// Seven-segment display
always @(*) begin
    case (lock_state)
        1'b1: seg = 7'b1000111; // Locked: L
        1'b0: seg = 7'b1000001; // Unlocked: U
        default: seg = 7'b1111111;
    endcase
end

endmodule

