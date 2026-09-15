#include "angle.h"

constexpr double PIoD = jamath::PI / 180;
constexpr double DoPI = 180 / jamath::PI;

namespace jamath
{
	float radians(float degrees)
	{
		return degrees * PIoD;
	}

	float degrees(float radians)
	{
		return radians * DoPI;
	}
}