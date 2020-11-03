clear;clc;
%Initialize Face detector
faceDetector = vision.CascadeObjectDetector; % Default: finds faces 
camObj = webcam(); %Initilaize webcam
count=1;
while(1)
img = snapshot(camObj); 
bboxes = step(faceDetector, img); % Detect faces

if ~isempty (bboxes)
% Face detection
    if count==20
        break
    else
    % draw the bounding box on the frame
    Face=imcrop(img,bboxes(1,:)); %cropin the image in desired size and removing unnecesary information 
    Face=imresize(Face,[128 128]);%resizing the image into 128x128
    filename=strcat(num2str(count),'.bmp');%concatinating the image with numbers and string
    imwrite(Face,filename);%saving the image with concatnated string 
    IFaces = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');%makin an rectangular yellow box around face
    imshow(IFaces), title('Detected faces');%alerting face is detected
    count=count+1;
    end
end
end