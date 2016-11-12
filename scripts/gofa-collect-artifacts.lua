--This script will collect artifacts from each planet. 
--It goes through each planet and check if the planet is citadel and if it has a job done
--It then opens the job and checks if it's artifact mining job, so it can collect it and launch again.

require("gofa-config");
require("gofa-utils");

local collectedArtifacts = 0;

--Returns citadel type or 0 if planet is not a citadel
function getPlanetCitadelType(offset)

if (hasPixel(Pixel.withOffset(Config.blueCitadelPixel,offset*Config.scrollSize,0)) == 1) then
	return 1;
end
if (hasPixel(Pixel.withOffset(Config.redCitadelPixel,offset*Config.scrollSize,0)) == 1) then
	return 1;
end
if (hasPixel(Pixel.withOffset(Config.yellowCitadelPixel,offset*Config.scrollSize,0)) == 1) then
	return 1;
end
return 0;

end

function waitForCitadelDetail()
	--wait 2 seconds, if we don't get the pixel then we return 0, which means we got a timeout
	--this is useful if the citadel has another job
	local timeout = waitForPixelWithTimeout(Config.citadelDetailPixel, 2);
	return timeout;
end

function collectArtifactFromPlanet(planetPosition)
	tapButton(Pixel.withOffset(Config.firstPlanetDetailsButtonLocation,planetPosition*Config.scrollSize,0));

	if (waitForCitadelDetail() == 1) then
		tapButton(Config.artifactJobButtonLocation);
		--collecting an artifact generates XP, so we need to check for popups (level up). We also need to wait, because of the XP animation
		checkExtras();
		usleep(Config.XPAnimationDelay);
		waitForPixel(Config.artifactJobNotRunningPixel);
		tapButton(Config.artifactJobButtonLocation);
		collectedArtifacts = collectedArtifacts + 1;
       end
	
	openPlanetsList();
end

function isEndOfPlanetsList()
	return hasPixel(Config.planetsListScrolledBottomPixel);
end

function collectArtifacts()
	collectedArtifacts = 0;
	openPlanetsList();
	scrollPlanetsListTop();

	while (isEndOfPlanetsList() == 0) do
    		if (getPlanetCitadelType(0) > 0 and hasPixel(Config.firstPlanetJobDonePixel) == 1) then
			collectArtifactFromPlanet(0);
   		end
		scrollDown();
 	end
   	--at the end of planets list the job done color is different, we need to open each citadel
	for i=0,5 do
		if (getPlanetCitadelType(i) > 0) then
			collectArtifactFromPlanet(i);
   		end
	end
	scrollPlanetsListTop();
	log(string.format("collected %d artifacts", collectedArtifacts));
end