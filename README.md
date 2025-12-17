# RISC-V 32-bit Single-Cycle Processor (RV32I + RV32M)

![Language](https://img.shields.io/badge/Language-Verilog%2FSystemVerilog-blue)
![Platform](https://img.shields.io/badge/Platform-Xilinx%20Vivado-red)
![Architecture](https://img.shields.io/badge/Architecture-RISC--V-green)
![License](https://img.shields.io/badge/License-MIT-orange)
![Status](https://img.shields.io/badge/Status-Synthesis%20Ready-brightgreen)

## 📌 Overview

This project implements a **RISC-V 32-bit single-cycle processor** using pure Verilog/SystemVerilog.  
The entire architecture, ALU design, and control logic are created **based on the research paper included in this repository**:

📄 **[Design and Implementation of 32-bit RISC-V Processor Using Verilog](Reference_Paper.pdf)** *(Click to view the full paper — PDF included inside the repository.)*

All microarchitecture diagrams, simulation results, and reference tables are also provided in the **images/** directory and inside the research paper.

The CPU supports the **RV32I** base instruction set and the **RV32M** extension.  
Instruction memory is hardcoded for FPGA testing, requiring **no hex files**.

---

## ✨ Features

### ✔ RV32I Base Integer Set
* **Arithmetic / Logic:** `ADD`, `SUB`, `AND`, `OR`, `XOR`
* **Shifts:** `SLL`, `SRL`, `SRA`
* **Compare:** `SLT`, `SLTU`
* **Immediate:** `ADDI`, `LUI`, `AUIPC`
* **Branches:** `BEQ`, `BNE`
* **Jumps:** `JAL`, `JALR`
* **Memory:** `LW`, `SW`

### ✔ RV32M Extension
* **Multiplication:** `MUL`
* **Division:** `DIV`
* **Remainder:** `REM`

---

## 🧠 Hardware Architecture

The CPU is implemented **directly following the architecture described in the research paper** stored in this repository.

### 🔄 Datapath Flow
The processor executes instructions in **one clock cycle** using the classic RISC-V datapath stages:
1.  **Instruction Fetch (IF)**
2.  **Instruction Decode (ID)**
3.  **Execute (EX)**
4.  **Memory (MEM)**
5.  **Write Back (WB)**

All of these are implemented as combinational logic and integrated in the `top_module.v`.

### 📷 Microarchitecture & Schematics
Detailed diagrams included inside the repository:

**Micro-Architecture Overview:**
![Micro-Architecture](images/Micro-Arch.png)

**Core Circuit Schematic:**
![Schematic](images/Schematic.png)

---

## 🧪 Simulation Results

Simulation waveforms are provided to verify the correctness of the datapath and control logic.

### 📊 Verification
The simulation results cover the following critical tests:
* **ALU Operations:** Verification of integer arithmetic and logic.
* **Register File:** Read/Write consistency checks.
* **Control Flow:** Branch (`BEQ`, `BNE`) and Jump (`JAL`, `JALR`) evaluation.
* **Memory Access:** Load (`LW`) and Store (`SW`) cycle analysis.

![Test Bench Results](images/Test_Bench_Result.png)

---

## 📂 Directory Structure

```text
RiscV-32bit/
│
├── inst_mem.v                # Hardcoded instruction ROM
├── instructiondecode.v       # Decoder + Immediate generator
├── controlunit.v             # Main control logic
├── alu_module.v              # ALU (RV32I + RV32M)
├── register_file.v           # 32×32 register file
├── memory_unit.v             # Data memory (LW/SW)
├── top_module.v              # Integrated single-cycle CPU
│
├── images/                   # Architecture diagrams + waveforms
│   ├── Micro-Arch.png        # Processor Micro-Architecture
│   ├── Schematic.png         # Circuit Design Schematic
│   └── Test_Bench_Result.png # Simulation Waveforms
│
└── docs/
    └── Reference_Paper.pdf   # Included research paper
