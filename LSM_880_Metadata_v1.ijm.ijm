 // Import required macro extensions
run("Bio-Formats Macro Extensions");

// Open file
id=getTitle();
path=getDirectory("image");
Ext.setId(path+id);

// Get dimensions
Ext.getSizeX(sizeX);
Ext.getSizeY(sizeY);
Ext.getSizeZ(sizeZ);
Ext.getSizeC(sizeC);
Ext.getSizeT(sizeT);

// Get general metadata values
Ext.getMetadataValue("Information|Image|ComponentBitCount", componentBitCount);
Ext.getMetadataValue("Information|Document|CreationDate", creationDate);
Ext.getMetadataValue("Information|Instrument|Microscope|System", microscopeSystem);
Ext.getMetadataValue("Information|Instrument|Objective|Manufacturer|Model", objectiveId);
Ext.getMetadataValue("Information|Instrument|Objective|LensNA", objectiveLensNA);
Ext.getMetadataValue("Information|Image|S|Scene|Position|X", xPos);
Ext.getMetadataValue("Information|Image|S|Scene|Position|Y", yPos);
Ext.getMetadataValue("Information|Image|S|Scene|Position|Z", zPos);
Ext.getMetadataValue("DisplaySetting|Channel|ChannelUnit|ChannelType", modality);
Ext.getMetadataValue("Experiment|AcquisitionBlock|AcquisitionModeSetup|AcquisitionMode", acquisitionMode);
Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|AiryScanMagnification #1", airyMag);
Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|FrameTime #1", frameTime);
// Create summary text
summary = "=== Image Metadata Summary ===\n";
summary += "Image path: " + id + "\n";
summary += "Size X (px)...................................................... " + sizeX + "\n";
summary += "Size Y (px)...................................................... " + sizeY + "\n";
summary += "Slices (z)........................................................ "+ sizeZ +"\n";
summary += "Channels (c).................................................. "+sizeC + "\n";
summary += "Frames (t)...................................................... "+sizeT+"\n";

// Add general metadata values to the summary
summary += "\n=== General Information ===\n";
summary += "Microscope System......................................... " + microscopeSystem + "\n";
summary += "Modality.......................................................... " + modality + "\n";
summary += "Acquisition Mode............................................ "+acquisitionMode + "\n";
summary += "Component Bit Count..................................... " + componentBitCount + "\n";
summary += "Date of Acquisition......................................... " + creationDate + "\n";
summary += "Objective ID................................................... " + objectiveId + "\n";
summary += "Total magnification........................................ "+ airyMag + "\n";
summary += "Stage position (x,y,z)..................................... " + xPos + ", "+yPos+", "+zPos+"\n";
summary += "Frame interval ................................................"+frameTime +"\n";


// Add channel-specific metadata values to the summary
summary += "\n=== Channel Specific Information ===\n";
for (channel = 1; channel <= sizeC; channel++) {
    summary += "\n--- Channel " + channel + " ---\n";

    Ext.getMetadataValue("Information|Image|Channel|Wavelength #" + channel, wavelength);
    Ext.getMetadataValue("Information|Image|Channel|DetectionWavelength|Ranges #" + channel, detectionWavelengthRanges);
    Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Color #" + channel, color);
    Ext.getMetadataValue("Information|Instrument|Detector|Type #" + channel, detectorId);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ScanSpeed #" + channel, scanSpeed);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|PixelTime #" + channel, pixelTime);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ScanningMode #" + channel, scanningMode);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomX #" + channel, zoomX);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomY #" + channel, zoomY);
    Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Attenuator|Laser #" + channel, lightSourceId);
    Ext.getMetadataValue("Information|Image|Channel|Mode #" + channel, mode);
    Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter #" + channel, superResolutionParameter);
    Ext.getMetadataValue("Information|Image|Channel|PinholeSize #" + channel, pinholeSize);
    Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #" + channel, pinholeSizeAiry);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ScanningMode #" + channel, scanningMode);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|SampleRotation #" + channel, sampleRotation);
    Ext.getMetadataValue("Information|Image|Channel|Gain #" + channel, gain);
	Ext.getMetadataValue("Information|Processing|Airyscan|Channel|ParameterEstimationType #" + channel, processingType);
	Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter #" + channel, processingParameter);
	Ext.getMetadataValue("Experiment|AcquisitionBlock|MultiTrackSetup|TrackSetup|Detector|Filterset #" + channel, filterSet);
	Ext.getMetadataValue("Information|Processing|Airyscan|Channel|ParameterEstimationType #" + channel, autoProc);
	Ext.getMetadataValue("Information|Processing|Airyscan|Channel|DeconvolutionType #" + channel, deconType);
	
inputHex=color;
    red = parseInt(substring(inputHex, 1, 3), 16);
	green = parseInt(substring(inputHex, 3, 5), 16);
	blue = parseInt(substring(inputHex, 5, 7), 16);
if (red == 255 && green == 0 && blue == 0) {
    inputHex = "Red";
} else if (red == 0 && green == 255 && blue == 0) {
     inputHex = "Green";
} else if (red == 0 && green == 0 && blue == 255) {
     inputHex = "Blue";
} else if (red == 255 && green == 0 && blue == 255) {
     inputHex = "Magenta";
} else if (red == 0 && green == 255 && blue == 255) {
     inputHex = "Cyan";
} else if (red == 255 && green == 255 && blue == 0) {
     inputHex = "Yellow";
} else if (red == 255 && green == 255 && blue == 255) {
     inputHex = "White";
} else {
     inputHex = "RGB Color: (" + red + ", " + green + ", " + blue + ")";
}


summary += "Wavelength.................................................. " + round(wavelength) + "\n";
summary += "Light Source ID............................................ " + lightSourceId + "\n";
summary += "Filter Set:..................................................... " + filterSet + "\n";
summary += "Wavelength.................................................. " + round(wavelength) + "\n";
summary += "Light Source ID............................................. " + lightSourceId + "\n";
summary += "Filter Set:...................................................... " + filterSet + "\n";
summary += "Scanning Mode............................................. " + scanningMode + "\n";
//summary += "Scan Speed.................................................. " + scanSpeed + "\n";
summary += "Pixel Time..................................................... " + pixelTime + "\n";
summary += "Gain.............................................................. " + gain + "\n";
//summary += "Pinhole Size................................................... " + pinholeSize + "\n";
summary += "Pinhole Size Airy............................................ " + pinholeSizeAiry + "\n";
summary += "Detection Wavelength Ranges...................... " + detectionWavelengthRanges + "\n";
summary += "Detector ID..................................................... " + detectorId + "\n";
summary += "Hex Color....................................................... " + color + "\n"; 
summary += "RGB Color..................................................... " + inputHex + "\n"; 
summary += "Scanning Mode.............................................. " + scanningMode + "\n";
summary += "Sample Rotation............................................. " + sampleRotation + "\n";
summary += "Zoom X,Y......................................................... " + zoomX + ", " + zoomY + "\n";
summary += "Processing Mode............................................ " + deconType + " " + mode + "\n";
summary += "Super Resolution Parameter........................... " + autoProc + " / "  + superResolutionParameter + "\n";


    
}
// Generate a random number between 0 and 1
randomNumber = random()

// Check the random number and print the appropriate message
if (randomNumber <= 0.05) {
    print("ANDY IS GREAT");
} else {
    print("LSM 880 Metadata Reader\n");
}
// Print summary
print(summary);
