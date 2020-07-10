set(PACKAGE_VERSION "5.12.3")

if("" MATCHES "^([0-9]+\\.[0-9]+\\.[0-9]+)\\.") # strip the tweak version
  set(CVF_VERSION_NO_TWEAK "")
else()
  set(CVF_VERSION_NO_TWEAK "")
endif()

if("" MATCHES "^([0-9]+\\.[0-9]+\\.[0-9]+)\\.") # strip the tweak version
  set(REQUESTED_VERSION_NO_TWEAK "")
else()
  set(REQUESTED_VERSION_NO_TWEAK "")
endif()

if("" STREQUAL "")
  set(PACKAGE_VERSION_COMPATIBLE TRUE)
else()
  set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()

if( "" STREQUAL "")
  set(PACKAGE_VERSION_EXACT TRUE)
endif()
