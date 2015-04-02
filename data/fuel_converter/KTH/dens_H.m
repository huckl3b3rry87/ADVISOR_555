%-------------------------------------------------------------------------------------
%
% M-file: dens_H(p,T)
% Last modified: 991109 by Kristina Johansson
%-----------------------------------------------------------------------------------
%Values from AGA "Gas handbok", valid for pressures 0.5-4.99 bar,
%temperatures above -173.15 C (100 K), under 151.25 C (425 K)
%Please observe: temperature [K], pressure [bar]
%Double interpolation, assuming linear relationship [kg/m3]

function f=dens_H(p,T)


if ((p>=0.5) & (p<1))
   if ((T>=100) & (T<125))
      X=(T-100)/(125-100)*(0.097-0.121)+0.121;
      Y=(T-100)/(125-100)*(0.194-0.243)+0.243;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=125) & (T<150))
      X=(T-125)/(150-125)*(0.081-0.097)+0.097;
      Y=(T-125)/(150-125)*(0.162-0.194)+0.194;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=150) & (T<175))
      X=(T-150)/(175-150)*(0.069-0.081)+0.081;
      Y=(T-150)/(175-150)*(0.139-0.162)+0.162;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=175) & (T<200))
      X=(T-175)/(200-175)*(0.061-0.069)+0.069;
      Y=(T-175)/(200-175)*(0.121-0.139)+0.139;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=200) & (T<225))
      X=(T-200)/(225-200)*(0.054-0.061)+0.061;
      Y=(T-200)/(225-200)*(0.108-0.121)+0.121;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;    
   elseif ((T>=225) & (T<250))
      X=(T-225)/(250-225)*(0.048-0.054)+0.054;
      Y=(T-225)/(250-225)*(0.097-0.108)+0.108;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=250) & (T<273.15))
      X=(T-250)/(273.15-250)*(0.044-0.048)+0.048;
      Y=(T-250)/(273.15-250)*(0.089-0.097)+0.097;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;      
   elseif ((T>=273.15) & (T<275))
      X=(T-273.15)/(275-273.15)*(0.044-0.044)+0.044;
      Y=(T-273.15)/(275-273.15)*(0.088-0.089)+0.089;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=275) & (T<288.15))
      X=(T-275)/(288.15-275)*(0.042-0.044)+0.044;
      Y=(T-275)/(288.15-275)*(0.084-0.088)+0.088;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;      
   elseif ((T>=288.15) & (T<300))
      X=(T-288.15)/(300-288.15)*(0.040-0.042)+0.042;
      Y=(T-288.15)/(300-288.15)*(0.081-0.084)+0.084;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;      
   elseif ((T>=300) & (T<325))
      X=(T-300)/(325-300)*(0.037-0.040)+0.040;
      Y=(T-300)/(325-300)*(0.075-0.081)+0.081;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;      
   elseif ((T>=325) & (T<350))
      X=(T-325)/(350-325)*(0.035-0.037)+0.037;
      Y=(T-325)/(350-325)*(0.069-0.075)+0.075;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;      
   elseif ((T>=350) & (T<375))
      X=(T-350)/(375-350)*(0.032-0.035)+0.035;
      Y=(T-350)/(375-350)*(0.065-0.069)+0.069;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=375) & (T<400))
      X=(T-375)/(400-375)*(0.030-0.032)+0.032;
      Y=(T-375)/(400-375)*(0.061-0.065)+0.065;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=400) & (T<425))
      X=(T-400)/(425-400)*(0.029-0.030)+0.030;
      Y=(T-400)/(425-400)*(0.057-0.061)+0.061;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;
   elseif ((T>=425) & (T<450))
      X=(T-425)/(450-425)*(0.027-0.029)+0.029;
      Y=(T-425)/(450-425)*(0.054-0.057)+0.057;
      dens=(p-0.5)/(1-0.5)*(Y-X)+X;   
   elseif (T>=450)
      dens=0;
   end;
end;

if ((p>=1) & (p<2))
   if ((T>=100) & (T<125))
      X=(T-100)/(125-100)*(0.194-0.243)+0.243;
      Y=(T-100)/(125-100)*(0.388-0.486)+0.486;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=125) & (T<150))
      X=(T-125)/(150-125)*(0.162-0.194)+0.194;
      Y=(T-125)/(150-125)*(0.323-0.388)+0.388;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=150) & (T<175))
      X=(T-150)/(175-150)*(0.139-0.162)+0.162;
      Y=(T-150)/(175-150)*(0.277-0.323)+0.323;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=175) & (T<200))
      X=(T-175)/(200-175)*(0.121-0.139)+0.139;
      Y=(T-175)/(200-175)*(0.242-0.277)+0.277;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=200) & (T<225))
      X=(T-200)/(225-200)*(0.108-0.121)+0.121;
      Y=(T-200)/(225-200)*(0.215-0.242)+0.242;
      dens=(p-1)/(2-1)*(Y-X)+X;    
   elseif ((T>=225) & (T<250))
      X=(T-225)/(250-225)*(0.097-0.108)+0.108;
      Y=(T-225)/(250-225)*(0.194-0.215)+0.215;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=250) & (T<273.15))
      X=(T-250)/(273.15-250)*(0.089-0.097)+0.097;
      Y=(T-250)/(273.15-250)*(0.177-0.194)+0.194;
      dens=(p-1)/(2-1)*(Y-X)+X;      
   elseif ((T>=273.15) & (T<275))
      X=(T-273.15)/(275-273.15)*(0.088-0.089)+0.089;
      Y=(T-273.15)/(275-273.15)*(0.176-0.177)+0.177;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=275) & (T<288.15))
      X=(T-275)/(288.15-275)*(0.084-0.088)+0.088;
      Y=(T-275)/(288.15-275)*(0.168-0.176)+0.176;
      dens=(p-1)/(2-1)*(Y-X)+X;      
   elseif ((T>=288.15) & (T<300))
      X=(T-288.15)/(300-288.15)*(0.081-0.084)+0.084;
      Y=(T-288.15)/(300-288.15)*(0.162-0.168)+0.168;
      dens=(p-1)/(2-1)*(Y-X)+X;      
   elseif ((T>=300) & (T<325))
      X=(T-300)/(325-300)*(0.075-0.081)+0.081;
      Y=(T-300)/(325-300)*(0.149-0.162)+0.162;
      dens=(p-1)/(2-1)*(Y-X)+X;      
   elseif ((T>=325) & (T<350))
      X=(T-325)/(350-325)*(0.069-0.075)+0.075;
      Y=(T-325)/(350-325)*(0.138-0.149)+0.149;
      dens=(p-1)/(2-1)*(Y-X)+X;      
   elseif ((T>=350) & (T<375))
      X=(T-350)/(375-350)*(0.065-0.069)+0.069;
      Y=(T-350)/(375-350)*(0.129-0.138)+0.138;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=375) & (T<400))
      X=(T-375)/(400-375)*(0.061-0.065)+0.065;
      Y=(T-375)/(400-375)*(0.121-0.129)+0.129;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=400) & (T<425))
      X=(T-400)/(425-400)*(0.057-0.061)+0.061;
      Y=(T-400)/(425-400)*(0.114-0.121)+0.121;
      dens=(p-1)/(2-1)*(Y-X)+X;
   elseif ((T>=425) & (T<450))
      X=(T-425)/(450-425)*(0.054-0.057)+0.057;
      Y=(T-425)/(450-425)*(0.108-0.114)+0.114;
      dens=(p-1)/(2-1)*(Y-X)+X;   
   elseif (T>=450)
      dens=0;
   end;
end;

if ((p>=2) & (p<5))
   if ((T>=100) & (T<125))
      X=(T-100)/(125-100)*(0.388-0.486)+0.486;
      Y=(T-100)/(125-100)*(0.970-1.216)+1.216;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=125) & (T<150))
      X=(T-125)/(150-125)*(0.162-0.194)+0.194;
      Y=(T-125)/(150-125)*(0.807-0.970)+0.970;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=150) & (T<175))
      X=(T-150)/(175-150)*(0.277-0.323)+0.323;
      Y=(T-150)/(175-150)*(0.692-0.807)+0.807;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=175) & (T<200))
      X=(T-175)/(200-175)*(0.242-0.277)+0.277;
      Y=(T-175)/(200-175)*(0.605-0.692)+0.692;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=200) & (T<225))
      X=(T-200)/(225-200)*(0.215-0.242)+0.242;
      Y=(T-200)/(225-200)*(0.538-0.605)+0.605;
      dens=(p-2)/(5-2)*(Y-X)+X;    
   elseif ((T>=225) & (T<250))
      X=(T-225)/(250-225)*(0.194-0.215)+0.215;
      Y=(T-225)/(250-225)*(0.484-0.538)+0.538;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=250) & (T<273.15))
      X=(T-250)/(273.15-250)*(0.177-0.194)+0.194;
      Y=(T-250)/(273.15-250)*(0.443-0.484)+0.484;
      dens=(p-2)/(5-2)*(Y-X)+X;      
   elseif ((T>=273.15) & (T<275))
      X=(T-273.15)/(275-273.15)*(0.176-0.177)+0.177;
      Y=(T-273.15)/(275-273.15)*(0.440-0.443)+0.443;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=275) & (T<288.15))
      X=(T-275)/(288.15-275)*(0.168-0.176)+0.176;
      Y=(T-275)/(288.15-275)*(0.420-0.440)+0.440;
      dens=(p-2)/(5-2)*(Y-X)+X;      
   elseif ((T>=288.15) & (T<300))
      X=(T-288.15)/(300-288.15)*(0.162-0.168)+0.168;
      Y=(T-288.15)/(300-288.15)*(0.403-0.420)+0.420;
      dens=(p-2)/(5-2)*(Y-X)+X;      
   elseif ((T>=300) & (T<325))
      X=(T-300)/(325-300)*(0.149-0.162)+0.162;
      Y=(T-300)/(325-300)*(0.372-0.403)+0.403;
      dens=(p-2)/(5-2)*(Y-X)+X;      
   elseif ((T>=325) & (T<350))
      X=(T-325)/(350-325)*(0.138-0.149)+0.149;
      Y=(T-325)/(350-325)*(0.346-0.372)+0.372;
      dens=(p-2)/(5-2)*(Y-X)+X;      
   elseif ((T>=350) & (T<375))
      X=(T-350)/(375-350)*(0.129-0.138)+0.138;
      Y=(T-350)/(375-350)*(0.323-0.346)+0.346;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=375) & (T<400))
      X=(T-375)/(400-375)*(0.121-0.129)+0.129;
      Y=(T-375)/(400-375)*(0.303-0.323)+0.323;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=400) & (T<425))
      Y=(T-400)/(425-400)*(0.114-0.121)+0.121;
      X=(T-400)/(425-400)*(0.285-0.303)+0.303;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif ((T>=425) & (T<450))
      Y=(T-425)/(450-425)*(0.108-0.114)+0.114;
      X=(T-425)/(450-425)*(0.269-0.285)+0.285;
      dens=(p-2)/(5-2)*(Y-X)+X;
   elseif (T>=450)
      dens=0;
   end;
end;

if ((p>=5) & (p<8))
   if ((T>=100) & (T<125))
      X=(T-100)/(125-100)*(0.970-1.216)+1.216;
      Y=(T-100)/(125-100)*(1.552-1.948)+1.948;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=125) & (T<150))
      X=(T-125)/(150-125)*(0.807-0.970)+0.970;
      Y=(T-125)/(150-125)*(1.291-1.552)+1.552;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=150) & (T<175))
      X=(T-150)/(175-150)*(0.692-0.807)+0.807;
      Y=(T-150)/(175-150)*(1.106-1.291)+1.291;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=175) & (T<200))
      X=(T-175)/(200-175)*(0.605-0.692)+0.692;
      Y=(T-175)/(200-175)*(0.967-1.106)+1.106;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=200) & (T<225))
      X=(T-200)/(225-200)*(0.538-0.605)+0.605;
      Y=(T-200)/(225-200)*(0.860-0.967)+0.967;
      dens=(p-5)/(8-5)*(Y-X)+X;    
   elseif ((T>=225) & (T<250))
      X=(T-225)/(250-225)*(0.484-0.538)+0.538;
      Y=(T-225)/(250-225)*(0.774-0.860)+0.860;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=250) & (T<273.15))
      X=(T-250)/(273.15-250)*(0.443-0.484)+0.484;
      Y=(T-250)/(273.15-250)*(0.708-0.774)+0.774;
      dens=(p-5)/(8-5)*(Y-X)+X;      
   elseif ((T>=273.15) & (T<275))
      X=(T-273.15)/(275-273.15)*(0.440-0.443)+0.443;
      Y=(T-273.15)/(275-273.15)*(0.703-0.708)+0.708;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=275) & (T<288.15))
      X=(T-275)/(288.15-275)*(0.420-0.440)+0.440;
      Y=(T-275)/(288.15-275)*(0.671-0.703)+0.703;
      dens=(p-5)/(8-5)*(Y-X)+X;      
   elseif ((T>=288.15) & (T<300))
      X=(T-288.15)/(300-288.15)*(0.403-0.420)+0.420;
      Y=(T-288.15)/(300-288.15)*(0.645-0.671)+0.671;
      dens=(p-5)/(8-5)*(Y-X)+X;      
   elseif ((T>=300) & (T<325))
      X=(T-300)/(325-300)*(0.372-0.403)+0.403;
      Y=(T-300)/(325-300)*(0.595-0.645)+0.645;
      dens=(p-5)/(8-5)*(Y-X)+X;      
   elseif ((T>=325) & (T<350))
      X=(T-325)/(350-325)*(0.346-0.372)+0.372;
      Y=(T-325)/(350-325)*(0.553-0.595)+0.595;
      dens=(p-5)/(8-5)*(Y-X)+X;      
   elseif ((T>=350) & (T<375))
      X=(T-350)/(375-350)*(0.323-0.346)+0.346;
      Y=(T-350)/(375-350)*(0.516-0.553)+0.553;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=375) & (T<400))
      X=(T-375)/(400-375)*(0.303-0.323)+0.323;
      Y=(T-375)/(400-375)*(0.484-0.516)+0.516;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=400) & (T<425))
      X=(T-400)/(425-400)*(0.285-0.303)+0.303;
      Y=(T-400)/(425-400)*(0.455-0.484)+0.484;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif ((T>=425) & (T<450))
      X=(T-425)/(450-425)*(0.269-0.285)+0.285;
      Y=(T-425)/(450-425)*(0.430-0.455)+0.455;
      dens=(p-5)/(8-5)*(Y-X)+X;
   elseif (T>=450)
      dens=0;
   end;
end;

f=dens;

