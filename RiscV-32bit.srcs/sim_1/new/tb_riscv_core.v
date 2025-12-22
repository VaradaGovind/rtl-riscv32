`timescale 1ns / 1ps

module tb_riscv_core;
    reg clk=0;
    reg reset=1;

    wire [31:0]pc,instr,alu_result;
    wire zf,nf,cf,of;

    riscv_core uut (
        .clk(clk),
        .reset(reset),
        .dbg_pc(pc),
        .dbg_instr(instr),
        .dbg_alu_result(alu_result),
        .dbg_zero(zf),
        .dbg_negative(nf),
        .dbg_carry(cf),
        .dbg_overflow(of)
    );

    always #5 clk=~clk;

    initial begin
        $dumpfile("riscv_core.vcd");
        $dumpvars(0,tb_riscv_core);

        #20 reset=0;
        #1000 $finish;
    end

endmodule
