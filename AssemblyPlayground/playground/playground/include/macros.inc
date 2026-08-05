//
//  macros.s
//  playground
//
//  Created by 김범준 on 7/24/26.
//
// ====================================================
//  제목: 섹션 선언 매크로 모음 (hun.macros.inc 편입용)
//  목적: 장문의 .section 지시문을 짧고 의미가 분명한 매크로로 대체
// ====================================================

.ifndef HUN_SECTION_MACROS_INC
.set    HUN_SECTION_MACROS_INC, 1

// -------------------------------------------------------------
// [코드 구역] __TEXT,__text
// 명령어는 무조건 4바이트 (2^2) 정렬
// 실제 기계어 명령어가 위치. pure_instructions = 순수 명령어 구역
// -------------------------------------------------------------
.macro   CODE_SECTION
    .section __TEXT, __text, regular, pure_instructions
.align 2
.endmacro

// -------------------------------------------------------------
// [초기화된 변수] __DATA,__data
// 선언과 동시에 값이 존재하며, 실행 중 수정 가능한 전역/정적 변수 영역
// 일반 전역 변수 구역 안전하게 8바이트 정렬
// -------------------------------------------------------------
.macro   DATA_SECTION
    .section __DATA, __data
.align 3
.endmacro

// -------------------------------------------------------------
// [C-스타일 문자열 리터럴] __TEXT,__cstring,cstring_literals
// printf 포맷 스트링 등 널 종료(null-terminated) 문자열 상수 전용 (읽기 전용)
// 정렬 없음 : 바이트 스트림
// -------------------------------------------------------------
.macro   CSTRING_SECTION
    .section __TEXT, __cstring, cstring_literals
.endmacro
// -------------------------------------------------------------
// [읽기전용 변수/포인터 테이블] __DATA,__const
// 동적 링킹 시점에 주소가 확정된 후 읽기 전용으로 보호되는 변수 구역
// 주소 재배치 후 읽기 전용으로 보호되는 섹션
// (vtable, 함수 포인터 테이블, 델리게이트 리스트 등에 최적)
// 64비트 주소값(.quad)들의 배열이므로 무조건 8바이트(2^3) 정렬
// -------------------------------------------------------------
.macro   CONST_DATA_SECTION
    .section __DATA, __const
.align 3
.endmacro
// -------------------------------------------------------------
// [읽기전용 상수 데이터] __TEXT,__const
// 룩업 테이블이나 배열을 담으므로 8바이트(2^3) 고정이 안전함
// 문자열이 아닌 일반 상수 (룩업 테이블, 상수 배열 등) - 재배치 불필요
// -------------------------------------------------------------
.macro   CONST_SECTION
    .section __TEXT, __const
.align 3
.endmacro

// -------------------------------------------------------------
// [4바이트 실수 상수] __TEXT,__literal4
// float(32비트) 리터럴 전용 이므로 무조건 4바이트(2^2) 정렬 고정
// -------------------------------------------------------------
.macro   LITERAL4_SECTION
    .section __TEXT, __literal4, 4byte_literals
.align 2
.endmacro

// -------------------------------------------------------------
// [8바이트 실수 상수] __TEXT,__literal8
// double(64비트) 리터럴 전용이므로 무조건 8바이트(2^3) 정렬 고정
// -------------------------------------------------------------
.macro   LITERAL8_SECTION
    .section __TEXT, __literal8, 8byte_literals
.align 3
.endmacro




// -------------------------------------------------------------
// [0으로 초기화된 변수] __DATA,__bss
// 초기값이 없거나 0인 변수. 바이너리 용량을 차지하지 않고 실행 시 0 할당
// 안전하게 8바이트 정렬
// -------------------------------------------------------------
.macro   BSS_SECTION
    .section __DATA, __bss
.align 3
.endmacro

// -------------------------------------------------------------
// [공용/잠정 정의 심볼] __DATA,__common
// 여러 오브젝트 간 중복 선언된 전역 변수를 링커가 단일화해주는 구역
// -------------------------------------------------------------
.macro   COMMON_SECTION
    .section __DATA, __common
.endmacro

// 프롤로그
.macro FUNC_START name, stack_size
    .if    \stack_size < 32
        .error "FUNC_START: stack_size는 최소 32 이상이어야 합니다 (x19/x20 저장 공간 필요)"
    .endif
    .global _\name
    _\name:
    stp x29, x30, [sp, #-\stack_size]!
    mov x29, sp
    stp x19, x20, [sp, #16]
.endmacro

// 에필로그
.macro FUNC_EXIT_DEFAULT
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp], #16
    ret
.endmacro

.macro FUNC_EXIT stack_size
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp], #\stack_size
    ret
.endmacro

// 레지스터 안 쓰는 가벼운 함수용 초경량 에필로그
.macro FUNC_EXIT_LIGHT stack_size
    ldp x29, x30, [sp], #\stack_size
    ret
.endmacro

.endif


