
Directory overview:
===================

As writing portable assembler sources supporting different operating
systems, compilers and assemblers has proven to be extremly painful,
the assembler sources have been converted into a more portable `db'
format. Use these whenever possible.

  gas           sources converted for gcc/gas syntax
  masm          sources converted for masm/tasm/wasm syntax
  nasm          sources converted for nasm syntax

  src           assembler sources (you need the OpenSource nasm assembler)

Also note that the file `asm_all.asm' contains all assembler functions
conveniently arranged into a single file.


Notes:
======

- The assembler sources are designed for a flat 32-bit memory model
  running in protected mode - they should work with most i386
  32-bit compilers.

- All functions expect a `cdecl' (C stack based) calling convention.
  The function return value will be placed into `eax'.
  All other registers are preserved.

- There are no prototypes for the assembler functions yet.
  An include file <ucl/ucl_asm.h> is planned for the next version.

- For reasons of speed all fast assembler decompressors (having `_fast'
  in their name) can access (write to) up to 3 bytes past the end of
  the decompressed (output) block. Data past the end of the compressed
  (input) block is never accessed (read from).
  [ technical note: because data is transferred in 32-bit units ]

- The assembler functions are not available in a Windows DLL or OS/2 DLL
  because I don't know how to generate the necessary DLL export information.

- Finally you should test if the assembler versions are actually faster
  than the C version on your machine - some compilers can do a very good
  optimization job, and they also can optimize the code for a specific
  processor type.

