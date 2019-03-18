@echo off

rem
rem  Script to be run when cmd.exe is started.
rem
rem  Path to script needs to be entered value of
rem    autorun
rem  under
rem    HKEY_CURRENT_USER\Software\Microsoft\Command Processor
rem
rem  Make sure that this file contains nothing that would
rem  start another cmd.exe process, such as
rem      for /f "usebackq" …
rem

set tq84_cmdexe_start=%time% %date%

@doskey cdnot=cd %github_root%notes\notes
@doskey cdloc=cd %git_work_dir%
@doskey cdkom=cd %github_root%Bibelkommentare
@doskey v=gvim
