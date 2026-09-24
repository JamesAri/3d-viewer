cmake_minimum_required(VERSION 4.4)

project(Math
	VERSION 1.0.0
	LANGUAGES CXX
)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

add_library(Math
	src/angle.cpp
)

target_compile_features(Math PRIVATE cxx_std_23)

add_library(JA::Math ALIAS Math)

# =====================================
# BUILD TREE
# =====================================

target_include_directories(Math
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
		# install interface handled by: `install(TARGETS ... INCLUDES DESTINATION)`
		# $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

if(MSVC)
	target_compile_options(Math PRIVATE
		/W4
		/permissive-
	)
else()
	target_compile_options(Math PRIVATE
		-Wall
		-Wextra
		-Wpedantic
	)
endif()

# =====================================
# INSTALL TREE
# =====================================

install(
	TARGETS Math
	EXPORT MathTargets # needed for package config

	# Artifact options
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}

	# Does the same thing as commented part above:
	# $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
	INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
	DIRECTORY include/
	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# =====================================
# ENABLE CONSUMING LIB AS IMPORTED TARGET
# (= AS DEPENDENCY/PACKAGE)
# =====================================

set(Math_CONFIG_INIT_FILE "cmake/JAMathConfig.cmake.in")
set(Math_CONFIG_FILE "${CMAKE_CURRENT_BINARY_DIR}/JAMathConfig.cmake")
set(Math_CONFIG_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/JAMathConfigVersion.cmake")

set(Math_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/JAMath")

install(
	EXPORT MathTargets
	FILE JAMathTargets.cmake
	NAMESPACE JA::
	DESTINATION ${Math_INSTALL_CMAKEDIR}
)

configure_package_config_file(
	${Math_CONFIG_INIT_FILE}
	${Math_CONFIG_FILE}

	# tells where the generated config will ultimately live which
	# allows @PACKAGE_INIT@ and PACKAGE_* path handling to be generated correctly
	INSTALL_DESTINATION
		${Math_INSTALL_CMAKEDIR}
)

write_basic_package_version_file(
	${Math_CONFIG_VERSION_FILE}

	VERSION ${PROJECT_VERSION}

	COMPATIBILITY SameMajorVersion
)

install(
	FILES
		${Math_CONFIG_FILE}
		${Math_CONFIG_VERSION_FILE}

	DESTINATION
		${Math_INSTALL_CMAKEDIR}
)

