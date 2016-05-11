// Create a global variable (actually an object) to hold the picture
PImage scene;

// Runs once
void setup() {

  // Create canvas
  size(800, 500);

  // Load the picture into the scene object 
  //scene = loadImage("fall_forest.jpg");
  scene = loadImage("summer_field.jpg");
  
  // Change colour mode to HSB
  colorMode(HSB, 360, 100, 100, 100);
  
  // No border on shapes drawn
  noStroke();
  
}

// Runs repeatedly
void draw() {

  // Display the contents of the scene object, top-left corner of image at (0, 0)
  image(scene, 0, 0);

  // Make the pixels of the image available for inspect
  loadPixels();

  // Translate current pixel mouse is hovering over into a position in the pixels[] array
  int currentRow = mouseY;
  int currentColumn = mouseX;
  int pixelPosition = currentRow * width + currentColumn;
  
  // Get the hue of the pixel the mouse is pointing at
  float currentHue = hue(pixels[pixelPosition]);
  float currentSaturation = saturation(pixels[pixelPosition]);
  float currentBrightness = brightness(pixels[pixelPosition]);
  
  // Report the results
  fill(0);
  text("Hue of current pixel is: " + currentHue, width - 250, 25);
  text("Saturation of current pixel is: " + currentSaturation, width - 250, 50);
  text("Brightness of current pixel is: " + currentBrightness, width - 250, 75);
  
}

void mouseClicked() {
  
  // Show the sum of brightness for a single row
  loadPixels();
  int row = mouseY;

  // Brightness
  int totalBrightness = 0;
  for (int column = 0; column < width; column ++) {
    int position = row * width + column;
    totalBrightness += brightness(pixels[position]);
  }
  float averageBrightness = (float) totalBrightness / width;
  println("total brightness for row " + row + " is: " + totalBrightness);
  println("average brightness for row " + row + " is: " + averageBrightness);
  
  // Hue
  int totalHue = 0;
  for (int column = 0; column < width; column ++) {
    int position = row * width + column;
    totalHue += hue(pixels[position]);
  }
  float averageHue = (float) totalHue / width;
  println("total hue for row " + row + " is: " + totalHue);
  println("average hue for row " + row + " is: " + averageHue);

  // Saturation
  int totalSaturation = 0;
  for (int column = 0; column < width; column ++) {
    int position = row * width + column;
    totalSaturation += saturation(pixels[position]);
  }
  float averageSaturation = (float) totalSaturation / width;
  println("total saturation for row " + row + " is: " + totalSaturation);
  println("average saturation for row " + row + " is: " + averageSaturation);
  println("====================================");
  
  // Add code for detecting whether it is "blue sky" or "fluffy clouds" here
  // Psuedocode is:
  // 
  // When the average hue is in the range 205 to 220
  //  AND the average brightness is in the range 80 to 90
  //        -- this could be blue sky or it might be fluffy clouds
  //        When the average saturation is in the range 0 to 20
  //            -- these are fluffy clouds
  //        when the average saturation is in the range 60 to 90
  //            -- this is blue sky
  //

}