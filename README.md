# hello_arm64_apple_silicon
Running Hello World on Arm64 Apple Silicon

## Command used to get to object files
```bash
as hello_arm.s -o hello_arm.o
```
## Command used to link to executable
```bash
ld hello_arm.o -o hello -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path -e _start -arch arm64`
```
