


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
5. Calculating Flop Ratio

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
Die Area = 692,760\\mu m \times 703,480\\mu m = 487,263,728,000\\mu m^2
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
Trying to change the metal layers for horizontal and vertical IO. Done by varying the config.tcl. (Spaces were added between set and : in later runs)

![](Screenshots/Lab2/Screenshot_20240713_164353.png)
Flow failed due to incorrect env variable (documentation shows deprecated)
Default is now layer 3 and 4 according to documents. Also called VLAYER and HLAYER now.

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

## Lab 3 
Tasks for lab 3 include
1. Characterizing the inverter cell.
2. Spice deck creation.
3. Viewing Layers in the inverter LEF file.
4. Modifying parameters to correct DRC, and verify via documentation.


![](Screenshots/Lab3/Screenshot_20240715_192031.png)

Cloning the github repository containing the Inverter cell
```
git clone https://github.com/nickson-jose/vsdstdcelldesign.git
```


![](Screenshots/Lab3/Screenshot_20240715_192813.png)

Viewing the inverter in Magic using the command
```
magicsky sky130_inv.mag
```


![](Screenshots/Lab3/Screenshot_20240716_115134.png)

Verifying ports


![](Screenshots/Lab3/Screenshot_20240716_120408.png)

Extracting first to the ext format, setting ext2spice parameters, then generating a spice file.
```
extract all                                     *generates file with .ext*
```
```
ext2spice cthresh 0 rthresh 0                   *no file generated*
```
```
ext2spice                                       *.spice file generated*
```


![](Screenshots/Lab3/Screenshot_20240716_120250.png)

vsdstdcelldesign folder after above execution of extract all command


![](Screenshots/Lab3/Screenshot_20240716_120425.png)

folder after execution of ext2spice


![](Screenshots/Lab3/Screenshot_20240716_120505.png)

Viewing initial spice file generated by command ext2spice in magic. 


![](Screenshots/Lab3/Screenshot_20240716_121117.png)

Changing parameters to match our PMOS and NMOS, and adding evaluation parameters with nodes.


![](Screenshots/Lab3/Screenshot_20240716_121219.png)

running ngspice with sky130_inv.spice as file.

```
ngspice sky130_inv.spice
```

![](Screenshots/Lab3/Screenshot_20240716_121333.png)

Plotting output y against Time.

![](Screenshots/Lab3/Screenshot_20240716_121755.png)

Zoomed in value for 
Rise Transition (20% of maximum value to 80% of maximum value)   

```
x0 = 2.15506e-09, y0 = 0.659655

x0 = 2.19803e-09, y0 = 2.63931  

Rise Transition Time = 0.04297ns
```

![](Screenshots/Lab3/Screenshot_20240716_121958.png)

Zoomed in value for 
Fall Transition (80% of maximum value to 20% of maximum value)
```
x0 = 8.04014e-09, y0 = 2.63929

x0 = 8.06728e-09, y0 = 0.659661  

Fall Transition Time = 0.02714ns
```
![](Screenshots/Lab3/Screenshot_20240716_122233.png)

Zoomed in value for
Cell Rise propagation Delay
```
x0 = 6.15e-09, y0 = 1.65017

x0 = 6.18168e-09, y0 = 1.65017

Cell Rise Propagation Delay = 0.03168ns
```
![](Screenshots/Lab3/Screenshot_20240716_122522.png)

Zoomed in value for

Cell Fall propagation Delay
```
x0 = 8.05332e-09, y0 = 1.64999

x0 = 8.05003e-09, y0 = 1.65  

Cell Fall Propagation Delay = 0.00329ns
```
![](Screenshots/Lab3/Screenshot_20240716_165335.png)
Downloading magic drc Violating files.

![](Screenshots/Lab3/Screenshot_20240716_165655.png)
Viewing Metal 3 layers.

![](Screenshots/Lab3/Screenshot_20240716_165932.png)
Using a command to display cause of DRC violation. First select by hovering the cursor over the cell in question, then pressing 's' in the TKcon type:
```
drc why
```

![](Screenshots/Lab3/Screenshot_20240716_170303.png)

Opening the Poly file and viewing the layer and drc violation.


![](Screenshots/Lab3/Screenshot_20240716_170535.png)

Initial SKY130.tech file poly.9 parameters.


![](Screenshots/Lab3/Screenshot_20240716_170538.png)

Modified Parameters.


![](Screenshots/Lab3/Screenshot_20240716_170700.png)

Modified Parameters.


![](Screenshots/Lab3/Screenshot_20240716_171811.png)

Checking to see if DRC is violated for all test cases.


![](Screenshots/Lab3/Screenshot_20240716_172550.png)

Opening nwell.mag and viewing the CIF.


![](Screenshots/Lab3/Screenshot_20240716_172950.png)

Viewing the implementation of templayers which are the formations present only for the construction of the final layers.


![](Screenshots/Lab3/Screenshot_20240716_175615.png)

Initial N well parameters for DRC violations.


![](Screenshots/Lab3/Screenshot_20240716_180925.png)

Modified parameters for proper DRC violation in N well.


![](Screenshots/Lab3/Screenshot_20240716_181307.png)

Violation vs fixed implementation of N Well DRC.

## Lab 4 
Tasks for lab 4 include
1. Adding our previously characterized inverter cell in our layout.
2. Fixing any negative slack.
3. Performing Clock Tree Synthesis (CTS)
4. Finding final hold and sample slack as well as skew.

