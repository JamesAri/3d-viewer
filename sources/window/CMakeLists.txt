add_library(window
	src/window.cpp
)

target_compile_features(window PUBLIC cxx_std_23)

target_include_directories(window
	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_options(window PRIVATE
	-Wall
	-Wextra
	-Wpedantic
)