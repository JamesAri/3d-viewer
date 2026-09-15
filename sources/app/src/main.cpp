#include <print>
#include <iostream>
#include "window.h"
#include "angle.h"

int main() {
    std::println("[main] C++23");
	std::cout << std::to_string(jamath::radians(30)) << std::endl;
	window();
	return 0;
}