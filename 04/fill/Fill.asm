// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(INIT)
  @8192
  D=A
  @i
  M=D

(LOOP)
  @i
  M=M-1
  D=M       // D = RAM[i-1]

  @INIT
  D;JLT     // if i < 0 goto INIT

  @KBD
  D=M       // D = @KBD

  @WHITE
  D;JEQ

  @BLACK
  D;JMP

(WHITE)
  @SCREEN
  D=A
  @i
  A=D+M
  M=0
  @LOOP
  0;JMP

(BLACK)
  @SCREEN
  D=A
  @i
  A=D+M
  M=-1      // 11111111 11111111
  @LOOP
  0;JMP