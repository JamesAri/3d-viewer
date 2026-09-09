add_executable(3dviewer
	src/main.cpp
)

target_compile_features(3dviewer PRIVATE cxx_std_23)

target_link_libraries(3dviewer PRIVATE window)

if(MSVC)
	target_compile_options(3dviewer PRIVATE
		/W4
		/permissive-
	)
else()
	target_compile_options(3dviewer PRIVATE
		-Wall
		-Wextra
		-Wpedantic
	)
endif()