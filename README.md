# 001 Sequence Detector using Verilog FSM

## Overview

This project implements an `001` sequence detector using a
Finite State Machine (FSM) in synthesizable Verilog HDL.

The detector monitors a serial input stream and asserts the `detected`
output whenever the sequence `001` is detected. The design supports
sequence detection.

## Sequence

Target sequence:

```text
001
Example Input=> 001001
The sequence 001 is detected twice.

FSM States:->

The design uses three FSM states:

State	Description
S0:	No matching bits detected
S1:	First 0 detected
S2:	Consecutive 00 detected

When the FSM is in S2 and receives 1, the sequence 001 is detected.

Design Features:->
sequence detection
FSM-based RTL design
Synthesizable Verilog HDL
Synchronous state transitions
Reset functionality
Self-checking through simulation/testbench monitoring

Project Files:->
 File                          Description                                   
 ----------------------------  --------------------------------------------- 
sequence_detector_001.v       RTL implementation of the FSM                 
tb_sequence_detector_001.v    Verilog testbench for functional verification 
README.md                     Project documentation

Verification:->
The testbench applies the input sequence:
001001
The detector should assert detected whenever 001 occurs.

Tools Used:->
Verilog HDL
Xilinx Vivado
RTL Simulation
FSM Design

Concepts Demonstrated:->
Finite State Machine (FSM)
RTL Design
Sequential and combinational logic
State transition design
Testbench development
Functional verification
Waveform analysis

Author:
Anshika Mishra
M.Tech (VLSI)
National Institute of Technology, Delhi

