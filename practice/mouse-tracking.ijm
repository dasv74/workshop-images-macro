run("Z Project...", "projection=[Max Intensity]");
imageCalculator("Subtract create 32-bit stack", "mouse.tif","MAX_mouse.tif");
rename("mouse-background")
run("Maximum...", "radius=2 stack");
run("Minimum...", "radius=2 stack");
run("Median...", "radius=6 stack");
run("8-bit");
run("Make Binary", "calculate");
run("Set Measurements...", "area center fit add redirect=None decimal=2");
run("Analyze Particles...", "size=100-Infinity show=[Overlay Outlines] display stack");

x=newArray(nResults)
y=newArray(nResults)
for (i=0; i<nResults;i++) {
	x[i]=getResult("XM", i);
	y[i]=getResult("YM", i);
}
selectWindow("mouse.tif");
makeSelection("polyline", x, y);

// Produce exploration image
selectWindow("mouse.tif");
run("Z Project...", "projection=[Min Intensity]");
rename("Exploration");
