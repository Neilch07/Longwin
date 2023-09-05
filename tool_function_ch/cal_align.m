function varargout = cal_align(varargin)
%varargin : input data

%example : [cal,marketValueData,totalShareData]=cal_align(marketValueData,totalShareData);
%all variable endwith Data contains cal,fac
    cal=varargin{1}.cal;
    varargout=cell(nargout,1);
    for i=2:nargin
        cal=intersect(cal,varargin{i}.cal);
    end
    varargout{1}=cal;
    for j=1:nargin
        indicator_cal=ismember(varargin{j}.cal,cal);
        fac=varargin{j}.fac;
        if ndims(fac) == 3
            for k=1:size(fac,3)
                fac(:,:,k)=fac(indicator_cal==1,:,k);
            end
        else
        fac=fac(indicator_cal==1,:);
        end
        varargout{j+1}.fac=fac;
        varargout{j+1}.cal=cal;
    end

end