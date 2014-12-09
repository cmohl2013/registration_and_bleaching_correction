registration_and_bleaching_correction
=====================================

ImageJ macro for importing a 2 frame timeseries and correcting for time shift and registration


The macro is part of a worklfow to measure growth of cells in 3D. A sample data set of neurons imaged with 2 photon microscopy is included in the repository ("data" folder).
The images were taken by Cordula Ulbrich (Petzold Group at German Center of neurodegenerative Disesased (DZNE), Bonn, Germany).

To be able to measure significant differences in cell volume, the time gap of the images is more than 10 h. Thus, the two frames are shifted and a drift correction is needed.
After shift correction, a histogram-based bleaching correction is applied.

The corrected data is exported to ics/ids format to conveniently import it to other image analysis applications. 



