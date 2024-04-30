# Pipelined VHDL CORDIC Algorithm

This repository contains an implementation of the CORDIC (Coordinate Rotation Digital Computer) algorithm in VHDL, utilizing a pipelined architecture for improved performance.

## Overview

The CORDIC algorithm is an iterative method for calculating trigonometric, hyperbolic, and logarithmic functions using only simple shift-and-add operations. It is widely used in digital signal processing, graphics, and scientific computing applications.

This implementation focuses on optimizing the CORDIC algorithm by employing a pipelined architecture, which allows for higher throughput and faster execution times.

## Features

- Pipelined architecture for improved performance
- Fixed number of iterations to 16
- Synthesizable VHDL code
- Simple testbench

## Repository Structure

The repository is organized as follows:

- `/`: Contains the VHDL source files for the pipelined CORDIC algorithm
  - `pack_ROM.vhd`: Package file with constants, types, and functions
  - `CORDIC_PIPE.vhd`: Main CORDIC pipeline entity and architecture
  - `STAGE_PIPE.vhd`: Individual CORDIC stage entity and architecture
  - `my_testbench.vhd`: Testbench for the pipelined CORDIC algorithm
- `README.md`: This file, providing an overview of the repository

## Usage

1. Clone the repository:
   ```
   git clone https://github.com/alebal123bal/CORDIC_PIPELINED.git
   ```

## Dependencies

- EDAPlayGround, ALDEC Riviera Pro

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Acknowledgments

- This project was developed as part of a course on digital design and computer architecture.
