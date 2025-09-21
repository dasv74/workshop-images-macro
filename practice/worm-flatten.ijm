// This macro is removing the estimated background
run("Close All");
dir_in = getDirectory("Choose Source Directory ");
dir_out= getDirectory("Choose Output Directory ");
setBatchMode(true); // True: fast processing, no display of images
list = getFileList(dir_in);
for (i=0; i<list.length; i++) {	
	if (endsWith(list[i], ".tif") || endsWith(list[i], ".TIF")) {
		showProgress(i+1, list.length); 
		open(dir_in+list[i]);
  		rename("input");
		run("Duplicate...", "title=gaussian");
		run("Gaussian Blur...", "sigma=30");
		imageCalculator("Subtract create 32-bit", "input","gaussian");
		save(dir_out+list[i]); close();	
		selectWindow("gaussian"); close();
		selectWindow("input"); close();
	}
}
