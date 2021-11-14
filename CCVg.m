


function [CVR, CVG, CVB]= CCVg(rgbIMG,numOfColors,threshold)

[Rb,Gb,Bb] = BlurAndDivideChannels(rgbIMG,3);
[RChannel] = discretizeColors(Rb,numOfColors);
[GChannel] = discretizeColors(Gb,numOfColors);
[BChannel] = discretizeColors(Bb,numOfColors);
CVR =CCV( RChannel , threshold);
CVG=CCV( GChannel , threshold);
CVB=CCV( BChannel , threshold);
end

