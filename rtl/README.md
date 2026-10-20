# Verilog Digital Safe Lock

## Overview
A simple FPGA-based digital safe lock implemented using Verilog HDL. The system checks an entered 4-bit passcode and indicates whether the safe is locked or unlocked using a seven-segment display.

This project demonstrates fundamental digital design concepts, including conditional logic, event-driven control, and output decoding.

## Features
- 4-bit passcode verification
- Configurable passcode using a Verilog parameter
- Reset functionality to return the system to the locked state
- Seven-segment display output for lock status
- Synthesizable RTL design intended for FPGA implementation

## Hardware and Tools
- **Hardware:** DE10 FPGA development kit (as specified in the project report)
- **HDL:** Verilog
- **Design tool:** Intel Quartus Prime
- **Display:** Seven-segment display

## How It Works
1. The system starts in the locked state.
2. The user provides a 4-bit passcode through `entered_code`.
3. A rising edge on `enter` triggers passcode verification.
4. If the entered passcode matches the predefined passcode, the system unlocks.
5. If the passcode is incorrect, the system remains locked.
6. Activating `reset` returns the system to the locked state.
7. The seven-segment output indicates the current lock status.

## Default Passcode
The default passcode is `1010` in binary (decimal 10). It can be changed through the `PASSCODE` parameter.

## Repository Structure
```text
Verilog-Digital-Safe-Lock/
├── README.md
└── rtl/
    └── digital_safe.v
```

## RTL Module Interface

| Signal | Direction | Width | Description |
|---|---|---|---|
| `entered_code` | Input | 4 bits | Passcode entered by the user |
| `enter` | Input | 1 bit | Triggers passcode verification on a rising edge |
| `reset` | Input | 1 bit | Resets the lock to the locked state |
| `lock_state` | Output | 1 bit | `1` = locked, `0` = unlocked |
| `seg` | Output | 7 bits | Seven-segment display control |

## Future Improvements
- Add a dedicated testbench with positive and negative test cases.
- Verify seven-segment encoding against the target FPGA board.
- Add input debouncing and a more robust reset strategy.
- Implement an FSM for a multi-step password entry sequence.
- Add attempt limiting to improve security.

## Learning Outcomes
- Writing behavioral RTL in Verilog
- Implementing combinational and sequential logic
- Using parameters for configurable designs
- Understanding FPGA-based digital system implementation

## Author
**Damini Katakam**  
B.Tech, Electronics and Communication Engineering  
Vellore Institute of Technology

## Note
This repository documents an educational project. The design has not been represented as a security-grade locking system. Hardware operation and display encoding should be verified on the target FPGA board.
