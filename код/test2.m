%filterbuilder % ��������� ���������� ������� 
% ��������� ������������ ������������ ������� ������� Hhp, ���:  
% - 'b' - ������������ ���������,  
% - 'a' - ������������ ����������� 
[a, b]=tf(Hhp2);
%F1=dsp.FIRFilter(a);
%irr=dsp.IIRFilter;
%irr.Numerator = a;
%iir.Denominator = b;
fvtool(Hhp2); % ��������� Filter Visualization Tool (FVTool) ��� ������� ������� Hhp