# Config

## launch.json

```bash
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug lldb",
            "type": "lldb",
            "request": "launch",
            "program": "${workspaceFolder}/${fileBasenameNoExtension}",
            "args": [],
            "cwd": "${workspaceFolder}",
            "preLaunchTask": "C/C++: clang++ build active file"
        }
    ]
}

```

## task.json

```bash

{
"tasks": [
        {
            "type": "cppbuild",
            "label": "C/C++: clang 활성 파일 빌드",
            "command": "/usr/bin/clang",
            "args": [
                "-fcolor-diagnostics",
                "-fansi-escape-codes",
                "-g",
                "${file}",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}"
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "detail": "디버거에서 생성된 작업입니다."
        }
    ],
    "version": "2.0.0"
}
```

## CMakeLists.txt

```bash
cmake_minimum_required(VERSION 3.28)

project(
    "Viv C Asm Project"
    VERSION 1.0
    DESCRIPTION
        "Assembly Test C Program"
    LANGUAGES C
)

add_executable(Asm Asm.c)

```

## c_cpp_properties.json

>- CMD + Shift + P -> `C/C++: Build and Debug Active File`

```bash
{
    "configurations": [
        {
            "name": "Mac",
            "includePath": ["${workspaceFolder}/**"],
            "defines": [],
            "macFrameworkPath": [
                "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks"
            ],
            "compilerPath": "/usr/bin/clang",
            "cStandard": "c23",
            "cppStandard": "c++23",
            "intelliSenseMode": "macos-clang-arm64",
            "configurationProvider": "ms-vscode.cmake-tools"
        }
    ],
    "version": 4
}
```
