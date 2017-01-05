# gofa-autotouch
Galaxy on Fire Alliances - Autotouch scripts

## What is it good for
GOFA is a touch playing game that requires a lot of time and attention. You basically want to level up and get credits. It's not easy game, however soon you realize that many of these every day playing actions repeat. That's why I've decided to check if these actions can be automated.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=EGX-i3AX8k4
" target="_blank"><img src="http://img.youtube.com/vi/EGX-i3AX8k4/0.jpg" 
alt="Autotouch sample" width="240" height="180" border="10" /></a>

## About the author
I'm GOFA player since 2015

## What's in this repository
This repository contains lua scripts recorded and adjusted by iOS Autotouch application. You don't have to use my scripts, but you can just record your own scripts and play them. However you should at least check my screnarios and read tips in this document.

## Requirements
You have to own Jailbroken iPhone and install Autotouch on it. The free version of Autotouch has a limit, so the script can't run long time. Fortunately the paid version is not expensive. I personally have been using jailbroken iPhone 4S.

The Autotouch is storing scripts in scripts directory, on the device it's stored in /private/var/mobile/Library/AutoTouch/Scripts
You can upload all scripts to the device with any ssh tool like midnight commander or you can copy paste the text and craete all scripts manually using the Autotouch script editor.

**WARNING, Jailbreak could cause damage to your device. Make sure you understand what your doing.**

Read all about Jailbreak on [Iphonehacks](http://www.iphonehacks.com/jailbreak_iphone)  
After you Jailbreak your device, install [Autotouch](https://autotouch.net), just follow instructions on their web site.

You should know some basics about software development (functions, logical operations, etc.). Without that knowledge, it could be flustrating and you should rather only use self-recorded scripts.

## Configuration
All scripts were tested on iPhone 4S. If you want to run it on other device type then you need to create gofa-config-xxx file. Use the default gofa-config-iphone4s to check what has to be configured. Then modify the gofa-config to reference configuration of your device.

## Autotouch control
Long press the volume minus hadrware button to launch Autotouch. Select a script or record new script.  
Long press the volume minus hardware button to cancel current script.

### Pixel
The configuration is using Pixel class, which has x, y and color properties. You can use the Autotouch recording to get these values.   Just start recording and check recorded values. You can also take a screenshot and use it to record touches.  
Use the ```getColor(x, y)``` method to capute color of a pixel. For example create a script ```alert(getColor(x, y))```  
It's also possible to find x, y and color on PC or Mac from device screenshot. The conversion is:


```
autotouch X = image Y  
autotouch Y = Screen Height - image X - 1  
autotouch color = Blue pixel + Green pixel<<8 + Red pixel<<16
```

The "<<" operand is left bit shift. For example you can use Excel function BITLSHIFT

## Screnario scripts
Scenarios are sequence of actions that repeat in a loop. For example you can run 9 hours scenario before you go to bed and when you wake up you will have credits and artifacts from missions. Screnario scripts can be long running, so you want to do the following steps before you run a scenario:
1. Disable device screen rotation
2. Disable screen sleep
3. Disable auto brightnes
4. Set the display brightnes to minumum
5. Connect the device to charger
6. Run the 9 hours scenario when I go to sleep.

### Scenarios
* **gofa-scenario9**  
every 20 minutes collect missions on home 1, home 2 and home 3. After 3 hours prepare cars for launch, deliver cargo to home 3, and launch all missions with level 6 or greater. Repeat it 3 times and collect artifacts when done.
* **gofa-scenario-collect-artifacts**  
collect artifacts from all citadels
* **gofa-scenario-collect-missions**  
collect missions from home planets
* **gofa-scenario-launch-missions**  
launch missions in home system

You can create your own screnarios.

## Tips
* Sometimes the game is laggy, don't rely on time, instead of that use waitForPixel timer in gofa-utils. The function will wait for unique pixel until it appears.
* Use log function, so yo ucan later check log and see if your script is working correctly
* Autotouch support remote script invocation, you can launch script on your iOS device from any web browser by calling specific URL.
* Autotouch has usleep function, which can sleep the UI for specified microseconds (1 second = 1000 milisecconds = 1000000 microseconds). However a long usleep is causing that autotouch stops responding. Instead of that use gofa-utils and it's ssleep function for long sleep or just call sequence of shorter usleep in a loop.

## License
These scripts are free for use without any warranty or support. Feel free to modify them and contribute.
