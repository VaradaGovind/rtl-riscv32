`timescale 1ns / 1ps

module inst_mem (
    input wire [31:0]addr,
    output reg [31:0]inst
);

    reg [31:0]mem[0:255];
    integer i;

    initial begin
        mem[0]=32'h00A00093;
        mem[1]=32'h00208133;
        mem[2]=32'h402081B3;
        mem[3]=32'h0030A233;
        mem[4]=32'h0030B2B3;
        mem[5]=32'h0010C333;
        mem[6]=32'h0010D3B3;
        mem[7]=32'h0010E433;
        mem[8]=32'h4010E4B3;
        mem[9]=32'h00310233;

        mem[10]=32'h0000A283;
        mem[11]=32'h0040A303;
        mem[12]=32'h0080A383;

        mem[13]=32'h00E0A023;
        mem[14]=32'h00F0A123;
        mem[15]=32'h0100A223;

        mem[16]=32'h00208063;
        mem[17]=32'h00418263;
        mem[18]=32'h0062C063;
        mem[19]=32'h00834063;
        mem[20]=32'h00A4C063;
        mem[21]=32'h00C54063;

        mem[22]=32'h00C000EF;
        mem[23]=32'h008080E7;

        mem[24]=32'h123450B7;
        mem[25]=32'h12345097;

        mem[26]=32'h00000073;
        mem[27]=32'h00100073;

        mem[28]=32'h0000006F;

        for(i=29;i<256;i=i+1)
            mem[i]=32'h00000013;
    end

    always @* begin
        inst=mem[addr[9:2]];
    end

endmodule