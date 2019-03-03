# Implementing A* and Breadth First Search Algorithms on Turtlebot 2

Here I create a graphical representation of exploration of nodes using A* and BFS algorithm to implement path planning. The A* algorithm is also implemented by applying differential equations of turtlebot2 for node exploration. The simulation is finally carried out in Vrep to check its validity and implemented on a real turtlebot2 at the [Robotics Realization Lab](https://sites.google.com/site/roboticsrealizationlab/). 

To best understand the project, please go through the repository in the following order:

1) Breadth First Search Simulation on given Obstacle Space.
The BFS algorithm is implemented on the obstacle space found in the folder. The code can be found [here](https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/tree/master/Breadth-First-Search-Planning-Algorithm) 

<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/Breadth-First-Search-Planning-Algorithm/Output/BFS.gif">
</p>

2) A* implementation on the same obstacle space as BFS. The code can be found [here](https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/tree/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-Project2).

<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-Project2/Output/A*.gif">
</p>

3) A* implementation on an obstacle space replicating the space in the robotics realization lab. In this implementation no condition of differential constraints is considered. The step length of exploring nodes in all 8 directions is 1. The code can be found [here](https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/tree/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-withoutdiff).

<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-withoutdiff/Output/A*withoutdiff.gif">
</p>

4) A* implementation with differential constraints. Here the node exploration step depends upon the angular velocity set for each wheel. The code can be found [here](https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/tree/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-with%20diff).

<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/A-star-Planning-Algorithm-RRL-Project3-with diff/Output/A*withdiff.gif">
</p>

5) A* implementation on turtlebot2 2. The algorithm generated in the last step is simulated in Vrep and then implemented on turtlebot2 using ROS at the robotics realization lab. The video can be found [here](https://youtu.be/4ogWmn3j0_o). The code can be found [here](https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/tree/master/A-Star-On-TurtleBot/VREP-%20A-star-Planning-Algorithm-RRL-Project3-withoutdiff).


<p align="center">
<img src="https://github.com/anirudhtopiwala/ENPM-661-Planning-Projects/blob/master/A-Star-On-TurtleBot/VREP- A-star-Planning-Algorithm-RRL-Project3-withoutdiff/Output/Vrep.gif">
</p>
