# A star Planning Algorithm - Project 3

This is an implementation of A star algorithm with obstacle Space taken from the Vrep Environment ,To see the obstacle space, open rrl_ideal.ttt in vrep.
Differential Constraints are taken into account.

To run the code:
1) open the folder named Code in matlab.
2) Run pro3.m
3) Give input and output point by clicking the mouse and see the path formed by A-star.
4) To simulate again, run pro3.m.

Useful Tips:
1) Uncomment Line 46 in addnode to visualize the exploration of nodes.
2) See output folder to see the velocity text file. The text file consits of velocities generated as per the mentioned time of 0.5 seconds or 2hz.

## Implementation Demo


<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-with diff/Output/A*withdiff.gif">
</p>

## ROS Implementation

The ROS implementation can be executed by copy pasting the turtlebot_sim package into your catkin_ws. 
(Note: the build may break due to dependency issue but the code is correct)

After making the package, please run
```
roslaunch turtlebot_sim turtlebot_sim.launch 
```

The simulation in gazebo can be found below:
<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-with diff/Output/ros.gif">
</p>