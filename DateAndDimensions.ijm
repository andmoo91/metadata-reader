// Import Bio-Formats plugins
run("Bio-Formats Macro Extensions");

// Define the folder containing the images
inputFolder = "/Users/andy/Desktop/ImageName/";
outputFolder = "/Users/andy/Desktop/ImageName/";

// Get a list of files in the folder
list = getFileList(inputFolder);

// Process each file
for (i = 0; i < list.length; i++) {
    file = inputFolder + list[i];
    Ext.setId(file);
    
    // Open the image using Bio-Formats Importer
    run("Bio-Formats Importer", "open=" + file + " autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
    
    // Get the metadata
    getDimensions(width, height, channels, slices, frames);
    c = channels;
    z = slices;
    t = frames;
    
    // Get the acquisition date
    Ext.getMetadataValue("Information|Document|CreationDate", acquisitionDate);
    if (acquisitionDate == "") {
        Ext.getMetadataValue("Information|Image|AcquisitionDateAndTime", acquisitionDate);
    }
    acquisitionDate = replace(acquisitionDate, ":", "-");
    acquisitionDate = replace(acquisitionDate, " ", "-"); // Change the date format to YYYY-MM-DD-HH-MM-SS

    // Extract only the YYYY-MM-DD portion
    acquisitionDate = substring(acquisitionDate, 0, 10);
    
    // Close the image
    close();
    
    // Create the new filename
    newFilename = acquisitionDate + "_C" + c + "_Z" + z + "_T" + t + "_" + list[i];
    
    // Rename and save the image file
    File.rename(file, outputFolder + newFilename);
}

// Display completion message
print("Batch processing complete.");
