RISC-V 32-bit Single-Cycle Processor (RV32I + RV32M)

This repository contains a fully functional RISC-V 32-bit single-cycle CPU implemented in Verilog/SystemVerilog.
The core supports the RV32I base instruction set and the RV32M extension (MUL, DIV, REM).
All instructions execute in one clock cycle (no pipeline stages).

The design is FPGA-friendly and synthesizes cleanly on Xilinx Vivado.

Features

Single-cycle RISC-V CPU

RV32I Instruction Set:

ADD, SUB, AND, OR, XOR

SLL, SRL, SRA

SLT, SLTU

LUI, AUIPC

BEQ, BNE, BLT, BGE, BLTU, BGEU

JAL, JALR

LW, SW

RV32M Extension:

MUL, DIV, REM

Hardcoded Instruction Memory (no hex files required)

Register File (32 registers, x0 hardwired to zero)

ALU with Flags (Zero, Negative, Carry, Overflow)

Data Memory for load/store

Top-Level Integration with instruction fetch, decode, execute, mem, and writeback

Fully tested using Vivado testbenches

Directory Structure
RiscV-32bit/
│
├── inst_mem.v             # Hardcoded instruction memory (ROM)
├── instructiondecode.v    # Instruction decoder and immediate generator
├── controlunit.v          # Control logic and ALU op generation
├── alu_module.v           # Arithmetic Logic Unit (RV32I + RV32M)
├── register_file.v        # 32-register file with read/write ports
├── memory_unit.v          # Data memory (load/store)
├── top_module.v           # Complete RISC-V processor integration
│
└── testbenches/           # Simulation testbenches for each module

CPU Architecture Overview

The CPU follows the classical five RISC-V stages, but executes them all in a single clock cycle:

Instruction Fetch (IF)

Reads instruction from ROM using PC

PC increments by 4 or jumps for branch/jal/jalr

Instruction Decode (ID)

Extracts opcode, funct3, funct7

Reads rs1 and rs2 from register file

Generates immediate based on instruction type

Execute (EX)

ALU performs required operation

Branch decisions are computed here

ALU flags (Zero, Negative, Carry, Overflow) generated

Memory (MEM)

Loads and stores using data memory

LW, SW supported

Writeback (WB)

ALU or memory result written to rd

x0 always remains zero

Hardcoded Program (Built-In ROM)

The instruction memory is entirely hardcoded:

No hex files

No $readmemh

Works directly in synthesis and simulation

Example program included:

ADDI, ADD, SUB

Logic operations

Shift operations

SLT/SLTU

MUL, DIV, REM

Branch instructions (BEQ, BNE, BLT, BGE, etc.)

JAL, JALR

LUI, AUIPC

ECALL, EBREAK

Infinite loop at the end

You can modify inst_mem.v to add your own program.

Module Interaction Diagram
               +-----------------------+
               |     inst_mem.v        |
 PC ---------> |  Instruction Fetch    | ---> instruction
               +-----------------------+

               +-----------------------+
 instruction -> |  Instruction Decode  |
                |  opcode, rs1, rs2    | ---> control signals
                |  immediate           |
               +-----------------------+

               +-----------------------+
 read_data1 -> |                       |
 read_data2 -> |         ALU           | ---> result
 immediate --> |                       |
               +-----------------------+

               +-----------------------+
               |      Data Memory      |
 result -----> |   LW / SW operations  | ---> mem_read_data
               +-----------------------+

               +-----------------------+
               |     Register File     |
 rd, result -->|  32 registers (x0=0)  |
               +-----------------------+

How to Simulate

In Vivado:

Create a new project

Add all .v files

Add the testbench from /testbenches/

Run Simulation

Every module has an isolated testbench, and there is a full top-level testbench.

How to Synthesize

Open Vivado

Create RTL project

Add all Verilog files

Select your FPGA board

Run Synthesis and Implementation

This design does not require:

Memory hex files

IP cores

DDR

AXI

Everything is pure RTL logic.

Extending the CPU

You can extend this CPU with:

Hazard Detection Unit

Forwarding Unit

5-stage or 7-stage pipeline

CSR registers

Interrupt support

RV32A (Atomic Instructions)

Cache memory

UART/LED/Display output

If you want a pipeline upgrade, ask:

Make my CPU a 5-stage pipelined RISC-V.

Author

Varada Govind Aakula
B.Tech ECE, IIIT Allahabad

License

MIT License (or choose any license you prefer)
