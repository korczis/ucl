/* simple.c -- the annotated simple example program for the UCL library

   This file is part of the UCL data compression library.

   Copyright (C) 1996-2002 Markus Franz Xaver Johannes Oberhumer
   All Rights Reserved.

   The UCL library is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2 of
   the License, or (at your option) any later version.

   The UCL library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with the UCL library; see the file COPYING.
   If not, write to the Free Software Foundation, Inc.,
   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   Markus F.X.J. Oberhumer
   <markus@oberhumer.com>
 */


/*************************************************************************
// This program shows the basic usage of the UCL library.
// We will compress a block of data and decompress again.
**************************************************************************/

#include <ucl/ucl.h>


/* We want to compress the data block at `in' with length `IN_LEN' to
 * the block at `out'. Because the input block may be incompressible,
 * we must provide a little more output space in case that compression
 * is not possible.
 */

#ifndef IN_LEN
#define IN_LEN      (128*1024L)
#endif
#define OUT_LEN     (IN_LEN + IN_LEN / 8 + 256)


/*************************************************************************
//
**************************************************************************/

#include "lutil.h"

int main(int argc, char *argv[])
{
    int r;
    ucl_byte *in;
    ucl_byte *out;
    ucl_uint in_len;
    ucl_uint out_len;
    ucl_uint new_len;
    int level = 5;                  /* compression level (1-10) */

#if defined(__EMX__)
    _response(&argc,&argv);
    _wildcard(&argc,&argv);
#endif

    if (argc < 0 && argv == NULL)   /* avoid warning about unused args */
        return 0;

    printf("\nUCL real-time data compression library (v%s, %s).\n",
            ucl_version_string(), ucl_version_date());
    printf("Copyright (C) 1996-2002 Markus Franz Xaver Johannes Oberhumer\n\n");

/*
 * Step 1: initialize the UCL library
 */
    if (ucl_init() != UCL_E_OK)
    {
        printf("ucl_init() failed !!!\n");
        return 4;
    }

/*
 * Step 2: allocate blocks
 */
    in = (ucl_byte *) ucl_malloc(IN_LEN);
    out = (ucl_byte *) ucl_malloc(OUT_LEN);
    if (in == NULL || out == NULL)
    {
        printf("out of memory\n");
        return 3;
    }

/*
 * Step 3: prepare the input block that will get compressed.
 *         We just fill it with zeros in this example program,
 *         but you would use your real-world data here.
 */
    in_len = IN_LEN;
    ucl_memset(in,0,in_len);

/*
 * Step 4: compress from `in' to `out' with UCL NRV2B
 */
    r = ucl_nrv2b_99_compress(in,in_len,out,&out_len,NULL,level,NULL,NULL);
    if (r == UCL_E_OK)
        printf("compressed %lu bytes into %lu bytes\n",
            (long) in_len, (long) out_len);
    else
    {
        /* this should NEVER happen */
        printf("internal error - compression failed: %d\n", r);
        return 2;
    }
    /* check for an incompressible block */
    if (out_len >= in_len)
    {
        printf("This block contains incompressible data.\n");
        return 0;
    }

/*
 * Step 5: decompress again, now going from `out' to `in'
 */
    r = ucl_nrv2b_decompress_8(out,out_len,in,&new_len,NULL);
    if (r == UCL_E_OK && new_len == in_len)
        printf("decompressed %lu bytes back into %lu bytes\n",
            (long) out_len, (long) in_len);
    else
    {
        /* this should NEVER happen */
        printf("internal error - decompression failed: %d\n", r);
        return 1;
    }

    ucl_free(out);
    ucl_free(in);
    printf("Simple compression test passed.\n");
    return 0;
}

/*
vi:ts=4:et
*/

