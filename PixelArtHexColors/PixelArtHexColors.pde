import java.util.Arrays;

int PixelWidthAndHeight = 10;
String HCGString;
ArrayList<String> HCGList;
PImage HCGImage;

Boolean redraw = true;
int count = 0;

void setup(){
    size(800,800);
    background(0);
}

void draw(){
    if(redraw){
        int TotalPixels = PixelWidthAndHeight * PixelWidthAndHeight;

        HexColorGenerator HCP = new HexColorGenerator();
        String HCPString = HCP.main(TotalPixels);
        HCGList = new ArrayList<>(Arrays.asList(HCPString.split(",")));//create an array from a string using the comma (,) to separate it
        HCGImage = new PImage(PixelWidthAndHeight, PixelWidthAndHeight); //create an empty image
        HCGImage.loadPixels(); //load the pixels from an image

        for(int i = 0;i< TotalPixels;i++){
          String pixelcolor = HCGList.get(i); //read the colors one by one from the Array created from the HCGString 
          // println(i+ " " + pixelcolor);
          HCGImage.pixels[i] = unhex(pixelcolor);//convert the hexadecimal string into an RGB color usable by processing
        }  
        HCGImage.updatePixels();//update (save) the new color data in the image
        image(HCGImage, 50, 20, TotalPixels,TotalPixels);//draw the image onto the screen at location (50,20) and scaled up to TotalPixels bits x TotalPixels bits

        redraw = !redraw;
    }
}

import java.util.Random;

public class HexColorGenerator {

    String main(int totalPixels) {
        int numberOfColors = totalPixels;
        StringBuilder hexColors = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < numberOfColors; i++) {
            // Generate a random 24-bit integer (representing RGB)
            int colour = random.nextInt(0xFFFFFF + 1);
            // Convert to hexadecimal string with leading zeros
            String hexColor = String.format("%06X", colour);
            hexColors.append(hexColor);
            if (i < numberOfColors - 1) {
                hexColors.append(","); // Add comma separator except for the last color
            }
        }

        System.out.println(count + ": " + hexColors.toString());
        return hexColors.toString();
    }
}

void mousePressed(){
  count++;
  redraw = !redraw;
}


///  START OF SMILEY///////////////////////////
/* SMILEY FACE - https://www.pixilart.com/draw/8x8-fd09fdff3db2b99

This is an 8 x 8 image defined by hexadecimal color values
yellow color in hex: fff200
black color in hex:  00000


fff200,fff200,fff200,fff200,fff200,fff200,fff200,fff200
fff200,fff200,000000,fff200,fff200,000000,fff200,fff200
fff200,fff200,000000,fff200,fff200,000000,fff200,fff200
fff200,fff200,000000,fff200,fff200,000000,fff200,fff200
000000,fff200,fff200,fff200,fff200,fff200,fff200,000000
000000,000000,fff200,fff200,fff200,fff200,000000,000000
fff200,000000,000000,fff200,fff200,000000,000000,fff200
fff200,fff200,000000,000000,000000,000000,fff200,fff200


*/

String smileString = "fff200,fff200,fff200,fff200,fff200,fff200,fff200,fff200,fff200,fff200,000000,fff200,fff200,000000,fff200,fff200,fff200,fff200,000000,fff200,fff200,000000,fff200,fff200,fff200,fff200,000000,fff200,fff200,000000,fff200,fff200,000000,fff200,fff200,fff200,fff200,fff200,fff200,000000,000000,000000,fff200,fff200,fff200,fff200,000000,000000,fff200,000000,000000,fff200,fff200,000000,000000,fff200,fff200,fff200,000000,000000,000000,000000,fff200,fff200";

///  END OF SMILEY///////////////////////////