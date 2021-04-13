## Install
Install darknet from this repository
  >git clone https://github.com/zectre/yolo_rdd.git
  
  >cd yolo_rdd
  
  >make

## Prepare Video + GPS Data
1. Convert your GPS tracking data to subtitle (soft sub) using gpsbabel
  >sudo apt install gpsbabel
  
  >gpsbabel -i gpx -f track.gpx -o subrip -F video.srt
  
2. Render your subtitle into video (hard sub) using vlc
  >sudo apt install vlc
  
  >vlc video.mp4 --sub-file=video.srt --sout="#transcode{vcodec=h264,soverlay}:standard{dst=video_hardsub.mp4,mux=mp4,access=file} "
  
## Run detection for video and save output video
>./darknet detector demo config/voc.data config/rdd-custom.cfg  config/rdd-custom.weights  video.mp4 -out_filename output.mp4>

## Run detection for every images
1. Split videos into multiple image frames
>mkdir images

>ffmpeg -i video.mp4 -r 2 images/output_%04d.png>

2. Run image batch detection
>./darknet detector batchconfig/voc.data config/rdd-custom.cfg  config/rdd-custom.weights io_folder images/ output/ -out output/result.json -ext_output > output/result.txt

## Get location data
1. Get location data from subtitle using OCR
>sudo apt install tesseract

>./script/procc.sh
