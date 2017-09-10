#pragma once

/**
* @file Observer.h
* @brief Defines the Observer interface.
* @author Grain
* @date 2017-09-02
* @details 
*/

namespace BlockBreak
{
	class Observer {
	public:
		virtual void update() = 0;
	};
}
