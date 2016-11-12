require("gofa-config");
require("gofa-utils");
local collectedMissions = 0;

function collectFromHomePlanet()
	while (hasPixel(Config.firstPlanetJobDonePixel) == 1) do
		collectMission();
	end
end

function collectMission()
	checkExtras();
	tapButton(Config.firstPlanetDetailsButtonLocation);
	--make sure the home planets doesn't have any other jobs, otherwise it would wait forever
	waitForScanningArray();
	tapButton(Config.longScanJobButtonLocation);
	waitForPixel(Config.longScanNotRunningPixel);
	tapButton(Config.longScanJobButtonLocation);
	--back to planets list
	openPlanetsList();
	collectedMissions = collectedMissions + 1;
end

function waitForScanningArray()
	waitForPixel(Config.scanningArrayDetailsPixel);
end

function collectMissions()
	openPlanetsList();
	scrollPlanetsListTop();

	collectedMissions = 0;

	--assume we have 3 home planets
	for h = 1,3 do
		collectFromHomePlanet();
		scrollPlanetsListDown(1);
       	usleep(Config.animationDelay);
	end

	--scroll back when done
	scrollPlanetsListTop();

	log(string.format("collected %d missions", collectedMissions));
end