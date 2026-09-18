`timescale 1ns / 1ps

module jkflipflop_top(
    input  j,        // SW0
    input  k,        // SW1
    input  clk,      // 100 MHz onboard clock
    input  reset,    // BTN-C
    output q,        // LED0
    output qn        // LED1
);

    wire enable_1hz;

    // Clock enable generator (1 Hz)
    clock_enable_1hz ce1 (
        .clk(clk),
        .reset(reset),
        .enable(enable_1hz)
    );

    // JK Flip-Flop with clock enable
    jkflipflop jk1 (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
        .en(enable_1hz),
        .q(q),
        .qn(qn)
    );

endmodule


// CLOCK ENABLE MODULE (100 MHz ? 1 Hz enable pulse)
module clock_enable_1hz(
    input  clk,
    input  reset,
    output reg enable
);

    reg [26:0] counter; // enough for 100M

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            enable  <= 0;
        end else begin
            if (counter == 100_000_000 - 1) begin
                counter <= 0;
                enable  <= 1'b1;   // single-cycle pulse
            end else begin
                counter <= counter + 1;
                enable  <= 1'b0;
            end
        end
    end

endmodule


// JK FLIP-FLOP WITH CLOCK ENABLE
module jkflipflop(
    input  j,
    input  k,
    input  clk,
    input  reset,
    input  en,        // 1 Hz enable
    output reg q,
    output reg qn
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q  <= 1'b0;
        qn <= 1'b1;
    end else if (en) begin
        case ({j,k})
            2'b00: q <= q;      // Hold
            2'b01: q <= 1'b0;   // Reset
            2'b10: q <= 1'b1;   // Set
            2'b11: q <= ~q;     // Toggle
        endcase
        qn <= ~q;
    end
end

endmodule