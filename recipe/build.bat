robocopy /E bin\* %PREFIX%\bin
robocopy /E lib\* %SP_DIR%
robocopy /E include\* %PREFIX%\include

# copy and rename 'gpi.command' to 'gpi'
robocopy launch\gpi.command %PREFIX%\bin\gpi

# copy licenses to lib dir
robocopy LICENSE %SP_DIR%\gpi\
robocopy COPYING %SP_DIR%\gpi\
robocopy COPYING.LESSER %SP_DIR%\gpi\
robocopy AUTHORS %SP_DIR%\gpi\

# drop a version file with parseable info
SET VERSION_FPATH=%SP_DIR%\gpi\VERSION
@echo off
@echo PKG_NAME: %PKG_NAME% > %VERSION_FPATH%
@echo PKG_VERSION: %PKG_VERSION% >> %VERSION_FPATH%
@echo GIT_FULL_HASH: %GIT_FULL_HASH% >> %VERSION_FPATH%
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (SET BUILD_DATE=%%c-%%a-%%b)
@echo BUILD_DATE: %BUILD_DATE% >> %VERSION_FPATH%
