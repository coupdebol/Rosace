int WIDTH = 1000;
int HEIGHT = WIDTH;
ArrayList<Float> freqs = new ArrayList<Float>();
float frq = 0;
float STEP = 0.0125;
int COMP = 20;
int COLS = 7;
void setup(){
  colorMode(HSB, 100);
  size(WIDTH,HEIGHT);
  background(50,100,10);
  smooth();

  
  stroke(255);
  strokeWeight(1);
 

  int grid = WIDTH / COLS;
  int count = 0;
  for( int i = grid/2 ;i < WIDTH ; i = i + grid){
    for( int ii = grid/2 ;ii < HEIGHT ; ii = ii + grid){
      count++;
      float amp = random(.5,2.5);
      float [] center = new float[2];
      center[0] = ii;
      center[1] = i;
      
      float min = 0;
      float max = 6;
      int digits = 3;
      
      frq = STEP*count;

      while( freqs.contains(frq) || !makeRosace(center,grid/2-0.05*grid, frq, amp ) )
      {
        count++;
        frq = STEP*count;
        
      }
      freqs.add(frq);
    
    }//end of grid loop
  }
  
  save("output.jpg");
}//end of setup




boolean makeRosace(float[] center, float radius, float freqMod, float ampMod){
   noFill();
  int complexity = COMP;
  //determine how many revolution to do based on freq
  //
  int revs = 1;
  float tempFreq = freqMod;
  while(
    (floor(tempFreq) != tempFreq) && (revs <= complexity)
    ) {
    tempFreq = freqMod * revs;
    revs++;
  }
//  println("revs"+revs);
  
  if (revs <= complexity){
    beginShape();
    for( int count = 0; count < 720*revs ; count ++){
      float radCount = radians(count/2.0);
      float ampModFactorx = cos(ampMod * cos(freqMod * radCount));
      float dx =  radius * cos(radCount) * ampModFactorx;
      float dy =  radius * sin(radCount) * ampModFactorx;
      
      //draw at center
      dx = dx + center[0];
      dy = dy + center[1];
      vertex( dx,dy);
      
    }
    stroke(random(0,100), 80 ,100);
    endShape();
//    float txtSz = radius /5.0;
//    textSize(txtSz);
//    text("C"+nf(revs,0,8), center[0]-radius, center[1]-radius); 
//    text("F"+nf(freqMod,0,8), center[0]-radius, center[1]+txtSz-radius);
//    text("A"+nf(ampMod,0,8), center[0]-radius, center[1]+2*txtSz-radius); 
//    fill(255, 0, 0);
    return true;
  }
  return false;
}

float myRand(float min,float max, int digits){
//    float result = min;
//    
//    while ( result <= min && result > max)
//    {
//      result = 0;
//      for(int i = 0 ; i < digits ; i++){  
//        int digit = (int) random(10);
//        float div = (float) i;
//        result += digit * pow(10,0-div);
//        print(result +" ");
//      }
//    }
//    
//    return result;
  float zeros = pow(10,digits);
  print(" zeros" + zeros);
  float rand = random(min*zeros,max*zeros);
  print(" rand" + rand);
  int temp = (int) rand;
  print(" temp" + temp);
  float fdigit = digits;
  float result = temp/zeros;
  println(" result"+result+"|");
  return result;
}
