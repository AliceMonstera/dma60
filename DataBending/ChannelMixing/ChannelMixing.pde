PImage img;

void setup() {
  size(643, 360);
  img=loadImage("rainbow.jpg");
  image(img, 0, 0);
    
  for (int k = 0; k < img.pixels.length; k++) {
    color l = img.pixels[k];
    float r = red(l);
    float g = green(l);
    float b = blue(l);

    // Swap Red and Blue channels
    img.pixels[k] = color(b,g,r);
  }
  
  for (int y = 0; y<height; y+=1 ) {
    for (int x = 0; x<width; x+=1) {
      int loc = x + y*img.width;
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (255);
      float av = ((r+g)/3.0);

    pushMatrix();
    translate(x,y);
      stroke(r,g,b);
      if (r > 100 && r < 255) {
        line(0,0,(av-255)/6,0); //change these values to alter the length. The closer to 0 the longer the lines. 
       // you can also try different shapes or even bezier curves instead of line();
      }
    popMatrix(); 
}}}

void draw() {
  int i;
  int j;
  color c;   
  loadPixels();
  for (int w=0; w<500; w++) {
    i = int(random(pixels.length));
    j = int(random(i, pixels.length));
    if ( j<pixels.length && i<pixels.length && pixels[i] > pixels[j] ) {
      c = pixels[i];
      pixels[j] = pixels[i];
      pixels[i] = c;
    }
  
  updatePixels();
}
  }

/*void cloudFluffer() {

  loadPixels();  
  for (int y = 0; y<height; y+=1 ) {
    for (int x = 0; x<width; x+=1) {
      int loc = x + y*img.width;
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      float av = ((r+g+b)/3.0);

    pushMatrix();
    translate(x,y);
      stroke(r,g,b);
      if (r > 100 && r < 255) {
        line(0,0,(av-255)/3,0); //change these values to alter the length. The closer to 0 the longer the lines. 
       // you can also try different shapes or even bezier curves instead of line();
      }
    popMatrix(); 
      
    }
  }
println("done");
noLoop();
}*/

  
