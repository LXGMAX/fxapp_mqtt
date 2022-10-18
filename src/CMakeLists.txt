cmake_minimum_required(VERSION 2.6)
project(fxapp)

FIND_LIBRARY(mosquitto NAMES mosquitto)

add_executable(${PROJECT_NAME} main.c)

TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${mosquitto})
INSTALL(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION /usr/bin/)
