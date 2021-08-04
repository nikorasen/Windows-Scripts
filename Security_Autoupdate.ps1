$ErrorActionPreference = "SilentlyContinue"
set-location "$env:PROGRAMFILES\Windows Defender"
.\mpcmdrun.exe -removedefinitions -dynamicsignatures
.\mpcmdrun.exe -signatureupdate