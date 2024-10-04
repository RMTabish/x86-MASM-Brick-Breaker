# Brick Breaker Game in Assembly Language (x86 MASM)

Welcome to the **Brick Breaker Game in Assembly Language x86 MASM** repository! This repository contains the source code for a graphical brick breaker game written in x86 Assembly Language using Microsoft Macro Assembler (MASM). The game features colorful graphics, sound effects, and responsive controls, providing an engaging experience for players of all ages.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Game Objective](#game-objective)
- [Features](#features)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Introduction

This project showcases a classic **Brick Breaker Game** implemented in x86 assembly language using MASM. The game is equipped with multiple levels, each offering increased difficulty. The purpose of this project is educational, aiming to demonstrate how a graphical game can be created using low-level programming.

## Installation

To run this project, you will need the following:

- **MASM (Microsoft Macro Assembler)**
- **An emulator** such as DOSBox or a machine with an x86 processor

### Steps:

1. **Clone or Download the Repository:**
   - Clone this repository to your local machine using `git clone` or download the ZIP file.

2. **Assemble the Code:**
   - Open the project in MASM and run the following command to assemble the code:
     ```bash
     ml /c /coff brickbreaker.asm
     ```

3. **Link the Assembled Code:**
   - After assembling, link the object file with this command:
     ```bash
     link /SUBSYSTEM:CONSOLE brickbreaker.obj
     ```

4. **Run the Game:**
   - Once linked, you can run the game in an emulator (such as DOSBox) or on a compatible x86 machine.

## Usage

Once the game is running, you can control the paddle using the arrow keys. The objective is to keep the ball in play while breaking all the bricks on the screen.

## Game Objective

The primary goal is to:

- Use the paddle to prevent the ball from falling off the bottom of the screen.
- Break all the bricks to advance to the next level.

Each level increases in difficulty, providing more challenging gameplay as you progress.

## Features

- **Colorful Graphics**: Simple yet engaging graphics designed using assembly code.
- **Sound Effects**: Includes basic sound effects to enhance the gaming experience.
- **Multiple Levels**: The game features multiple levels, with increasing difficulty as you advance.
- **Responsive Controls**: Smooth and responsive paddle controls using the keyboard arrow keys.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, feel free to submit a pull request. All kinds of improvements, including code refactoring and feature enhancements, are appreciated.

Please note that this project is intended for **educational purposes only** and is not meant for commercial use or distribution.



## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code for educational purposes.
