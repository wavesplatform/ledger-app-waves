#*******************************************************************************
#   Ledger Blue
#   (c) 2016 Ledger
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#*******************************************************************************

ifeq ($(BOLOS_SDK),)
$(error BOLOS_SDK is not set)
endif
include $(BOLOS_SDK)/Makefile.defines

# Main app configuration

APPVERSION_M=1
APPVERSION_N=1
APPVERSION_P=0

APPNAME = "Waves"
APPVERSION = $(APPVERSION_M).$(APPVERSION_N).$(APPVERSION_P)

ifeq ($(TARGET_NAME),TARGET_BLUE)
ICONNAME=blue_app_waves.gif
else
	ifeq ($(TARGET_NAME),TARGET_NANOX)
ICONNAME=nanox_app_waves.gif
	else
ICONNAME = nanos_app_waves.gif
	endif
endif

APP_LOAD_PARAMS = --appFlags 0x240 --path "44'/5741564'" --curve secp256k1 --curve ed25519 $(COMMON_LOAD_PARAMS)

# Build configuration

### variables processed by the common makefile.rules of the SDK to grab source files and include dirs
APP_SOURCE_PATH  += src
SDK_SOURCE_PATH  += lib_stusb #qrcode
#use the SDK U2F+HIDGEN USB profile
SDK_SOURCE_PATH  += lib_u2f lib_stusb_impl

ifeq ($(TARGET_NAME),TARGET_NANOX)
SDK_SOURCE_PATH  += lib_blewbxx lib_blewbxx_impl
SDK_SOURCE_PATH  += lib_ux
DEFINES		     += HAVE_UX_FLOW
endif

ifeq ($(TARGET_NAME),TARGET_NANOS)
SDK_SOURCE_PATH  += lib_ux
DEFINES		     += HAVE_UX_FLOW
endif

DEFINES += APPVERSION=\"$(APPVERSION)\"

#for debug only
DEFINES += OS_IO_SEPROXYHAL
DEFINES += HAVE_BAGL HAVE_SPRINTF HAVE_SNPRINTF_FORMAT_U
DEFINES += HAVE_IO_USB HAVE_L4_USBLIB IO_USB_MAX_ENDPOINTS=7 IO_HID_EP_LENGTH=64 HAVE_USB_APDU TCS_LOADER_PATCH_VERSION=0
DEFINES += LEDGER_MAJOR_VERSION=$(APPVERSION_M) LEDGER_MINOR_VERSION=$(APPVERSION_N) LEDGER_PATCH_VERSION=$(APPVERSION_P)

DEFINES += BLAKE_SDK

# U2F Support
DEFINES   += HAVE_U2F
DEFINES   += HAVE_IO_U2F U2F_PROXY_MAGIC=\"WAVES\"
DEFINES   += USB_SEGMENT_SIZE=64

DEFINES   += UNUSED\(x\)=\(void\)x
DEFINES   += APPVERSION=\"$(APPVERSION)\"
DEFINES   += MAX_DATA_SIZE=128

DEFINES   += HAVE_WEBUSB WEBUSB_URL_SIZE_B=0 WEBUSB_URL=""


ifeq ($(TARGET_NAME),TARGET_NANOX)
DEFINES   += IO_SEPROXYHAL_BUFFER_SIZE_B=300
DEFINES       += HAVE_BLE BLE_COMMAND_TIMEOUT_MS=2000
DEFINES       += HAVE_BLE_APDU # basic ledger apdu transport over BLE

DEFINES       += HAVE_GLO096
DEFINES       += HAVE_BAGL BAGL_WIDTH=128 BAGL_HEIGHT=64
DEFINES       += HAVE_BAGL_ELLIPSIS # long label truncation feature
DEFINES       += HAVE_BAGL_FONT_OPEN_SANS_REGULAR_11PX
DEFINES       += HAVE_BAGL_FONT_OPEN_SANS_EXTRABOLD_11PX
DEFINES       += HAVE_BAGL_FONT_OPEN_SANS_LIGHT_16PX
else
DEFINES   += IO_SEPROXYHAL_BUFFER_SIZE_B=128
endif

# Enabling debug PRINTF
DEBUG = 0
ifneq ($(DEBUG),0)

        ifeq ($(TARGET_NAME),TARGET_NANOX)
                DEFINES   += HAVE_PRINTF PRINTF=mcu_usb_printf
        else
                DEFINES   += HAVE_PRINTF PRINTF=screen_printf
        endif
else
        DEFINES   += PRINTF\(...\)=
endif

##############
#  Compiler  #
##############
ifneq ($(BOLOS_ENV),)
$(info BOLOS_ENV=$(BOLOS_ENV))
CLANGPATH := $(BOLOS_ENV)/clang-arm-fropi/bin/
GCCPATH := $(BOLOS_ENV)/gcc-arm-none-eabi-8-2018-q4-major/bin/
else
$(info BOLOS_ENV is not set: falling back to CLANGPATH and GCCPATH)
endif
ifeq ($(CLANGPATH),)
$(info CLANGPATH is not set: clang will be used from PATH)
endif
ifeq ($(GCCPATH),)
$(info GCCPATH is not set: arm-none-eabi-* will be used from PATH)
endif

CC := $(CLANGPATH)clang
CFLAGS += -O3 -Os

AS := $(GCCPATH)arm-none-eabi-gcc
AFLAGS +=

LD := $(GCCPATH)arm-none-eabi-gcc
LDFLAGS += -O3 -Os
LDLIBS += -lm -lgcc -lc

# Main rules

all: default
    $(info $(APP_LOAD_PARAMS))

load: all
	python -m ledgerblue.loadApp $(APP_LOAD_PARAMS)

delete:
	python -m ledgerblue.deleteApp $(COMMON_DELETE_PARAMS)

# Import rules to build glyphs
# NOTE: src/glyphs.* should be removed to recompile it. Or just use 'clean'.
include $(BOLOS_SDK)/Makefile.glyphs

# Import generic rules from the SDK

include $(BOLOS_SDK)/Makefile.rules


listvariants:
	@echo VARIANTS COIN waves
