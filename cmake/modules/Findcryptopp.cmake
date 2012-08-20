# - Try to find cryptopp
# Once done this will define
#  cryptopp_FOUND - system has cryptopp
#  cryptopp_INCLUDE_DIRS - include directories for cryptopp
#  cryptopp_LIBRARIES - libraries for cryptopp

FIND_PATH(cryptopp_INCLUDE_DIRS cryptopp/cryptlib.h
          PATH_SUFFIXES cryptopp)
FIND_LIBRARY(cryptopp_LIBRARIES NAMES cryptopp)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(cryptopp DEFAULT_MSG
                                  cryptopp_LIBRARIES cryptopp_INCLUDE_DIRS)

MARK_AS_ADVANCED(cryptopp_INCLUDE_DIRS cryptopp_LIBRARIES)
