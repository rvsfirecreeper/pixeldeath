# 2D FNAF Game  
There are 4 animatronics:
  
## Freddy:  
Aggravated by heat.  
For every degree over 90, his kill interval will decrease by 0.5 seconds  
His kill interval starts at 20s and caps out at 5s  
Every 7s(When Cameras are down) or 3.5s(When Cameras are up or music is on)(secondary interval), there is an AI in 20 chance a freddle will appear in the office  
Every kill interval, he has a freddle count in 8 chance to kill you  
You can remove one freddle per 2 seconds by having temperature under 55  

### BLOOD:  
kill interval reduced to 10s and caps at once per frame, if any freddles in the office a jumpscare triggers on the next kill interval  

## Bonnie:  
Has an interval every 10s  
Has an AI in 20 chance to succeed an interval  
He can be stalled with the Flashlight  
He needs to succeed 8 movements before jumpscaring you  
Every second the flashlight is on, he will increment a variable  
If the variable is greater than or equal to 4 on a movement opportunity, he will subtract 4  from it and fail the movement opportunity automatically  

### BLOOD:  
Will choose one of three positions in the Office to be in every camera flip and only when you flash the correct position will it add to his stall counter. He will play a sound showing what side he's on:  
Middle: Both Ears  
Left: Left Ear only  
Right: Right only  
In addition he has a very devious mechanic:  
Every stall, he will check how much the variable is and will require that much for any future stalls  

## Chica:  
Has an AI in 20 chance to jumpscare you every half second the Music Duration is under or equal to Sound \* 20 With a Grace Period of 2s before she can kill  

### BLOOD:  
No Grace Period  

## Foxy:  
He relies on the Audio Lure  
You have a counter of 100 that starts at the beginning of the night  
Foxy will take min(1000/AI, 150\) to reach your office  
Every Audio Lure sets his timer back thirdway  
The counter increases by 0.15 every second   
However:  
every audio lure subtracts your current sound from the counter  
if the counter runs out, you die to Foxy   
In addition, after an audio lure, the counter increase will be stalled for AI \* 1.4 \- (number of seconds \* 1.24444) it would have taken for him to reach your office  

### BLOOD:  
Counter is 50 lul  

## Universal Mechanics:  

### Power:  

Cameras, Fan, Flashlight, and Music take 1 power usage  
Power Generator subtracts one usage  
There is an idle drain of 1 power usage  
You can only have Power Gen or Music on, not both  
Same with Flashlight and Cams  
Your total power is 100%, where each power usage drains 0.06% a second(may seem generous, but trust me, from my calcs, it IS NOT)  

### Sound:  
Fan and Power Gen add 1 and 2 sound respectively  
Music disables all sound  

### Temperature:  
Starts at 60  
When Fan is not on, temperature will increase at an idle rate of ½ per second  
While Fan is on, temperature will decrease at a rate of 1 per second

### Music:  
Music Duration:  
Will decrease by 7% while Music isn't on  
Increases at 21% a second increase while Music is on  
Music can hit at minimum 0  
Night will last for 6 minutes

### Flashlight:  
You can only flash while cameras are down  
To the player, they understand that:  
Freddy is more deadly at high temperature and you need cold to repel him  
Bonnie needs to be flashed  
Chica likes music and doesn't like other noise  
Foxy needs to be lured

### BLOOD:  
Aside from Animatronic-specific buffs, if any animatronic's camera(aside from Bonnie and Freddy because they're in the office) isn't selected for 10s straight, their interval will be permanently halved.

