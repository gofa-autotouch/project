--Utilities for gofa scripts


--Periodically wait for color at specified x,y coordinates with timeout in seconds.
--If timeout is 0 then it keep waiting forever
--If found then method return 1, otherwise method returns 0
function waitForPixelWithTimeout(pixel, timeout)
	local wait = 1;
	local waitingTime = 0;
	local result = 1;

	while (wait == 1) do
		if (getColor(pixel.x, pixel.y) == pixel.color) then
			wait = 0;
			usleep(100000);
		else
			waitingTime = waitingTime + 1;
			if (timeout > 0 and waitingTime > timeout * 10) then
				wait = 0;
				result = 0;
			else
				usleep(100000);
			end
		end
	end
	return result;
end

--Periodically wait for color at specified x,y coordinates without timeout
function waitForPixel(pixel)
	local result = waitForPixelWithTimeout(pixel, 0);
end

--Returns 1 if pixel is present, otherwise returns 0
function hasPixel(pixel)
	if (getColor(pixel.x, pixel.y) == pixel.color) then
		return 1;
	else
		return 0;
	end
end

--Tap button and wait for animation
function tapButton(location)
	touchDown(4, location.x, location.y);
	usleep(Config.tapDelay);
	touchUp(4, location.x, location.y);
	usleep(Config.animationDelay);
end

--Check if the daily 100 credits popup is present and close it
function checkDailyBonus()
	if (hasPixel(Config.dailyBonusPixel) == 1) then
		log("daily bonus is presented");
		tapButton(Config.dailyBonusCloseButtonLocation);				
	end
end

--Check if the level up popup is present and close it
function checkLevelUp()
	if (hasPixel(Config.levelUpPixel) == 1) then
		log("level up is present, congrats");
		tapButton(Config.levelUpCloseButtonLocation);
	end
end

--Check all extra popups that we want to close.
function checkExtras()
	checkLevelUp();
	checkDailyBonus();
end

--Sleep for a long time and dialog message. Use it if you want to sleep for more than 30 seconds.
--The standard usleep would make the script not responding for a long time, so you want
--to call this method in order to see how long it will sleep and make it responsive,
--the function calls mico sleeps until it reaches the desired sleep time
--the dialog displays details about the long sleep
--time parameter is time in seconds
function ssleep(time, message)
	
	local message = string.format("Waiting %ds for\n%s\nsince\n%s", time, message, os.date());
	for i = 1,time do
		if (time > 9 and i == 3) then
			alert(message);
		end
		usleep(1000000);
		if (time > 9 and i == time - 5) then
			tapButton(Config.ssleepDialogCloseButtonLocation);
		end
	end

	--it is very probably that a popup appeared while we were sleeping
	--please note that system alert is always on top even if in game popup appeared, so
	--we can first close the alert and then check popups
	checkExtras();
end

--Scroll the list up
function scrollUp()
	touchDown(3, Config.scrollLocation.x, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
	touchMove(3, Config.scrollLocation.x + Config.scrollSize, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
	touchUp(3, Config.scrollLocation.x + Config.scrollSize, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
end

--Scroll the list down
function scrollDown()
	touchDown(7, Config.scrollLocation.x, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
	touchMove(7, Config.scrollLocation.x - Config.scrollSize, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
	touchUp(7, Config.scrollLocation.x - Config.scrollSize, Config.scrollLocation.y);
	usleep(Config.scrollTouchDelay);
end

--Waits for planets list
function waitForPlanetsList()
	waitForPixel(Config.planetsListPixel);
end

function openPlanetsList()
	if (hasPixel(Config.planetsListPixel) == 1) then
		return;
	else
		tapButton(Config.planetsListButtonLocation);
		waitForPlanetsList();
	end
end

--Scroll the planets list to top 
function scrollPlanetsListTop()
	if (hasPixel(Config.planetsListPixel) == 1) then
		while (hasPixel(Config.planetsListScrolledTopPixel) == 0) do
			scrollUp();
		end
	end
end

--Scroll the planets list down by x items
function scrollPlanetsListDown(count)
	if (hasPixel(Config.planetsListPixel) == 1) then
		for i = 1, count do
			scrollDown();
		end
	end
end

function openCarsList()
	if (hasPixel(Config.carsListPixel) == 1) then
		return;
	else
		tapButton(Config.carsListButtonLocation);
		waitForCarsList();
	end
end

--Waits for cars list
function waitForCarsList()
	waitForPixel(Config.carsListPixel);
end


--Scroll the cars list to top 
function scrollCarsListTop()
	if (hasPixel(Config.carsListPixel) == 1) then
		while (hasPixel(Config.carsListScrolledTopPixel) == 0) do
			scrollUp();
		end
	end
end

--Waits for missions list
function waitForMissionsList()
	waitForPixel(Config.missionsListPixel);
end

--Scroll the missions list to top 
function scrollMissionsListTop()
	if (hasPixel(Config.missionsListPixel) == 1) then
		while (hasPixel(Config.missionsListScrolledTopPixel) == 0) do
			scrollUp();
		end
	end
end