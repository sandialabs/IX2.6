function P = SaturatedPressurePureWater(Temperature)
%Pressure is in pascal output is in Kelvin
% valid range from 275K to 475K
% This is from the NIST REFPROP database.
% see ./MaterialProp/SaturationTableRefProp.xlsx
if Temperature < 260 || Temperature > 475
     
    error(['SaturatedPressurePureWater: Invalid Temperature of ', ...
             Temperature,' which must be between 275 and 475 Kelvin' ,... 
             'applied to this polynomial relationship.']);
    
else
    
    coef(1) = -7.08535E-15;
    coef(2) = 1.85055E-11;
    coef(3) = -0.0000000206119;
    coef(4) = 0.0000126862;
    coef(5) = -0.00464543;
    coef(6) = 1.0007;
    coef(7) = -89.3226;
    
    %The polynomial fit is for Log(Pressure)
    P = exp(polyval(coef, Temperature));

end

end