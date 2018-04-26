# A star Planning Algorithm - Project 3

This is an implementation of A star algorithm with obstacle Space taken from the Vrep Environment given and simulation done in Vrep.To see the obstacle space, open rrl_ideal.ttt in vrep.

To run the code:
1) open the folder named Code in matlab.
2) Load Vrep scene rrl_ideal.ttt and start the simulation.
3) Run pro3.m
4) Give output point by clicking the mouse and see the path formed by A-star.
5) Open Vrep and see the path followed by turtlebot. 
6) To simulate again, run pro3.m.

Useful Tips:
1) Uncomment Line 49 in addnode to visualize the exploration of nodes.
2)Change resolution in Pro3 line 30 to get different outputs. Less the resolution more optimal the path. Note: keeping less resolution is although more optimal but it will make the path less smooth for turtlebot.
3) See output folder to see the velocity text file and video simulation. The text file consits of velocities generated as per the time period mentioned on the file name.
