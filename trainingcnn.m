clc;clear;
imds = imageDatastore('dataset','IncludeSubFolders',true,...
    'LabelSource','foldernames');%Create an ImageDatastore to work with collections of images.
disp(imds);
[traininData,testingData]=splitEachLabel(imds,0.90);
% Splits the datastore according to specified label proportions
%we are spliting data for 90% training and 10% for testing
layers = [imageInputLayer([128 128 3])
                convolution2dLayer(5,20)
                reluLayer
                maxPooling2dLayer(2,'Stride',2)
                fullyConnectedLayer(2)
                softmaxLayer
                classificationLayer()]; 
%defines an image input layer.
%we are using 7 types of layer here
            
            
 options = trainingOptions('sgdm', ...
            'Plots', 'training-progress', ...
            'LearnRateSchedule', 'piecewise', ...
            'LearnRateDropFactor', 0.2, ...
            'LearnRateDropPeriod', 5, ...
            'MiniBatchSize', 300);    
%creates a set of training optionsfor the solver specified by solverName.
options.MaxEpochs = 30; 
options.InitialLearnRate=0.0001;
[net,info] = trainNetwork(traininData,layers,options);

% trains and returns anetwork trainedNet for a classification problem. imds is an
%ImageDatastore with categorical labels, layers is an array of network
%layers or a LayerGraph, and options is a set of training options.

save net net; %saving the data generated from training 

     
     