
%define UCL_BB      8
%define UCL_FAST

%include "n2d_asm.ash"

    .text

    UCL_PUBLIC ucl_nrv2d_decompress_asm_fast_8

%include "enter.ash"
%include "n2d_d.ash"
%include "leave.ash"

    UCL_PUBLIC_END ucl_nrv2d_decompress_asm_fast_8


; vi:ts=8:et

