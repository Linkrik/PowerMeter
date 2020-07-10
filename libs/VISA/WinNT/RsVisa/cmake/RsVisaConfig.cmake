# - Find RsVisa library
# Provides link targets for
# - the RsVisa (rsvisa::rsvisa)
# - RsVisaLoader (rsvisa::loadervisa) -- only Windows
# - standard Visa (rsvisa::visa) -- only Windows (for Linux this refers to the R&S VISA)

################# R&S VISA #################
include(GNUInstallDirs)
if(WIN32)
  find_path(RsVisa_INCLUDE_DIR
            NAMES visa.h
            PATHS "${CMAKE_CURRENT_LIST_DIR}/../../../${CMAKE_INSTALL_INCLUDEDIR}/rsvisa/"
                  "$ENV{VXIPNPPATH}\\WinNT\\RsVisa\\include"
            NO_DEFAULT_PATH)

  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    find_library(RsVisa_LIBRARY RsVisa32
                 PATHS "${CMAKE_CURRENT_LIST_DIR}/../../../${CMAKE_INSTALL_LIBDIR}"
                       "$ENV{VXIPNPPATH}\\WinNT\\RsVisa\\lib\\msc"
                 NO_DEFAULT_PATH)
  else()
    find_library(RsVisa_LIBRARY RsVisa32
                 PATHS "${CMAKE_CURRENT_LIST_DIR}/../../../${CMAKE_INSTALL_LIBDIR}"
                       "$ENV{VXIPNPPATH64}\\Win64\\RsVisa\\lib\\msc"
                 NO_DEFAULT_PATH)
  endif()

elseif(APPLE)
  find_path(RsVisa_INCLUDE_DIR
            NAMES visa.h
            PATHS /Library/Frameworks/RsVisa.framework/Headers/
            NO_DEFAULT_PATH)

  find_library(RsVisa_LIBRARY
              NAMES RsVisa
              PATHS /Library/Frameworks
              NO_DEFAULT_PATH)
elseif(UNIX)
  find_path(RsVisa_INCLUDE_DIR
            NAMES visa.h
            PATHS ${CMAKE_CURRENT_LIST_DIR}/../../../${CMAKE_INSTALL_INCLUDEDIR}/rsvisa/
            NO_DEFAULT_PATH)
  find_library(RsVisa_LIBRARY
               NAMES rsvisa
               PATHS ${CMAKE_CURRENT_LIST_DIR}/../../../${CMAKE_INSTALL_LIBDIR}
               NO_DEFAULT_PATH)
endif()

## Add target rsvisa::rsvisa
if(NOT ${RsVisa_LIBRARY} MATCHES ".*NOTFOUND" AND NOT TARGET rsvisa::rsvisa)
  add_library(rsvisa::rsvisa SHARED IMPORTED GLOBAL)
  set_property(TARGET rsvisa::rsvisa PROPERTY INTERFACE_INCLUDE_DIRECTORIES  ${RsVisa_INCLUDE_DIR})

  if(WIN32)
    set_property(TARGET rsvisa::rsvisa PROPERTY IMPORTED_IMPLIB ${RsVisa_LIBRARY})
  elseif(APPLE)
    set_property(TARGET rsvisa::rsvisa PROPERTY IMPORTED_LOCATION ${RsVisa_LIBRARY}/RsVisa)

    add_library(rsvisa::visa SHARED IMPORTED GLOBAL)
    set_property(TARGET rsvisa::visa PROPERTY IMPORTED_LOCATION ${RsVisa_LIBRARY}/RsVisa)
    set_property(TARGET rsvisa::visa PROPERTY INTERFACE_INCLUDE_DIRECTORIES  ${RsVisa_INCLUDE_DIR})

  elseif(UNIX)
    set_property(TARGET rsvisa::rsvisa PROPERTY IMPORTED_LOCATION ${RsVisa_LIBRARY})

    add_library(rsvisa::visa SHARED IMPORTED GLOBAL)
    set_property(TARGET rsvisa::visa PROPERTY IMPORTED_IMPLIB ${RsVisa_LIBRARY})
    set_property(TARGET rsvisa::visa PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${RsVisa_INCLUDE_DIR})
  endif()

  message(STATUS "Found rsvisa ${RsVisa_LIBRARY}")
endif()

################# VISA Loader #################
if(WIN32 AND NOT TARGET rsvisa::loader)
  find_path(RsVisa_INCLUDE_DIR
        NAMES visa.h
        PATHS "$ENV{VXIPNPPATH}\\WinNT\\RsVisa\\include"
        NO_DEFAULT_PATH)

  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    find_library(RsVisaLoader_LIBRARY RsVisaLoader
                 PATHS "$ENV{VXIPNPPATH}\\WinNT\\RsVisa\\lib\\msc"
                 NO_DEFAULT_PATH)
  else()
    find_library(RsVisaLoader_LIBRARY RsVisaLoader
                 PATHS "$ENV{VXIPNPPATH64}\\Win64\\RsVisa\\lib\\msc"
                 NO_DEFAULT_PATH)
  endif()

  ## Add target rsvisa::loader
  if(NOT ${RsVisaLoader_LIBRARY} MATCHES ".*NOTFOUND")
    add_library(rsvisa::loader SHARED IMPORTED GLOBAL)
    set_property(TARGET rsvisa::loader PROPERTY INTERFACE_INCLUDE_DIRECTORIES  ${RsVisa_INCLUDE_DIR})
    set_property(TARGET rsvisa::loader PROPERTY IMPORTED_IMPLIB ${RsVisaLoader_LIBRARY})
  endif()

endif()

################# Standard VISA #################
if(WIN32 AND NOT TARGET rsvisa::visa)
  find_path(RsVisa_INCLUDE_DIR
        NAMES visa.h
        PATHS "$ENV{VXIPNPPATH}\\WinNT\\RsVisa\\include"
        NO_DEFAULT_PATH)

  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    find_library(Visa_LIBRARY visa32
                 PATHS "$ENV{VXIPNPPATH}\\WinNT\\lib\\msc"
                 NO_DEFAULT_PATH)
  else()
    find_library(Visa_LIBRARY visa64
                 PATHS "$ENV{VXIPNPPATH64}\\Win64\\Lib_x64\\msc"
                 NO_DEFAULT_PATH)
  endif()

  ## Add target rsvisa::visa
  if(NOT ${Visa_LIBRARY} MATCHES ".*NOTFOUND")
    add_library(rsvisa::visa SHARED IMPORTED GLOBAL)
    set_property(TARGET rsvisa::visa PROPERTY INTERFACE_INCLUDE_DIRECTORIES  ${RsVisa_INCLUDE_DIR})
    set_property(TARGET rsvisa::visa PROPERTY IMPORTED_IMPLIB ${Visa_LIBRARY})
  endif()
endif()
