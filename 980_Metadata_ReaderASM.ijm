// Import required macro extensions
run("Bio-Formats Macro Extensions");

// Open file
id = File.openDialog("Choose a file");
Ext.setId(id);

// Get dimensions
Ext.getSizeX(sizeX);
Ext.getSizeY(sizeY);
Ext.getSizeZ(sizeZ);
Ext.getSizeC(sizeC);
Ext.getSizeT(sizeT);

// Get general metadata values
Ext.getMetadataValue("Information|Image|ComponentBitCount", componentBitCount);
Ext.getMetadataValue("Information|Image|TotalMagnification", totalMagnification);
Ext.getMetadataValue("Information|Image|T|StartTime", startTime);
Ext.getMetadataValue("Information|Instrument|Microscope|Name", microscopeName);
Ext.getMetadataValue("Information|Instrument|Microscope|System", microscopeSystem);
Ext.getMetadataValue("Information|Instrument|Microscope|Type", microscopeType);
Ext.getMetadataValue("Information|Instrument|Objective|Id", objectiveId);
Ext.getMetadataValue("Information|Instrument|Objective|Immersion", objectiveImmersion);
Ext.getMetadataValue("Information|Instrument|Objective|ImmersionRefractiveIndex", objectiveImmersionRefractiveIndex);
Ext.getMetadataValue("Information|Instrument|Objective|LensNA", objectiveLensNA);
Ext.getMetadataValue("Information|Instrument|Objective|Manufacturer|Model", objectiveManufacturerModel);
Ext.getMetadataValue("Information|Instrument|Objective|Name", objectiveName);
Ext.getMetadataValue("Information|Instrument|Objective|NominalMagnification", objectiveNominalMagnification);
Ext.getMetadataValue("Information|Instrument|Objective|PupilGeometry", objectivePupilGeometry);
Ext.getMetadataValue("Information|Instrument|Objective|WorkingDistance", objectiveWorkingDistance);
Ext.getMetadataValue("Experiment|AcquisitionBlock|ZStackSetup|SetupExtension|LsmZStackSetup|UseZPiezo", useZPiezo);

// Create summary text
summary = "=== Image Metadata Summary ===\n";
summary += "Image path: " + id + "\n";
summary += "Dimensions (X, Y, Z, C, T): " + sizeX + ", " + sizeY + ", " + sizeZ + ", " + sizeC + ", " + sizeT + "\n";

// Add general metadata values to the summary
summary += "\n=== General Information ===\n";
summary += "Component Bit Count: " + componentBitCount + "\n";
summary += "Total Magnification: " + totalMagnification + "\n";
summary += "Start Time: " + startTime + "\n";
summary += "Microscope Name: " + microscopeName + "\n";
summary += "Microscope System: " + microscopeSystem + "\n";
summary += "Microscope Type: " + microscopeType + "\n";
summary += "Objective ID: " + objectiveId + "\n";
summary += "Objective Immersion: " + objectiveImmersion + "\n";
summary += "Objective Immersion Refractive Index: " + objectiveImmersionRefractiveIndex + "\n";
summary += "Objective Lens NA: " + objectiveLensNA + "\n";
summary += "Objective Manufacturer Model: " + objectiveManufacturerModel + "\n";
summary += "Objective Name: " + objectiveName + "\n";
summary += "Objective Nominal Magnification: " + objectiveNominalMagnification + "\n";
summary += "Objective Pupil Geometry: " + objectivePupilGeometry + "\n";
summary += "Objective Working Distance: " + objectiveWorkingDistance + "\n";
summary += "Use Z Piezo: " + useZPiezo + "\n";

// Add channel-specific metadata values to the summary
summary += "\n=== Channel Specific Information ===\n";
for (channel = 1; channel <= sizeC; channel++) {
    summary += "\n--- Channel " + channel + " ---\n";

    Ext.getMetadataValue("Information|Image|Channel|Wavelength #" + channel, wavelength);
    Ext.getMetadataValue("Information|Image|Channel|DetectionWavelength|Ranges #" + channel, detectionWavelengthRanges);
    Ext.getMetadataValue("Information|Image|Channel|Color #" + channel, color);
    Ext.getMetadataValue("Information|Image|Channel|Detector|Id #" + channel, detectorId);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ScanSpeed #" + channel, scanSpeed);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|PixelTime #" + channel, pixelTime);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ScanningMode #" + channel, scanningMode);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomX #" + channel, zoomX);
    Ext.getMetadataValue("Information|Image|Channel|LaserScanInfo|ZoomY #" + channel, zoomY);
    Ext.getMetadataValue("Information|Image|Channel|LightSource|Id #" + channel, lightSourceId);
    Ext.getMetadataValue("Information|Image|Channel|Mode #" + channel, mode);
    Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter #" + channel, superResolutionParameter);
    Ext.getMetadataValue("Information|Image|Channel|PinholeSize #" + channel, pinholeSize);
    Ext.getMetadataValue("Information|Image|Channel|PinholeSizeAiry #" + channel, pinholeSizeAiry);
    Ext.getMetadataValue("Information|Image|Channel|Voltage #" + channel, voltage);

inputHex = color; // example input hex color code
red = parseInt(inputHex.substring(3,5), 16);
green = parseInt(inputHex.substring(5,7), 16);
blue = parseInt(inputHex.substring(7,9), 16);
color2="RGB Color: (" + red + ", " + green + ", " + blue + ")";


    summary += "Wavelength: " + wavelength + "\n";
    summary += "Light Source ID: " + lightSourceId + "\n";
    summary += "Scan Speed: " + scanSpeed + "\n";
    summary += "Pixel Time: " + pixelTime + "\n";
   
    summary += "Pinhole Size: " + pinholeSize + "\n";
    summary += "Pinhole Size Airy: " + pinholeSizeAiry + "\n";
    summary += "Detection Wavelength Ranges: " + detectionWavelengthRanges + "\n";
    summary += "Detector ID: " + detectorId + "\n";
    summary += "Voltage: " + voltage + "\n";
    summary += "Hex Color: " + color + "\n"; 
    summary += "RGB Color: " + color2 + "\n"; 
    
  
    summary += "Scanning Mode: " + scanningMode + "\n";
    summary += "Zoom X: " + zoomX + "\n";
    summary += "Zoom Y: " + zoomY + "\n";
    
    summary += "Mode: " + mode + "\n";
    summary += "Super Resolution Parameter: " + superResolutionParameter + "\n";
    
}
// Generate a random number between 0 and 1
randomNumber = random()

// Check the random number and print the appropriate message
if (randomNumber <= 0.15) {
    print("ANDY IS GREAT");
} else {
    print("IMAGE METADATA SUMMARY");
}
// Print summary
print(summary);
