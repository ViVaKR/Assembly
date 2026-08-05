#! /usr/bin/env zsh

# 💡 내 Mac의 모든 시스템 헤더 폴더(/usr/include)를 통째로 이 잡듯 뒤지는 만능 셜록홈즈 구문

SDK_PATH=$(xcrun --sdk macosx --show-sdk-path)

# -r (하위 폴더까지 싹 다 찾기), -n (몇 번째 라인에 있는지 표시)
# grep -rnw "$SDK_PATH/usr/include/" -e "int.*printf("

# 💡 현재 활성화된 최신 macOS SDK 내의 syscall.h를 찾아 검색하는 우아한 한 줄
cat $(xcrun --sdk macosx --show-sdk-path)/usr/include/sys/syscall.h | grep -i $1

# cat-syscall.sh write
# man 2 write
#  cat $(xcrun --sdk macosx --show-sdk-path)/usr/include/stdio.h 