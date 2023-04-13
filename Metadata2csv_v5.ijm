// Import required macro extensions
run("Bio-Formats Macro Extensions");

// Prompt the user to select a directory
dir = getDirectory("Select a Directory");

// Get the list of files in the directory
list = getFileList(dir);

// Prompt the user to select a destination directory
destinationDir = getDirectory("Select Destination Directory for the CSV File");

// Prompt the user to input a filename for the CSV file
csvFileName = getString("Enter a name for the CSV file", "metadata_summary.csv");

// Initialize the output
output = "Filename,Channels,Z slices,Time frames,X size,Y size,X pixel size (microns),Y pixel size (microns),Z pixel size (microns),Acquisition Date,Microscope Type,Objective Used,Mode,Parameter\n";

for (i = 0; i < list.length; i++) {
    file = dir + list[i];

    // Set the file ID for Bio-Formats Macro Extensions
    Ext.setId(file);

    // Get dimensions
    Ext.getSizeX(sizeX);
    Ext.getSizeY(sizeY);
    Ext.getSizeZ(sizeZ);
    Ext.getSizeC(sizeC);
    Ext.getSizeT(sizeT);

    // Get pixel sizes
    Ext.getPixelsPhysicalSizeX(pixelSizeX)
    Ext.getPixelsPhysicalSizeY(pixelSizeY);
    Ext.getPixelsPhysicalSizeZ(pixelSizeZ);

    // Get microscope type and objective used
    Ext.getMetadataValue("Information|Instrument|Microscope|System", scopeID);
	Ext.getMetadataValue("Information|Instrument|Objective|Manufacturer|Model", objectiveID);

zeiss880 = "880 Airyscan";
zeiss980 = "980 Airyscan";
ElyraSIM = "Elyra SIM";

	if (scopeID=="LSM 880 Indimo, AxioObserver") {
		scopeID = zeiss880;
		if (sizeC == 1)  {
		Ext.getMetadataValue("Information|Image|Channel|Mode", mode);
   		Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter", parameter);
		} else { 
			Ext.getMetadataValue("Information|Image|Channel|Mode #" + sizeC, mode);
			Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter #" + sizeC, parameter);
		}
	} else if (scopeID=="LSM 800") {
		scopeID = zeiss980;
		if (sizeC == 1)  {
		Ext.getMetadataValue("Information|Image|Channel|Mode", mode);
   		Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter", parameter);
		} else { 
			Ext.getMetadataValue("Information|Image|Channel|Mode #" + sizeC, mode);
			Ext.getMetadataValue("Information|Processing|Airyscan|Channel|SuperResolutionParameter #" + sizeC, parameter);
		}
 

	} else if (scopeID=="Andor1, AxioObserver") {
		scopeID = ElyraSIM;
		mode = "SIM";
		parameter = "SIM";
	}


       // Get the acquisition date
    Ext.getMetadataValue("Information|Document|CreationDate", acquisitionDate);
    if (acquisitionDate == "") {
        Ext.getMetadataValue("Information|Image|AcquisitionDateAndTime", acquisitionDate);
    }
    acquisitionDate = replace(acquisitionDate, ":", "-");
    acquisitionDate = replace(acquisitionDate, " ", "-"); // Change the date format to YYYY-MM-DD-HH-MM-SS

    // Extract only the YYYY-MM-DD portion
    acquisitionDate = substring(acquisitionDate, 0, 10);

    // Append the information to the output
    output += list[i] + "," + sizeC + "," + sizeZ + "," + sizeT + "," + sizeX + "," + sizeY + "," + pixelSizeX + "," + pixelSizeY + "," + pixelSizeZ + "," +acquisitionDate+ "," + scopeID + "," + objectiveID + ","+ mode +","+ parameter+ "\n";

    // Print the progress to the log
    print("Processing image " + (i + 1) + " of " + list.length + ": " + list[i]);
}

// Save the output as a .csv file
savePath = destinationDir + csvFileName;
File.saveString(output, savePath);

// Notify the user that the process has been completed
print("Metadata summary saved as: " + savePath);