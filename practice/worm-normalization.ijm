// This macro is applying a min-max normalization to all images
run("Close All");
dir_in = getDirectory("Choose Source Directory ");
dir_out= getDirectory("Choose Output Directory ");
list = getFileList(dir_in);
for (i=0; i<list.length; i++) { 
	if (endsWith(list[i], ".tif") || endsWith(list[i], ".TIF")) {
		open(dir_in+list[i]);
		rename("input");
		run("32-bit");
		getStatistics(area, mean, min, max, std, histogram);
		print(i, area, mean, min, max, std);
		run("Subtract...", "value=" + min + " slice");
		run("Divide...", "value=" + (max-min) + " slice");
		run("Multiply...", "value=255 slice");
		save(dir_out+list[i]);
		close();
	}
}
