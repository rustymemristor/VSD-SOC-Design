


# VSD-SOC-Design
Documentation for the NASSCOM-VSD-SOC Program. This project does not use the default image, and hence some differences in commands may be present. These will be mentioned when used.

## Documentation
[Go to Lab 1](#lab-1)

[Go to Lab 2](#lab-2)

[Go to Lab 3](#lab-3)

[Go to Lab 4](#lab-4)

[Go to Lab 5](#lab-5)

## Lab 1 
Tasks for lab 1 include
1. Learning basic directory structure in openlane
2. Invoking the openlane flow interactively
3. Running synthesis
4. Checking Synthesis Logs for instantiations, cell count etc. 
5. Calculating Flop Ration

![Invoking the openlane interactive flow and exploring the picorv32a directory structure](Screenshots/Lab1/Screenshot_20240712_184442.png)Invoking the openlane interactive flow and exploring the picorv32a directory structure.


![Viewing main config.tcl file](Screenshots/Lab1/Screenshot_20240712_194126.png)
Viewing main config.tcl file


![](Screenshots/Lab1/Screenshot_20240712_194915.png)
Preparing the picorv32a design.
```
prep -design picorv32a
```


![](Screenshots/Lab1/Screenshot_20240712_194900.png)
Viewing the output of prep design command. This is created inside the runs folder created in the above step. In the current openlane version there are 3 files, this is the nominal version hence called merged.nom.lef


![](Screenshots/Lab1/Screenshot_20240712_195059.png)
Viewing config.tcl created by starting the run.


![](Screenshots/Lab1/Screenshot_20240712_195459.png)
Running Synthesis.
```
run_synthesis
```


![](Screenshots/Lab1/Screenshot_20240712_200057.png)
Viewing Synthesis Log. These are created under the logs/synthesis folder inside the current run.


![](Screenshots/Lab1/Screenshot_20240712_200114.png)
Viewing Synthesis Log.


![](Screenshots/Lab1/Screenshot_20240713_153818.png)
Viewing Synthesis Log.


![](Screenshots/Lab1/Screenshot_20240712_200231.png)
Viewing Synthesis STA Log.

To calculate flop ratio, there is a simple formula
```math
Flop\;Ratio = \frac{Total\;Number\;of\;D\;Flip-flops}{Total\;Number\;of\;cells}
```
```math
Flop\;Ratio = \frac{1513}{16558} = 0.091375770021
```
```math
\%Flop\;Ratio = 09.1375770021
```

## Lab 2
Tasks for lab 2 include
1.  Running the floorplan.
2.  Calculating die area.
3.  Examining the produced def file using MAGIC.
4. Running placement.
5. Viewing the def file post placement.


![Running the floorplan](Screenshots/Lab2/Screenshot_20240713_162958.png)
Running the floorplan and initial floorplan log.


![](Screenshots/Lab2/Screenshot_20240713_163025.png)
Initial IO placement (In this case it is equidistant randomised)


![](Screenshots/Lab2/Screenshot_20240713_163050.png)
Initial Tapcell placement.


![](Screenshots/Lab2/Screenshot_20240713_163118.png)
Initial Power Distribution Network (PDN).


![](Screenshots/Lab2/Screenshot_20240713_163241.png)
Created DEF file. The def file created has a priority order of 
```
1. specific pdk instances
2. config.tcl file held locally
3. configuration/floorplan.tcl
```
It shows the area in microns, in the format ```DIE AREA (x0,y0) (x1, y1)``` We can calculate the die area by
$$
Die Area = 692,760 μm \times 703,480 μm = 487,263,728,000 μm^2
$$


![](Screenshots/Lab2/Screenshot_20240713_163546.png)
This is the command to view the DEF file created in magic. In my case a custom alias called magicsky is used which sets my graphics to cairo and sets technology to sky130A. This command is executed inside the generated floorplan def folder, and hence does not use the full pathnames.
```
magicsky lef read ../../tmp/merged.nom.lef def read picorv32a.def &
```

![](Screenshots/Lab2/Screenshot_20240713_163656.png)
View of picorv32a in magic post floorplan


![](Screenshots/Lab2/Screenshot_20240713_163800.png)
Closer look at power distribution lines and cells used.


![](Screenshots/Lab2/Screenshot_20240713_163858.png)
Closer look at the floorplan.       

![](Screenshots/Lab2/Screenshot_20240713_164038.png)
Trying to change the metal layers for horizontal and vertical IO.

![](Screenshots/Lab2/Screenshot_20240713_164353.png)
Flow failed due to incorrect env variable (documentation shows deprecated)
Default is now layer 3 and 4 acoording to documents.

![](Screenshots/Lab2/Screenshot_20240713_170544.png)
Running placement.


![](Screenshots/Lab2/Screenshot_20240713_170628.png)
Post placement DEF file in magic. This is run inside the placement folder in the results directory.
```
magicsky lef read ../../tmp/merged.nom.lef def read picorv32a.def &
```


![](Screenshots/Lab2/Screenshot_20240713_170642.png)
Closer look at the placed cells.


![](Screenshots/Lab2/Screenshot_20240713_170838.png)
Decaps present near IO.


![](Screenshots/Lab2/Screenshot_20240713_170921.png)
Another view of the placement.

