@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
@set PATH=%git_install_root%\bin;%git_install_root%\cmd;%git_install_root%\mingw\bin;%PATH%
@set _cwd=%~dp0

@perl.exe "%_cwd%ack.pl" %*