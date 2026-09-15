add_library(Window
	src/window.cpp
)

add_library(JA::Window ALIAS Window)

target_compile_features(Window PRIVATE cxx_std_23)

# ======================
# SFML
# ======================
include(FetchContent)
FetchContent_Declare(SFML
	GIT_REPOSITORY https://github.com/SFML/SFML.git
	GIT_TAG 3.1.0
	GIT_SHALLOW ON
	EXCLUDE_FROM_ALL
	SYSTEM
)
FetchContent_MakeAvailable(SFML)

target_link_libraries(Window PRIVATE SFML::Graphics)

target_include_directories(Window
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

if(MSVC)
	target_compile_options(Window PRIVATE
		/W4
		/permissive-
	)
else()
	target_compile_options(Window PRIVATE
		-Wall
		-Wextra
		-Wpedantic
	)
endif()
