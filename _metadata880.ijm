run("Bio-Formats Macro Extensions");
title=getTitle();
path=getDirectory("image");
  if (isOpen("Log")) {
         selectWindow("Log");
         run("Close" );
    }
print("************************************************************");
print("Relevant metadata for image " + "'"+title+"'");
print("----------");


Ext.setId(path+title);

//get the easy stuff
  Ext.getSizeX(sizeX); // x size
  Ext.getSizeY(sizeY); // y size
  Ext.getSizeZ(sizeZ); // z size
  Ext.getSizeC(sizeC); // c size
  Ext.getSizeT(sizeT); // t size
getDimensions(width, height, channels, slices, frames); // prob easier haha

// obvious parameters
Ext.getMetadataValue("Information|Document|Title #1", image_title); // Title of the image
Ext.getMetadataValue("Information|Document|CreationDate #1", date_of_acquisition); // when you took it
Ext.getMetadataValue("Information|Image|Channel|Mode #1", image_mode);
Ext.getMetadataValue("Information|Image|Channel|AcquisitionMode #1", image_mode_alt);// mode of image
Ext.getMetadataValue("Information|Image|Channel|ChannelType #1", image_type); // type of image
Ext.getMetadataValue("Information|Instrument|Microscope|System #1", scope_model); // type of microscope
Ext.getMetadataValue("Information|Instrument|Objective|Manufacturer|Model #1:", objective_model); //type of objective
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|Objective", alt_obj); // alt type of objective
Ext.getMetadataValue("Information|Image|ComponentBitCount #1", bit_depth);
Ext.getMetadataValue("Information|Document|CreationDate", alt_date);
Ext.getMetadataValue("Information|Image|Channel|ChannelType", image_type);
Ext.getMetadataValue("DisplaySetting|Channel|ChannelUnit|ChannelType", alt_modality);
Ext.getMetadataValue("", alt_scope);

if (date_of_acquisition ==0) {
	date_of_acquisition = alt_date;
	}
	
if (scope_model ==0) {
	scope_model = "I'm not sure, but probably the 980";
	}	

if (objective_model ==0) {
	objective_model = alt_obj;
	}	
	
	if (image_type ==0) {
	image_type = alt_modality;
	}

//block one of ingo
	print("Image path:                  " + path);
	print("Image title:                   " + title);
	print("Acquisition date:         " + date_of_acquisition);
	print("Microscope used:        " + scope_model);
	print("Objective lens:             " + objective_model);
	print("Imaging modality:       " + image_mode_alt+"  "+image_type);


ImageBitDepth = bitDepth() ;


print("----------");


print("Image size:                  " + sizeX + " by " + sizeY + " pixels");
print("Image type:                  " +ImageBitDepth + " bit");
print("Image dimensions:      " +sizeC+" channel(s) "+sizeT+" frame(s) "+sizeZ+" slice(s)");
print("----------");


//get a bunch of info from the metadata// 
Ext.getMetadataValue("Information|Document|Name #1", names);
Ext.getMetadataValue("Information|Image|Channel|ChannelType #1", image_type);
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|Objective #1", objective); // objective lens used
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|AiryScanMode #1", scan_mode); // airyscan mode
Ext.getMetadataValue("Information|Image|Channel|ExcitationWavelength #1",ex1); // excitation wavelength
Ext.getMetadataValue("Information|Image|Channel|ExcitationWavelength #2",ex2);
Ext.getMetadataValue("Information|Image|Channel|ExcitationWavelength #3",ex3);
Ext.getMetadataValue("Information|Image|Channel|ExcitationWavelength #4",ex4);
Ext.getMetadataValue("Information|Image|Channel|EmissionWavelength #1",em1); // emission wavelength
Ext.getMetadataValue("Information|Image|Channel|EmissionWavelength #2",em2);
Ext.getMetadataValue("Information|Image|Channel|EmissionWavelength #3",em3);
Ext.getMetadataValue("Information|Image|Channel|EmissionWavelength #4",em4);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Filterset #1", filter_1); //Filter sets used
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Filterset #2", filter_2);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Filterset #3", filter_3);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Filterset #4", filter_4);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|BeamSplitter|Filter #1", alt_filter_1) // alternative storage location
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|BeamSplitter|Filter #2", alt_filter_2)
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|BeamSplitter|Filter #3", alt_filter_3)
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|BeamSplitter|Filter #4", alt_filter_4)
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|FilterMode #1", filter_type); // i.e. frame or line
Ext.getMetadataValue ("Experiment|AcquisitionBlock|AcquisitionModeSetup|FilterMethod #1", filter_method); // i.e. average or sum
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|FilterSamplingNumber #1", filter_number); // i.e. number of filters
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomX #1", zoom_x); // zoom factor in X
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomY #1", zoom_y); // zoom factor in Y
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Color #1", color_1);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Color #2", color_2);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Color #3", color_3);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Color #4", color_4);
Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #1", pinhole_1);
Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #2", pinhole_2);
Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #3", pinhole_3);
Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #4", pinhole_4);
Ext.getMetadataValue("Information|Image|SizeC #1", c_size);
Ext.getMetadataValue("Information|Image|SizeX #1", x_size);
Ext.getMetadataValue("Information|Image|SizeY #1", y_size);
Ext.getMetadataValue("Information|Image|SizeT #1", t_size);
Ext.getMetadataValue("Information|Image|SizeZ #1", z_size);
Ext.getMetadataValue("BitsPerPixel", bit_depth);
Ext.getMetadataValue("Information|Instrument|Microscope|System #1",scope);
Ext.getMetadataValue("Information|Instrument|LightSource|Manufacturer|Model #1", laser_1);
Ext.getMetadataValue("Information|Instrument|LightSource|Manufacturer|Model #2", laser_2);
Ext.getMetadataValue("Information|Instrument|LightSource|Manufacturer|Model #3", laser_3);
Ext.getMetadataValue("Information|Instrument|LightSource|Manufacturer|Model #4", laser_4);
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|ScalingX #1", xy_pix_size); // x pixel size in...meters?
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|ScalingZ #1", z_pix_size); // z pixel size in...yeah I guess meters....
Ext.getMetadataValue("Information|Image|PixelType #1", pxtype);
Ext.getMetadataValue("Information|Processing|StructuredIllumination|Rotations #1", sim_rotations);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Attenuator|Laser #1", laser_alt_1);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Attenuator|Laser #2", laser_alt_2);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Attenuator|Laser #3", laser_alt_3);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Attenuator|Laser #4", laser_alt_4);
Ext.getMetadataValue("Experiment|AcquisitionBlock|Laser|LaserPower #1", laser_power_1);
Ext.getMetadataValue("Experiment|AcquisitionBlock|Laser|LaserPower #2", laser_power_2);
Ext.getMetadataValue("Experiment|AcquisitionBlock|Laser|LaserPower #3", laser_power_3);
Ext.getMetadataValue("Experiment|AcquisitionBlock|Laser|LaserPower #4", laser_power_4);
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|FrameTime #1", frame_time);
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|LineTime #1", line_time);
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|PixelTime #1", pixel_time);
ScaledXY = 1000000*xy_pix_size;
ScaledZ = 1000000*z_pix_size;
alaser_power_1 = 100*laser_power_1;
alaser_power_2 = 100*laser_power_2;
alaser_power_3 = 100*laser_power_3;
alaser_power_4 = 100*laser_power_4;
penny_width = 1520;
football_field = 91440000;
earth_size = 4.0075e+13;
lucky_draw = round(2*random());
scaled_image_width = ScaledXY*sizeX;

//GENERAL INFORMATION
getPixelSize(unit, pixelWidth, pixelHeight);
print("Unit:                                "+unit);
print(unit+" per xy pixel:    "+pixelWidth);
pxperu=1/pixelWidth;
print("Pixels per micron:         "+pxperu);

print("z pixel size:                    " + ScaledZ + " µm per pixel");

print("----------");

print("Unit window size:          " + ScaledXY*sizeX + " by " + ScaledXY*sizeY + " µm.");
if (lucky_draw == 0) {    
	print("                                        Wow, that's " + (scaled_image_width/penny_width)*100 + " percent of the width of a U.S. penny!");
}
if (lucky_draw ==1) {    
	print("                                        Wow, that's " + (scaled_image_width/football_field)*100 + " percent of a football field!");
}
if (lucky_draw ==2) {
	print("                                        If you duplicated this image " + earth_size/scaled_image_width + " times and lined the images up end-to-end, they would wrap around the world.");
}
print("----------");
print("Scan mode:                    "+filter_method + " of " + filter_number + " " + filter_type);
print("Pixel dwell time:            " + pixel_time + " sec");
print("----------");
// frame information
if (sizeT>0) {
	print("Frame interval = " + Stack.getFrameInterval() + " frames per second");
}

print("----------");


// Channel information
if (filter_1==0) {
	print("Channel 1 excitation wavelength = " + round(ex1) + " nm");
	print("Channel 1 Laser/power = " + laser_alt_1 + " laser at " + alaser_power_1 + " % power,");
	print("Channel 1 emission wavelength = " + round(em1) + " nm");
	print("Channel 1 emission filter(s) = " + alt_filter_1);
	print("Channel 1 is psuedocolored: " + color_1);
}else {
	print("Channel 1 excitation wavelength = " + round(ex1) + " nm");
	print("Channel 1 Laser/power = " + laser_alt_1 + " laser at " + alaser_power_1 + " % power,");
	print("Channel 1 emission wavelength = " + round(em1) + " nm");
	print("Channel 1 emission filter(s) = " + filter_1);
	print("Channel 1 is psuedocolored: " + color_1);
}

print("-------------");

if (ex2!=0) {
	if (filter_2==0) {
	print("Channel 2 excitation wavelength = " + round(ex2) + " nm");
	print("Channel 2 Laser/power = " + laser_alt_2 + " laser at " + alaser_power_2 + " % power,");
	print("Channel 2 emission wavelength = " + round(em1) + " nm");
	print("Channel 2 emission filter(s) = " + alt_filter_2);
	print("Channel 2 is psuedocolored: " + color_2);
	}else {
	print("Channel 2 excitation wavelength = " + round(ex2) + " nm");
	print("Channel 2 Laser/power = " + laser_alt_2 + " laser at "+ alaser_power_2 + " % power,");
	print("Channel 2 emission wavelength = " + round(em2) + " nm");
	print("Channel 2 emission filter(s) = " + filter_2);
	print("Channel 2 is psuedocolored: " + color_2);
	}
}

print("-------------");

if (ex3!=0) {
	if (filter_3==0) {
	print("Channel 3 excitation wavelength = " + round(ex3) + " nm");
	print("Channel 3 Laser/power = " + laser_alt_3 + " laser at " + alaser_power_3 + " % power,");
	print("Channel 3 emission wavelength = " + round(em3) + " nm");
	print("Channel 3 emission filter(s) = " + alt_filter_3);
	print("Channel 3 is psuedocolored: " + color_3);
	}else {
	print("Channel 3 excitation wavelength = " + round(ex3) + " nm");
	print("Channel 3 Laser/power = " + laser_alt_3 + " laser at "+ alaser_power_3 + " % power,");
	print("Channel 3 emission wavelength = " + round(em3) + " nm");
	print("Channel 3 emission filter(s) = " + filter_3);
	print("Channel 3 is psuedocolored: " + color_3);
	}
}
print("-------------");
if (ex4!=0) {
	if (filter_4==0) {
	print("Channel 4 excitation wavelength = " + round(ex4) + " nm");
	print("Channel 4 Laser/power = " + laser_alt_4 + " laser at " + alaser_power_4 + " % power,");
	print("Channel 4 emission wavelength = " + round(em4) + " nm");
	print("Channel 4 emission filter(s) = " + alt_filter_4);
	print("Channel 4 is psuedocolored: " + color_4);
	}else {
	print("Channel 4 excitation wavelength = " + round(ex4) + " nm");
	print("Channel 4 Laser/power = " + laser_alt_4 + " laser at "+ alaser_power_4 + " % power,");
	print("Channel 4 emission wavelength = " + round(em4) + " nm");
	print("Channel 4 emission filter(s) = " + filter_4);
	print("Channel 4 is psuedocolored: " + color_4);
	}
}
print("************************************************************");
//make the outpu a table in prog
//mArray=newArray(image_title, date_of_acquisition);
//Table.create("metadata"+title);
//Table.setColumn("Information", mArray);