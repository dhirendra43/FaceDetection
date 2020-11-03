[labels,err_test] = classify(net, testingData, 'MiniBatchSize', 300);
%classifies each row of the data in SAMPLE into one of the groups in TRAINING
confusionchart(testingData.Labels,labels); 
%Plot a confusion matrix
figure;
plotconfusion(testingData.Labels,labels)
%plots a confusion matrix, using testingData.Labels) and labels(output) labels
 
