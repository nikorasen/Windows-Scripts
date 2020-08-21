if (test-path "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe") {
    Rename-Item -path "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe" -NewName "NoGoogle.exe"
}