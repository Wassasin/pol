# - Try to find msgpack
# Once done this will define
#  msgpack_FOUND - system has msgpack
#  msgpack_INCLUDE_DIRS	- include directories for msgpack
#  msgpack_LIBRARIES - libraries for msgpack

FIND_PATH(msgpack_INCLUDE_DIRS msgpack.hpp
          PATH_SUFFIXES msgpack)
FIND_LIBRARY(msgpack_LIBRARIES NAMES msgpack)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(msgpack DEFAULT_MSG
                                  msgpack_LIBRARIES msgpack_INCLUDE_DIRS)

MARK_AS_ADVANCED(msgpack_INCLUDE_DIRS msgpack_LIBRARIES)
