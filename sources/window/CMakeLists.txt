add_library(window
	src/window.cpp
)
	
target_compile_features(window PRIVATE cxx_std_23)

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

target_link_libraries(window PRIVATE SFML::Graphics)

target_include_directories(window
	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

if(MSVC)
	target_compile_options(window PRIVATE
		/W4
		/permissive-
	)
else()
	target_compile_options(window PRIVATE
		-Wall
		-Wextra
		-Wpedantic
	)
endif()
