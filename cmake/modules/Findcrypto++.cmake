# - Try to find crypto++
# Once done this will define
#  crypto++_FOUND - system has crypto++
#  crypto++_INCLUDE_DIRS - include directories for crypto++
#  crypto++_LIBRARIES - libraries for crypto++

FIND_PACKAGE(PkgConfig)
PKG_CHECK_MODULES(PC_crypto++ QUIET libcrypto++)

FIND_PATH(crypto++_INCLUDE_DIRS crypto++/cryptlib.h
          HINTS ${PC_crypto++_INCLUDEDIR} ${PC_crypto++_INCLUDE_DIRS}
          PATH_SUFFIXES crypto++)
FIND_LIBRARY(crypto++_LIBRARIES NAMES crypto++
             HINTS ${PC_crypto++_LIBDIR} ${PC_crypto++_LIBRARY_DIRS})

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(crypto++ DEFAULT_MSG
                                  crypto++_LIBRARIES crypto++_INCLUDE_DIRS)

MARK_AS_ADVANCED(crypto++_INCLUDE_DIRS crypto++_LIBRARIES)
