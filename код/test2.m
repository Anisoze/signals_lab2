%filterbuilder % Настройка параметров фильтра 
% Извлекаем коэффициенты передаточной функции фильтра Hhp, где:  
% - 'b' - коэффициенты числителя,  
% - 'a' - коэффициенты знаменателя 
[a, b]=tf(Hhp2);
%F1=dsp.FIRFilter(a);
%irr=dsp.IIRFilter;
%irr.Numerator = a;
%iir.Denominator = b;
fvtool(Hhp2); % Открываем Filter Visualization Tool (FVTool) для анализа фильтра Hhp