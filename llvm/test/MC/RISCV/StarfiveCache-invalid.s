# RUN: not llvm-mc -triple riscv64 < %s 2>&1 | FileCheck %s

# Immediate operand out of range
pref 4, -10(a0) # CHECK: :[[@LINE]]:6: error: pref type must be the value 0, 1, 2, 3 or 8

# Immediate operand out of range
pref 1, -900(a0) # CHECK: :[[@LINE]]:9: error: immediate must be an integer in the range [-128, 127]
