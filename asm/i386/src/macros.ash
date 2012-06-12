;  macros.ash -- generic NASM macros
;
;  This file is part of the UCL data compression library.
;
;  Copyright (C) 2002 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 2001 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 2000 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 1999 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 1998 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 1997 Markus Franz Xaver Johannes Oberhumer
;  Copyright (C) 1996 Markus Franz Xaver Johannes Oberhumer
;
;  The UCL library is free software; you can redistribute it and/or
;  modify it under the terms of the GNU General Public License as
;  published by the Free Software Foundation; either version 2 of
;  the License, or (at your option) any later version.
;
;  The UCL library is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with the UCL library; see the file COPYING.
;  If not, write to the Free Software Foundation, Inc.,
;  59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;
;  Markus F.X.J. Oberhumer
;  <markus@oberhumer.com>
;


; /***********************************************************************
; // misc
; ************************************************************************/

%define jmps    jmp short


%macro dummy_macro 0+
%endmacro


; /***********************************************************************
; // sections
; ************************************************************************/

%macro  .text 0
  %ifdef __ELF__
                ;SECTION .text align=16
                SECTION .text
  %elifdef __OMF__
                SEGMENT code use32 flat
  %elifdef __WIN32__
                ;SECTION .text align=16
                SECTION .text
  %else
                SECTION .text
  %endif
%endmacro

%macro  .data 0
  %ifdef __OMF__
                SEGMENT data use32 flat
  %else
                SECTION .data
  %endif
%endmacro

%macro  .bss 0
  %ifdef __OMF__
                SEGMENT bss use32 flat
  %else
                SECTION .bss
  %endif
%endmacro


; declare a C global function

%macro CGLOBALF 1
  %ifdef __ELF__
                GLOBAL %1:function
  %elifdef __WIN32__
                GLOBAL _%1
    %define %1 _%1
  %else
                GLOBAL _%1
    %define %1 _%1
  %endif
%endmacro


; /***********************************************************************
; //
; ************************************************************************/

; push/pop registers as required by the C compiler
;
;   FIXME: must check the i386 ABI - probably we don't have
;          to preserve all registers

%define cregs_size      24      ; 6 registers a 4 bytes

%macro push_cregs 0
                push    ebp
                push    edi
                push    esi
                push    ebx
                push    ecx
                push    edx
%endmacro

%macro pop_cregs 0
                pop     edx
                pop     ecx
                pop     ebx
                pop     esi
                pop     edi
                pop     ebp
%endmacro



; vi:ts=8:et

