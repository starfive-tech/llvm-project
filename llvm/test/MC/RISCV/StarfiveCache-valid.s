# Starfive private cache related instructions, haven't extension name yet:
# RUN: llvm-mc %s -triple=riscv64 -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv64 < %s \
# RUN:     | llvm-objdump --no-print-imm-hex -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: pref 0, 0(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x05,0x00]
pref 0x0, 0x0(a0)

# CHECK-ASM-AND-OBJ: pref 0, 10(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x05,0x0a]
pref 0x0, 0xa(a0)

# CHECK-ASM-AND-OBJ: pref 1, 20(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x15,0x14]
pref 0x1, 0x14(a0)

# CHECK-ASM-AND-OBJ: pref 2, 20(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x25,0x14]
pref 0x2, 0x14(a0)

# CHECK-ASM-AND-OBJ: pref 3, 20(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x35,0x14]
pref 0x3, 0x14(a0)

# CHECK-ASM-AND-OBJ: pref 8, 127(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x85,0x7f]
pref 0x8, 0x7f(a0)

# CHECK-ASM-AND-OBJ: pref 8, -128(a0)
# CHECK-ASM: encoding: [0x13,0x20,0x85,0x80]
pref 0x8, -128(a0)
