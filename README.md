# RISC-V 32-bit Single-Cycle Processor (RV32I + RV32M)

![Language](https://img.shields.io/badge/Language-Verilog%2FSystemVerilog-blue)
![Platform](https://img.shields.io/badge/Platform-Xilinx%20Vivado-red)
![Architecture](https://img.shields.io/badge/Architecture-RISC--V-green)
![License](https://img.shields.io/badge/License-MIT-orange)
![Status](https://img.shields.io/badge/Status-Synthesis%20Ready-brightgreen)

## 📌 Overview

This project implements a **RISC-V 32-bit single-cycle processor** using pure Verilog/SystemVerilog.  
The entire architecture, ALU design, and control logic are created **based on the research paper included in this repository**:

📄 **[Design and Implementation of 32-bit RISC-V Processor Using Verilog](Reference_Paper.pdf)**  
*(Click to view the full paper — PDF included inside the repository.)*

All microarchitecture diagrams, simulation results, and reference tables are also provided in the **images/** directory and inside the research paper.

The CPU supports the **RV32I** base instruction set and the **RV32M** extension.  
Instruction memory is hardcoded for FPGA testing, requiring **no hex files**.

---

## ✨ Features

### Supported Instruction Sets

#### ✔ RV32I Base Integer Set
- Arithmetic / Logic: `ADD`, `SUB`, `AND`, `OR`, `XOR`
- Shifts: `SLL`, `SRL`, `SRA`
- Compare: `SLT`, `SLTU`
- Immediate: `ADDI`, `LUI`, `AUIPC`
- Branches: `BEQ`, `BNE`
- Jumps: `JAL`, `JALR`
- Memory: `LW`, `SW`

#### ✔ RV32M Extension
- `MUL`, `DIV`, `REM`

---

## 🧠 Based on Research Paper

The CPU is implemented **directly following the architecture described in the research paper** stored in this repository.  
This includes:

- Datapath design  
- ALU operation mapping  
- Opcode and funct decoding  
- Control unit truth table  
- Simulation methodologies  

All diagrams from the paper have been included in the `/images` folder for easy viewing.

---

## 🧩 Core Architecture

The processor executes instructions in **one clock cycle** using the classic RISC-V datapath:

1. Instruction Fetch (IF)  
2. Instruction Decode (ID)  
3. Execute (EX)  
4. Memory (MEM)  
5. Write Back (WB)

All of these are implemented as combinational logic and integrated in the `top_module.v`.

### 📷 Microarchitecture Diagrams

Diagrams included inside the repository:

- `images/datapath.png`  
- `images/alu.png`  
- `images/control_unit.png`  
- `images/simulation_results.png`

Refer to the PDF for the complete architecture flow.

---

## 🧪 Simulation Results

Simulation waveforms included:

- ALU operation verification  
- Register file testing  
- Branch and jump evaluation  
- Load/store cycle analysis  
- Full CPU instruction execution  

Waveforms are available in `/images` and in the research PDF.

---

## 📂 Directory Structure

```text
RiscV-32bit/
│
├── inst_mem.v                 # Hardcoded instruction ROM
├── instructiondecode.v        # Decoder + Immediate generator
├── controlunit.v              # Main control logic
├── alu_module.v               # ALU (RV32I + RV32M)
├── register_file.v            # 32×32 register file
├── memory_unit.v              # Data memory (LW/SW)
├── top_module.v               # Integrated single-cycle CPU
│
├── images/                    # Architecture diagrams + waveforms
│   ├── datapath.png
│   ├── alu.png
│   ├── simulation_results.png
│   └── control_unit_table.png
│
└── docs/
    └── RISC-V_Research_Paper.pdf   # Included research paper
