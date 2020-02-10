import ipcapture.*;

IPCapture cam;

void initCam(){
  cam = new IPCapture(this, "http://192.168.43.1:8080/video/mjpeg", "", "");
  cam.start();
}

void readCam(){
  cam.read();
}
