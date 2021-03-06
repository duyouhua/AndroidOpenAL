#
# Android.mk
#
# Created by wistone on 16/9/8.
# Author  : wistone
# Email   : xiyanglu@gmail.com
#

TARGET_PLATFORM := android-9
ROOT_PATH := $(call my-dir)


########################################################################################################
include $(CLEAR_VARS)

OPENAL_ROOT		 := $(ROOT_PATH)/openal
OPENAL_ALC 		 := $(OPENAL_ROOT)/Alc
OPENAL_AL32      := $(OPENAL_ROOT)/OpenAL32

$(warning OpenAL Root = $(OPENAL_ROOT))
$(warning $(OPENAL_ALC))
$(warning $(OPENAL_AL32))

LOCAL_MODULE     := openal
LOCAL_ARM_MODE   := arm
LOCAL_PATH       := $(ROOT_PATH)
LOCAL_C_INCLUDES := $(LOCAL_PATH)							\
					$(OPENAL_ROOT)							\
					$(OPENAL_ROOT)/include 					\
					$(OPENAL_ROOT)/Alc 						\
					$(OPENAL_ROOT)/OpenAL32 				\
					$(OPENAL_ROOT)/OpenAL32/Include

LOCAL_SRC_FILES  := \
            $(OPENAL_ALC)/ALc.c \
            $(OPENAL_ALC)/alcConfig.c \
            $(OPENAL_ALC)/alcRing.c \
            $(OPENAL_ALC)/ALu.c \
            $(OPENAL_ALC)/ambdec.c \
            $(OPENAL_ALC)/bformatdec.c \
            $(OPENAL_ALC)/bs2b.c \
            $(OPENAL_ALC)/bsinc.c \
            $(OPENAL_ALC)/helpers.c \
            $(OPENAL_ALC)/hrtf.c \
            $(OPENAL_ALC)/mixer.c \
            $(OPENAL_ALC)/mixer_c.c \
            $(OPENAL_ALC)/panning.c \
            $(OPENAL_ALC)/uhjfilter.c \
            \
            $(OPENAL_ALC)/effects/autowah.c \
            $(OPENAL_ALC)/effects/chorus.c \
            $(OPENAL_ALC)/effects/compressor.c \
            $(OPENAL_ALC)/effects/dedicated.c \
            $(OPENAL_ALC)/effects/distortion.c \
            $(OPENAL_ALC)/effects/echo.c \
            $(OPENAL_ALC)/effects/equalizer.c \
            $(OPENAL_ALC)/effects/flanger.c \
            $(OPENAL_ALC)/effects/modulator.c \
            $(OPENAL_ALC)/effects/null.c \
            $(OPENAL_ALC)/effects/reverb.c \
            \
            $(OPENAL_ALC)/backends/base.c \
            $(OPENAL_ALC)/backends/loopback.c \
            $(OPENAL_ALC)/backends/null.c \
            $(OPENAL_ALC)/backends/opensl.c \
            $(OPENAL_ALC)/backends/wave.c \
            \
            $(OPENAL_AL32)/alAuxEffectSlot.c \
            $(OPENAL_AL32)/alBuffer.c \
            $(OPENAL_AL32)/alEffect.c \
            $(OPENAL_AL32)/alError.c \
            $(OPENAL_AL32)/alExtension.c \
            $(OPENAL_AL32)/alFilter.c \
            $(OPENAL_AL32)/alListener.c \
            $(OPENAL_AL32)/alSource.c \
            $(OPENAL_AL32)/alState.c \
            $(OPENAL_AL32)/alThunk.c \
            $(OPENAL_AL32)/sample_cvt.c \
            \
            $(OPENAL_ROOT)/common/almalloc.c \
            $(OPENAL_ROOT)/common/alhelpers.c \
            $(OPENAL_ROOT)/common/atomic.c \
            $(OPENAL_ROOT)/common/rwlock.c \
            $(OPENAL_ROOT)/common/threads.c \
            $(OPENAL_ROOT)/common/uintmap.c \

LOCAL_CFLAGS     := -DAL_BUILD_LIBRARY \
                    -DAL_ALEXT_PROTOTYPES \
					-DANDROID \
                    -fpic \
                    -ffunction-sections \
                    -funwind-tables \
                    -fstack-protector \
                    -fno-short-enums \
                    -DHAVE_GCC_VISIBILITY \
                    -O3 \
                    -mfpu=neon \
                    -mfloat-abi=softfp \
                    -march=armv7-a \
                    -ffast-math \
                    -std=c99 \

LOCAL_LDLIBS     := -lOpenSLES -llog
LOCAL_ARM_NEON := true

LOCAL_STATIC_LIBRARIES := libtremolo

include $(BUILD_SHARED_LIBRARY)

