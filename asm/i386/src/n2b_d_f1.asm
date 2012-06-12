
%define UCL_BB  32
%define UCL_FAST

%include "n2b_asm.ash"

    .text

    UCL_PUBLIC ucl_nrv2b_decompress_asm_fast_le32

%include "enter.ash"
%include "n2b_d.ash"
%include "leave.ash"

    UCL_PUBLIC_END ucl_nrv2b_decompress_asm_fast_le32


; vi:ts=8:et

