



function [CVR, CVG, CVB]= CCVg(rgbIMG,numOfColors,threshold)

[Rb,Gb,Bb] = BlurAndDivideChannels(rgbIMG,3);
[RChannel] = discretizeColors(Rb,numOfColors);
[GChannel] = discretizeColors(Gb,numOfColors);
[BChannel] = discretizeColors(Bb,numOfColors);
Afterblur = cat(2,RChannel,GChannel,BChannel);
imshow(Afterblur);
CVR =CCV( Afterblur , threshold);
CVG=CCV( GChannel , threshold);
CVB=CCV( BChannel , threshold);
end

