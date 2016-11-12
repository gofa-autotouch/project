require("gofa-config");
require("gofa-utils");
require("gofa-collect-home-missions");
require("gofa-launch-missions");

function generateMissions()
	collectMissions();
	for iteration=1,9 do
		log(string.format("get missions %d/9", iteration));
		ssleep(1220,string.format("get missions %d/9", iteration));
		collectMissions();
	end
end

function start()
	for cycle=1,3 do
		log(string.format("Cycle %d/3", cycle));
		launchMissions();
		generateMissions();
	end
	collectArtifacts();
end

start();