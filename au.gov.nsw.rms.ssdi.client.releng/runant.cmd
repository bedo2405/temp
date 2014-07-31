echo off
setlocal

REM ****************************************************

REM The JRE java.exe to be used
set JAVAEXE="D:\buildsystem\BuildAgent\jre\bin\java.exe"

REM The Eclipse launcher jar
set LAUNCHERJAR="D:\eclipse42\eclipse\plugins\org.eclipse.equinox.launcher_1.3.0.v20120522-1813.jar"


REM The location of your workspace
REM set WORKSPACE=

REM The buildfile to use for the build
set BUILDFILE=build.ant
if not exist %BUILDFILE% set BUILDFILE=build.ant

REM ****************************************************

if not exist %JAVAEXE% echo ERROR: incorrect java.exe=%JAVAEXE%, edit this file and correct the JAVAEXE envar
if not exist %JAVAEXE% goto done

if not exist %LAUNCHERJAR% echo ERROR: incorrect equinox.launcher jar=%LAUNCHERJAR%, edit this file and correct the LAUNCHERJAR envar
if not exist %LAUNCHERJAR% goto done

if not exist %WORKSPACE% echo ERROR: incorrect workspace=%WORKSPACE%, edit this file and correct the WORKSPACE envar
if not exist %WORKSPACE% goto done

if not exist %BUILDFILE% echo ERROR: incorrect buildfile=%BUILDFILE%, edit this file and correct the BUILDFILE envar
if not exist %BUILDFILE% goto done

:run
@echo on
REM -data %WORKSPACE%
%JAVAEXE% -cp %LAUNCHERJAR% org.eclipse.equinox.launcher.Main -noupdate -application org.eclipse.ant.core.antRunner  -buildfile %BUILDFILE% -Ddirector.dir=D:\P2\director -Duser.home=D:\Buckminster\HeadlessBuckminster -Dbuckminster.home=D:\Buckminster\HeadlessBuckminster
:done
