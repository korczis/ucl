
%define UCL_BB  32
%define UCL_SMALL
%define UCL_SAFE

%include "n2e_asm.ash"

    .text

    UCL_PUBLIC ucl_nrv2e_decompress_asm_small_safe_le32

%include "enter.ash"
%include "n2e_d.ash"
%include "leave.ash"

    UCL_PUBLIC_END ucl_nrv2e_decompress_asm_small_safe_le32


; vi:ts=8:et

