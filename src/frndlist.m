function [ frnds ] = frndlist( uid )
% returns the list of friends of given id
%   Detailed explanation goes here
    ds=dataset('xlsfile','ubr.csv');
    ds.user_id = nominal(ds.user_id);
    ds.bis_id = nominal(ds.bis_id);
    idset = Hset(uid);
    j=1;
    %disp(uid);
    %disp(idset);
    for i=1:size(idset)
        
        temp = cellstr(ds(eq(ds.bis_id,idset(i)) ,1:2));
        ratings =double(ds(eq(ds.bis_id,idset(i)),3));
        for k = 1:size(temp(:,1))
            if strcmp(temp(k,1),uid)
                    %skip element
            else
                tempU(j,1) = temp(k,1);
                tempU(j,2) = temp(k,2);
                tempU(j,3) = num2cell(ratings(k,1));
                j=j+1;
            end
        end
    end
   % disp(tempU);
   % TempSet=sortrows(tempU,1);
    %disp(TempSet);
    %sort tempU
    %groupSums = accumarray(tempU(:,1),tempU(:,3));
   % c=0;
   %disp(groupSums);
    %for i = 1:size(tempU)
        %disp(tempU);
   
        
   tblB = sortrows(tempU,1);
   %disp(tblB);
    
   
   %storing frnds list
   tmp=(tblB(1,1));
  % disp(tmp);
   sumU=double(ds(eq(ds.bis_id,tblB(1,2))&eq(ds.user_id,uid),3));
   %disp(sumU);% store rating sum
   
   sumV=tblB{1,3}; %store frnd rating sum
   j=1;
   count=1;
   fcount = 0;
%   frnds = strings(1);
   for i=2:size(tblB)
       if(strcmp(tmp,tblB(i,1)))
           
           sumU=sumU+double(ds(eq(ds.bis_id,tblB(i,2))&eq(ds.user_id,uid),3));    
           sumV=sumV+tblB{i,3};
           count=count+1;
           
       else
           if(abs(sumU/count-sumV/count)<=1)
               frnds(j,1)=tmp;
               fcount = fcount + 1;
               j=j+1;
               
           end
         %  disp(abs(sumU/count-sumV/count));
           tmp=tblB(i,1);
          % disp(tmp);
           count=1;
           sumU=double(ds(eq(ds.bis_id,tblB(i,2))&eq(ds.user_id,uid),3));
           %disp(sumU);
           sumV=tblB{i,3};
           
       end
   end
   if(abs(sumU/count-sumV/count)<1)
        frnds(j,1)=tmp;
   end
end

