# StarFive private CSR related instructions, haven't extension name yet:
# RUN: llvm-mc %s -triple=riscv64 -mattr=+zicsr -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv64 -mattr=+zicsr < %s \
# RUN:     | llvm-objdump --mattr=+zicsr --no-print-imm-hex -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: cflush.d.l1 a0
# CHECK-ASM: encoding: [0x73,0x00,0x05,0xfc]
cflush.d.l1 a0

# CHECK-ASM-AND-OBJ: cflush.d.l2 a0
# CHECK-ASM: encoding: [0x73,0x00,0x45,0xfc]
cflush.d.l2 a0

# CHECK-ASM-AND-OBJ: cdiscard.d.l1 a0
# CHECK-ASM: encoding: [0x73,0x00,0x25,0xfc]
cdiscard.d.l1 a0

# CHECK-ASM-AND-OBJ: cdiscard.d.l2 a0
# CHECK-ASM: encoding: [0x73,0x00,0x65,0xfc]
cdiscard.d.l2 a0

# CHECK-ASM-AND-OBJ: cdiscard.d.l2 zero
# CHECK-ASM: encoding: [0x73,0x00,0x60,0xfc]
cdiscard.d.l2 x0

# CHECK-ASM-AND-OBJ: cdiscard.d.l1 zero
# CHECK-ASM: encoding: [0x73,0x00,0x20,0xfc]
cdiscard.d.l1 x0

# CHECK-ASM-AND-OBJ: cflush.d.l2 zero
# CHECK-ASM: encoding: [0x73,0x00,0x40,0xfc]
cflush.d.l2 x0

# CHECK-ASM-AND-OBJ: cflush.d.l1 zero
# CHECK-ASM: encoding: [0x73,0x00,0x00,0xfc]
cflush.d.l1 x0
