// Import Bio-Formats plugins
run("Bio-Formats Macro Extensions");

// Prompt the user to select a folder
inputFolder = getDirectory("Select the folder containing the images");
outputFolder = inputFolder;

// Get a list of files in the folder
list = getFileList(inputFolder);

// Process each file
for (i = 0; i < list.length; i++) {
    file = inputFolder + list[i];
    Ext.setId(file);

    // Get the OME core metadata
   	Ext.getSizeX(sizeX);
	Ext.getSizeY(sizeY);
	Ext.getSizeZ(sizeZ);
	Ext.getSizeC(sizeC);
	Ext.getSizeT(sizeT);


    c = sizeC;
    z = sizeZ;
    t = sizeT;
    
    // Get the acquisition date
    Ext.getMetadataValue("Information|Document|CreationDate", acquisitionDate);
    if (acquisitionDate == "") {
        Ext.getMetadataValue("Information|Image|AcquisitionDateAndTime", acquisitionDate);
    }
    acquisitionDate = replace(acquisitionDate, ":", "-");
    acquisitionDate = replace(acquisitionDate, " ", "-"); // Change the date format to YYYY-MM-DD-HH-MM-SS

    // Extract only the YYYY-MM-DD portion
    acquisitionDate = substring(acquisitionDate, 0, 10);
    
    // Create the new filename
    newFilename = acquisitionDate + "_C" + c + "_Z" + z + "_T" + t + "_" + list[i];
    
    // Rename and save the image file
    File.rename(file, outputFolder + newFilename);
}

// Display completion message
print("Batch processing complete.");
