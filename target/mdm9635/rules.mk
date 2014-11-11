LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared

PLATFORM := mdm9x35

MEMBASE                             := 0x07E00000
MEMSIZE                             := 0x00100000 # 1MB
SCRATCH_ADDR                        := 0x00000000
SCRATCH_REGION1                     := 0x00000000
SCRATCH_REGION1_SIZE                := 0x01000000 #16MB
SCRATCH_REGION2                     := 0x01300000
SCRATCH_REGION2_SIZE                := 0x06B00000 # 107MB

DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += NO_KEYPAD_DRIVER=1
DEFINES += PERIPH_BLK_BLSP=1

DEVS += fbcon
MODULES += \
	dev/keys \
	dev/pmic/pm8x41 \
	lib/ptable \
	lib/libfdt \
	dev/fbcon

DEFINES += \
	MEMBASE=$(MEMBASE) \
	SCRATCH_ADDR=$(SCRATCH_ADDR) \
	SCRATCH_REGION1=$(SCRATCH_REGION1) \
	SCRATCH_REGION2=$(SCRATCH_REGION2) \
	MEMSIZE=$(MEMSIZE) \
	SCRATCH_REGION1_SIZE=$(SCRATCH_REGION1_SIZE) \
	SCRATCH_REGION2_SIZE=$(SCRATCH_REGION2_SIZE) \

OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/meminfo.o \
	$(LOCAL_DIR)/target_display.o \
	$(LOCAL_DIR)/qpic_panel_drv.o \
	$(LOCAL_DIR)/keypad.o
