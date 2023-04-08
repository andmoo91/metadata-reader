// Import required macro extensions
run("Bio-Formats Macro Extensions");

// Prompt the user to select a directory
dir = getDirectory("Select a Directory");

// Get the list of files in the directory
list = getFileList(dir);

// Initialize the output
output = "Filename,Channels,Z slices,Time frames,X size,Y size,X pixel size (microns),Y pixel size (microns),Z pixel size (microns)\n";

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
    
    
    

    // Append the information to the output
    output += list[i] + "," + sizeC + "," + sizeZ + "," + sizeT + "," + sizeX + "," + sizeY + "," + pixelSizeX + "," + pixelSizeY + "," + pixelSizeZ + "\n";
}

// Save the output as a .csv file
savePath = dir + "metadata_summary.csv";
File.saveString(output, savePath);

// Notify the user that the process has been completed
print("Metadata summary saved as: " + savePath);
