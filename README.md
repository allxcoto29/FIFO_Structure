# FIFO Using Two Stacks

Vivado SystemVerilog project implementing an 8-bit FIFO using two 8-entry stacks. The controller loads eight input bytes into the first stack, transfers them to the second stack, then presents them at the output in FIFO order.

## Interface

| Signal | Width | Description |
| --- | ---: | --- |
| `clk` | 1 | Clock input |
| `rst_n` | 1 | Active-low reset |
| `save_data` | 1 | Push `w_data` into the FIFO |
| `w_data` | 8 | Input byte |
| `r_data` | 8 | Output byte; zero outside the output phase |

## Project files

- `CID_FIFO_DualStack.xpr` — Vivado project (target part: `xc7s50csga324-1`)
- `CID_FIFO_DualStack.srcs/sources_1/new/queue.sv` — FIFO top module
- `stack_8x8b.sv`, `ram_8x8b.sv` — stack and storage
- `fsm.sv` — load, transfer, and output controller
- `counter.sv`, `comp_eq.sv`, `sub.sv`, `or.sv`, `mux2.sv` — supporting logic
- `tb.sv` — simulation testbench; drives bytes 1 through 8
- `debounce.sv` — debounce module, disabled in the Vivado project

## Simulation

Open `CID_FIFO_DualStack.xpr` in Vivado and run the behavioral simulation with `tb` as the testbench top. The testbench drives values 1 through 8; it does not contain automated output checks.
