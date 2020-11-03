load net.mat %loading net.mat file
[filename, pathname] = uigetfile('*.*', 'Pick a input image ');
%it is used to get the file from the user
filename=strcat(pathname,filename);
%it is used to concatante the filename and file addres of selected file
im=imread(filename);
%use for reading  Image
im=imresize(im,[128 128]);
%resizing the image to the image size of trained data
label = char(classify(net,im)); % classify with deep learning
figure;
imshow(im);title(label);
%used to show the file
clc;
disp('recognized class');
disp(label);%displayin the final results
