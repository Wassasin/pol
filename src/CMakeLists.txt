INCLUDE(CheckFunctionExists)

CHECK_FUNCTION_EXISTS(mlock HAVE_MLOCK)
CHECK_FUNCTION_EXISTS(mlockall HAVE_MLOCKALL)

CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/config.h.in
                ${CMAKE_CURRENT_BINARY_DIR}/config.h)

# The executable
# -------------------------------------
FILE(GLOB_RECURSE POL_SOURCES *.cpp)

ADD_EXECUTABLE(pol ${POL_SOURCES})

ADD_DEFINITIONS(-Wall -Wextra -Weffc++ -std=c++11
                        -pedantic -g3 -O3)

# Dependencies
# -------------------------------------

FIND_PACKAGE(Boost COMPONENTS system filesystem REQUIRED)
FIND_PACKAGE(cryptopp REQUIRED)
FIND_PACKAGE(msgpack REQUIRED)

INCLUDE_DIRECTORIES("../ext/scrypt/include"
                    ${CMAKE_CURRENT_BINARY_DIR}
                    ${Boost_INCLUDE_DIRS}
                    ${cryptopp_INCLUDE_DIRS}
                    ${msgpack_INCLUDE_DIRS})
TARGET_LINK_LIBRARIES(pol scrypt
                          ${Boost_LIBRARIES}
                          ${cryptopp_LIBRARIES}
                          ${msgpack_LIBRARIES})
