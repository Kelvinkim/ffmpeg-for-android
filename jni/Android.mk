LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_LDLIBS := -llog
LOCAL_STATIC_LIBRARIES := libavformat libavcodec libavutil libpostproc libswscale libavresample libswresample libavdevice libavfilter
LOCAL_MODULE := ffmpeg
include $(BUILD_SHARED_LIBRARY)
include $(call all-makefiles-under,$(LOCAL_PATH))
