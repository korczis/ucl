;  conf.ash -- assembler stuff
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
; //
; ************************************************************************/

                BITS    32

%include "macros.ash"
%include "util.ash"


%macro UCL_PUBLIC 1
                CGLOBALF %1
                align   16
  %ifdef __DB__
                db      0,0,0,0,0,0,0
                db      'UCL_START'
                ; still aligned at 16
  %endif
%1:
%endmacro


%macro UCL_PUBLIC_END 1
  %ifdef __DB__
                align   16
                db      'UCL_END'
  %endif
%endmacro


; vi:ts=8:et

