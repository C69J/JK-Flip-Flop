# JK Flip-Flop – Verilog

This project implements a **JK Flip-Flop** using **Verilog HDL**.

A JK Flip-Flop is a sequential logic circuit that stores one bit of data and eliminates the invalid state present in an SR Flip-Flop. Its output changes according to the values of the `J` and `K` inputs on the active clock edge.

## Overview

The JK Flip-Flop consists of:

- 2 Inputs: `J` and `K`
- 1 Clock Input: `CLK`
- 1 Output: `Q`
- 1 Complementary Output: `Q_bar`
- Positive-edge triggered operation
- Sequential logic implementation

## Block Diagram

```text
                 ┌───────────────┐
        J ──────►│               │──────► Q
        K ──────►│  JK FLIP-FLOP │
      CLK ──────►│               │──────► Q_bar
                 └───────────────┘
