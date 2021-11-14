


location = 'C:\Users\Fatima\Desktop\imageprocessing code\image_DBase\image_DBase';       %  folder in which your images exists
ds = imageDatastore(location) ;        %  Creates a datastore for all images in your folder
%here define  the numbers of image in data set 
numberOfImageInDataSet=12;
RsumArray = zeros(1,numberOfImageInDataSet);
GsumArray = zeros(1,numberOfImageInDataSet);
BsumArray = zeros(1,numberOfImageInDataSet);

%here are ccv for the original image
rgbIMG = imread('C:\Users\Fatima\Desktop\imageprocessing code\image_DBase\image_DBase\8.jpg');

%here you can edit the number of color in image in descritizing stage and the thresold for it 
numberOfColorImg=32;
threshold=50;
[CVR, CVG, CVB]=  CCVg(rgbIMG,numberOfColorImg,threshold);

 i=1;
while hasdata(ds) 
    if(i<numberOfImageInDataSet)
    img = read(ds) ;
   [CVRl, CVGl, CVBl]=  CCVg(img,numberOfColorImg,threshold);
   
    RsumArray(1,i)=sum(sum( abs(CVR - CVRl )));
    GsumArray(1,i)=sum(sum( abs(CVG - CVGl )));
    BsumArray(1,i)=sum(sum( abs(CVB - CVBl )));
    i=i+1;
      
   else
        break;
   end
  
end
maxIndex = zeros(1,5);
for j=1:5
       [M,I] = min(BsumArray);
       BsumArray(1,I)=1000000;
       maxIndex(1,j) = I;
end
  img1=readimage(ds,maxIndex(1,1));
  img2=readimage(ds,maxIndex(1,2));
  img3=readimage(ds,maxIndex(1,3));
  img4=readimage(ds,maxIndex(1,4));
  img5=readimage(ds,maxIndex(1,5));
  
subplot(1,6,1), imshow(rgbIMG)
subplot(1,6,2), imshow(img1)
subplot(1,6,3), imshow(img2)
subplot(1,6,4), imshow(img3)
subplot(1,6,5), imshow(img4)
subplot(1,6,6), imshow(img5)
