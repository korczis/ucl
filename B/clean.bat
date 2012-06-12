@echo off

set RM=rm -f

%RM% *.err *.o *.obj
%RM% libucl.a ucl.lib
%RM% simple.exe simple.map simple.tds
%RM% uclpack.exe uclpack.map uclpack.tds

