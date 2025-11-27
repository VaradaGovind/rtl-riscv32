# RISC-V 32-bit Single-Cycle Processor (RV32I + RV32M)

![Language](https://img.shields.io/badge/Language-Verilog%2FSystemVerilog-blue)
![Platform](https://img.shields.io/badge/Platform-Xilinx%20Vivado-red)
![Architecture](https://img.shields.io/badge/Architecture-RISC--V-green)
![License](https://img.shields.io/badge/License-MIT-orange)
![Status](https://img.shields.io/badge/Status-Synthesis%20Ready-brightgreen)

## 📌 Overview

This repository contains a **RISC-V 32-bit single-cycle CPU** implemented in Verilog/SystemVerilog.  
The core implements the **RV32I** base integer instruction set (with a currently supported subset) and the **RV32M** extension (multiplication, division, remainder).

The processor executes each instruction in a **single clock cycle**. The design focuses on a **modular architecture**, **clean RTL style**, and **FPGA synthesis** using Xilinx Vivado. Instruction memory is currently **hardcoded inside `inst_mem.v`**, so no external hex file is required.

## ✨ Features

### Supported Instruction Sets (Current Version)

* **RV32I Base Integer Set (implemented subset):**
  * **Arithmetic / Logic:**  
    `ADD`, `SUB`, `AND`, `OR`, `XOR`
  * **Shifts:**  
    `SLL`, `SRL`, `SRA`
  * **Comparison:**  
    `SLT`, `SLTU`
  * **Immediate / Upper:**  
    `ADDI`, `LUI`, `AUIPC`
  * **Branching:**  
    `BEQ`, `BNE`  
    > ALU supports comparison operations; other branch types like `BLT/BGE/BLTU/BGEU` can be added by extending the control logic.
  * **Jumps:**  
    `JAL`, `JALR`
  * **Memory:**  
    `LW`, `SW`

* **RV32M Extension:**
  * `MUL`, `DIV`, `REM`

### Core Architecture Highlights

* **Single-Cycle Execution:**  
  Classic IF–ID–EX–MEM–WB flow implemented in a **single clock cycle** without pipeline stages.
* **Harvard-Style Memory:**  
  Separate **Instruction Memory (ROM)** and **Data Memory (RAM)** allow independent code and data access.
* **Register File:**  
  Standard **32 x 32-bit** register file (`x0` hardwired to zero) with dual read ports and single write port.
* **Custom ALU Design:**  
  ALU controlled via a **5-bit `alu_op` code**, supporting arithmetic, logic, shift, comparison, branch compare, and RV32M operations, with flags:
  * Zero (Z), Negative (N), Carry (C), Overflow (V)
* **Pure RTL, No IP Cores:**  
  Implemented entirely in plain Verilog/SystemVerilog, portable to other FPGA vendors or ASIC flows.

## 📂 Directory Structure

```text
RiscV-32bit/
│
├── inst_mem.v             # ~1 KB Instruction ROM with hardcoded program
├── instructiondecode.v    # Instruction decoder + immediate generation
├── controlunit.v          # Main control: RegWrite, MemRead/Write, ALUSrc, MemToReg, Branch, JAL, alu_op
├── alu_module.v           # ALU: RV32I + RV32M operations, flag generation
├── register_file.v        # 32 x 32-bit register file (dual read, single write)
├── memory_unit.v          # ~1 KB Data memory for LW/SW
├── top_module.v           # Top-level RISC-V CPU integration (single-cycle core)
│
└── testbenches/           # (Optional) Simulation files
    ├── tb_top_module.v    # Full CPU testbench
    ├── tb_alu_module.v    # ALU unit test
    └── tb_register_file.v # Register file unit test
