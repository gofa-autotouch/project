--Configuration for iPhone 4S
--All pixels and locations were collected with the Autotouch record feature
--You can also take a screenshot and convert pixel/location yourself
--The formula is:
--		autotouch X = image Y
--		autotouch Y = Screen Height - image X - 1
--		autotouch color = Blue pixel + Green pixel<<8 + Red pixel<<16
--		The "<<" operand is left bit shift. You can use Excel function BITLSHIFT

require("gofa-pixel");
require("gofa-location");

Config = {};

--screen size
Config.width = 640;
Config.height = 960;
Config.orientation = ORIENTATION_TYPE.PORTRAIT;

--Scroll size, represents height of the item in game scroll list
Config.scrollSize = 86;

--Delays

--The in-game animation delay in microseconds, should be the same on all devices
--Don't relay on animations, because sometime it may be laggy, rather check if pixel
--is presented
Config.animationDelay = 500000;
--Scrolling touch delay
Config.scrollTouchDelay = 100000;
--Delay for button tap
Config.tapDelay = 100000;
--Delat for action that generates experience points
Config.XPAnimationDelay = 2000000;

--PIXELS and LOCATIONS

--Pixel that is unique for cars list
Config.carsListPixel = Pixel.new(66, 898, 15398135);

--Pixel that is unique for daily bonus popup
Config.dailyBonusPixel = Pixel.new(335, 475, 15128651);

--Location that represents close button of the daily bonus popup
Config.dailyBonusCloseButtonLocation = Location.new(116, 106);

--Pixel that is unique for the level up popup
Config.levelUpPixel = Pixel.new(296, 338, 9621728);

--Location that represents close button of the level up popup
Config.levelUpCloseButtonLocation = Location.new(316, 289);

--Location that represents ssleep dialog close button
--Call the ssleep if you want to test it
Config.ssleepDialogCloseButtonLocation = Location.new(438, 501);

--Location that represents center of scroll area (missings, planets, cars)
Config.scrollLocation = Location.new(372, 282);

--Pixel that is unique for planets list
Config.planetsListPixel = Pixel.new(41, 885, 4028300);

--Location that represents planets list button
Config.planetsListButtonLocation = Location.new(31, 943);

--Pixel that is unique for top of planets list (the scrollbar position)
Config.planetsListScrolledTopPixel = Pixel.new(96, 29, 10368768);

--Pixel that is unique for bottom of planets list (the scrollbar position)
Config.planetsListScrolledBottomPixel = Pixel.new(605, 29, 11102976);

--Pixel that is unique for planet that has job done, the planet must be first in the list
Config.firstPlanetJobDonePixel = Pixel.new(136, 118, 3441756);

--Location of first planet details button
Config.firstPlanetDetailsButtonLocation = Location.new(139, 57);

--Location of long scan job button
Config.longScanJobButtonLocation = Location.new(413, 50);

--Pixel that is unique for long scan not running button
Config.longScanNotRunningPixel = Pixel.new(406, 74, 16777215);

--Pixel that is unique for scanning array details
Config.scanningArrayDetailsPixel = Pixel.new(111, 593, 8363948);

--Pixel that is unique for red citadel, the planet must be first in the list
Config.redCitadelPixel = Pixel.new(125, 896, 10956839);

--Pixel that is unique for yellow citadel, the planet must be first in the list
Config.yellowCitadelPixel = Pixel.new(125, 896, 11498021);

--Pixel that is unique for blue citadel, the planet must be first in the list
Config.blueCitadelPixel = Pixel.new(125, 896, 1002142);

--Pixel that is unique for citadel detail view
Config.citadelDetailPixel = Pixel.new(112, 597, 11849944);

--Location of artifact mining job button
Config.artifactJobButtonLocation = Location.new(273, 70);

--Pixel that is unique for artifact job not running button
Config.artifactJobNotRunningPixel = Pixel.new(278,68,16777215);

--Location of first planet icon
Config.firstPlanetIconLocation = Location.new(125, 896);

--Location of cars list button
Config.carsListButtonLocation = Location.new(28, 829);

--Pixel that is unique for cars list button (before the carlist is open)
Config.carsListButtonPixel = Pixel.new(32, 827, 16777215);

--Pixel that is unique for cars list view (indicates the cars list is open)
Config.carsListPixel = Pixel.new(66, 898, 15398135);

--Pixel that is unique for cars list that is scrolled to top (scroll bar)
Config.carsListScrolledTopPixel = Pixel.new(96, 29, 10368768);

--Pixel that is unique for limitted offer (happy hour, bundle pack, etc.)
Config.limittedOfferPixel = Pixel.new(117, 274, 16418862);

--Location of missions button
Config.missionsButtonLocation = Pixel.new(144, 220);
--The same button is a little bit moved in case of happy our or other limitted offer
Config.limittedMissionsButtonLocation = Location.new(196, 210);

--Pixel that is unique to missions list that is scrolled to top (scroll bar)
Config.missionsListScrolledTopPixel = Pixel.new(172, 29, 10368768);

--Pixel that is unique for missions list
Config.missionsListPixel = Pixel.new(130, 509, 8432569);

--Pixel that is unique for mission levels
Config.missionLevel6 = Pixel.new(231, 389, 119289);
Config.missionLevel7 = Pixel.new(233, 395, 119289);
Config.missionLevel8 = Pixel.new(227, 393, 119289);
Config.missionLevel9 = Pixel.new(226, 390, 119289);
Config.missionLevel10 = Pixel.new(234, 385, 119289);

--Location of mission detail button
Config.missionDetailButtonLocation = Location.new(211, 72);

--Location of reject mission button
Config.rejectMissionButtonLocation = Location.new(559, 479);

--Location of confirm mission reject button
Config.confirmMissionRejectButtonLocation = Location.new(513, 119);

--Location of launch mission button
Config.launchMissionButtonLocation = Location.new(596, 50);

--Pixel that is unique for available car
Config.availableCarPixel = Pixel.new(187, 95, 16777215);

--Pixel that is unique for missions list scroll end (scroll bar)
Config.missionsListScrolledBottomPixel = Pixel.new(605, 29, 11102976);

--Pixel that is unique to a car that is not fully loaded with mkII fighters
Config.carNeedsMoreShipsPixel = Pixel.new(174, 251, 9015);

--Location of car details button
Config.carDetailsButtonLocation = Location.new(170, 65);

--Pixel that is unique when car ships is scrolled to bottom (scroll bar)
Config.carShipsScrolledBottomPixel = Pixel.new(519, 29, 11168768);

--Location of + ships button on a car ships list (Fighters MKII when list is scrolled to bottom)
Config.addFightersButtonLocation = Location.new(233, 153);

--Location of launch car next button
Config.launchCarNextButtonLocation = Location.new(579, 42);

--Location of close cars list button
Config.closeCarsListButtonLocation = Location.new(63, 35);

--Location of Deliver cargo button
Config.deliverCargoButtonLocation = Location.new(473, 52);

--Pixel unique to deliver cargo button
Config.deliverCargoButtonPixel = Pixel.new(458, 428, 5791845);

--Location of switch to cars group selection button
Config.switchToCarsGroupSelectionButtonLocation = Location.new(54, 837);

--Location of select cars is group button
Config.selectCarsInGroupButton = Location.new(125, 902);

--Location of cars group next button
Config.carsGroupNextButtonLocation = Location.new(615, 69);

--Location of view planet button
Config.viewPlanetButtonLocation = Location.new(298, 71);

--Pixel unique to back from planet view icon
Config.backFromPlanetViewIconPixel = Pixel.new(582, 892, 5921370);

--Pixel car ships load
Config.carShipsLoadPixel = Pixel.new(120, 852, 15659249);

--Pixel car cargo load
Config.carCargoLoadPixel = Pixel.new(123, 840, 13224393);

--Pixel car send fleet
Config.carSendFleetPixel = Pixel.new(48, 473, 16777215);

return Config;