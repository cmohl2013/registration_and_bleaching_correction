/*
imageJ macro

In this example workflow,  two time frames of a 3D timeseries from single tiff images 
are imported and corrected for shift and bleaching.

author:
Christoph Moehl
christoph.moehl@dzne.de
 
 */




//####initialization

input_dir = "/user_docs_local/documents_local/Images/2911 2/submission/data/"; //folder with single z slices
output_dir = "/user_docs_local/documents_local/Images/2911 2/submission/data/reg"; //folder to save corrected image stack

n_zslices = 101; // nr of z slices

// names of subfolders for each time frame
dir_frame0 = "CFP0";
dir_frame1 = "CFP1";


//####import
run("Image Sequence...", "open=[" + input_dir + dir_frame0 + "] number=" + n_zslices + " starting=1 increment=1 scale=100 file=[] sort");
title_frame0 = getTitle(); 
run("Image Sequence...", "open=[" + input_dir + dir_frame1 + "] number=" + n_zslices + " starting=1 increment=1 scale=100 file=[] sort");
title_frame1 = getTitle();


//#### structuring image data to a z-stack with one channel and two time frames
run("Merge Channels...", "c1=" + title_frame0 + " c2=" + title_frame1 + " create");
run("Stack to Hyperstack...", "order=xyczt(default) channels=2 slices=" + n_zslices + " frames=1 display=Color convert");
run("Re-order Hyperstack ...", "channels=[Frames (t)] slices=[Slices (z)] frames=[Channels (c)]");

//#### porcessing: drift correction and bleaching correction
print("start registration"); //correct for shift between frames 1 and 2
run("Correct 3D drift", "choose=[" + output_dir + "] channel=1");
print("start bleach corr");
run("Bleach Correction", "correction=[Histogram Matching]");//correct for bleaching
print("finished");

//#### export as image cytometry format
run("Bio-Formats Exporter", "save=[" + output_dir + "registered_bl_corrected.ids]")
