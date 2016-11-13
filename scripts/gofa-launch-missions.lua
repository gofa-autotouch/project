--This script prepares for missing launch in home system
--The script assumes that all your cars are on the Home 1 planet.
--It unloads ressources from previous missions by deliverying cargo to other home planet (configurable).
--The script can load each car with fighters if fighters are available on Home 1
--The script can recognize when no cars are available or when no missions are available and it will end in such case.
--All cars must be in the same group and it must be the first group

require("gofa-config");
require("gofa-utils");

--The minimum level of mission to launch. Missions below this level will be rejected.
local minMissionLaunchLevel = 5;
local numberOfCars = 79;
--Send cargo to Home3
local sendCargoToHomePlanetIndex = 3;

local launchedMissions = 0;

--Unload cargo by sending it to other home planet
function sendCargoToHomePlanet(homePlanetIndex)
	openPlanetsList();
	scrollPlanetsListTop();
	scrollPlanetsListDown(homePlanetIndex-1);
	tapButton(Config.firstPlanetIconLocation);
	waitForPixel(Config.deliverCargoButtonPixel);
	tapButton(Config.deliverCargoButtonLocation);
	waitForCarsList();
	scrollCarsListTop();
	tapButton(Config.switchToCarsGroupSelectionButtonLocation);
	tapButton(Config.selectCarsInGroupButton);
	tapButton(Config.carsGroupNextButtonLocation);
	tapButton(Config.carsGroupNextButtonLocation);
	ssleep(15, "deliver cargo");
	tapButton(Config.switchToCarsGroupSelectionButtonLocation);
	tapButton(Config.closeCarsListButtonLocation);
end


--Prepare game for missions launch
function prepareForLaunch()
	checkExtras();
	log("prepare for launch");

	sendCargoToHomePlanet(sendCargoToHomePlanetIndex);

	openPlanetsList();
	scrollPlanetsListTop();
	tapButton(Config.firstPlanetIconLocation);
	waitForPixel(Config.carsListButtonPixel);
	tapButton(Config.viewPlanetButtonLocation);
	waitForPixel(Config.backFromPlanetViewIconPixel);

	--touch missions list
	if (hasPixel(Config.limittedOfferPixel) == 0) then
		tapButton(Config.missionsButtonLocation);
	else
		tapButton(Config.limittedMissionsButtonLocation);
	end
	waitForMissionsList();
	scrollMissionsListTop();
end

function getMissionLevel()
	if (hasPixel(Config.missionLevel5) == 1) then
		return 5;
	end
	if (hasPixel(Config.missionLevel6) == 1) then
		return 6;
	end
	if (hasPixel(Config.missionLevel7) == 1) then
		return 7;
	end
	if (hasPixel(Config.missionLevel8) == 1) then
		return 8;
	end
	if (hasPixel(Config.missionLevel9) == 1) then
		return 9;
	end
	if (hasPixel(Config.missionLevel10) == 1) then
		return 10;
	end
	return 0;
end

function isCarAvailable()
	return hasPixel(Config.availableCarPixel);
end

function endOfMissionsList()
	return hasPixel(Config.missionsListScrolledBottomPixel);
end

function carNeedsMoreShips()
	return hasPixel(Config.carNeedsMoreShipsPixel);
end

function scrollCarShipsBottom()
	while (hasPixel(Config.carShipsScrolledBottomPixel) == 0) do
		scrollDown();
	end
end

function launchMissions()
	launchMissionsWithPreparation(1);
end

function launchMissionsWithPreparation(prepare)
	log("launchMissions started");
	launchedMissions = 0;
	checkExtras();
	if (prepare == 1) then
		prepareForLaunch();
	end

	while (endOfMissionsList() == 0) do
		if (getMissionLevel() < minMissionLaunchLevel) then
			log("reject mission");
			tapButton(Config.missionDetailButtonLocation);
			waitForPixel(Config.missionDetailViewPixel);
			tapButton(Config.rejectMissionButtonLocation);
			tapButton(Config.confirmMissionRejectButtonLocation);
			waitForMissionsList();
		else
			log("launch mission");
			tapButton(Config.missionDetailButtonLocation);
			waitForPixel(Config.missionDetailViewPixel);
			tapButton(Config.launchMissionButtonLocation);
			waitForCarsList();
			if (isCarAvailable() == 1) then
				tapButton(Config.carDetailsButtonLocation);
				waitForPixel(Config.carShipsLoadPixel);
				if (carNeedsMoreShips() == 1) then
					log("car needs more ships");
					scrollCarShipsBottom();
					touchDown(3, Config.addFightersButtonLocation.x, Config.addFightersButtonLocation.y);
					local addCounter = 0;
					while (carNeedsMoreShips() == 1 and  addCounter < 500) do
						usleep(100000);
						addCounter = addCounter + 1;
					end
					touchUp(3, Config.addFightersButtonLocation.x, Config.addFightersButtonLocation.y);
					usleep(Config.tapDelay);
				end
				tapButton(Config.launchCarNextButtonLocation);
				waitForPixel(Config.carCargoLoadPixel);
				tapButton(Config.launchCarNextButtonLocation);
				waitForPixel(Config.carSendFleetPixel);
				tapButton(Config.launchCarNextButtonLocation);
				waitForCarsList();
				launchedMissions = launchedMissions + 1;
			end
			tapButton(Config.closeCarsListButtonLocation);
			waitForMissionsList();
			scrollDown();
		end
	end
	usleep(Config.tapDelay);
	log(string.format("Launched %d missions", launchedMissions));
end