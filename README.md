


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






<!--stackedit_data:
eyJoaXN0b3J5IjpbODE4ODEwMTkwXX0=
-->