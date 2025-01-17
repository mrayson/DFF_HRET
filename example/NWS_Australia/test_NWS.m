clc
clear 
close all

%% An simple example to show the method performance (Australian NWS)
lon_bound = [103 125];
lat_bound = [-24 0];

HAR = ['M2';'S2';'K1';'O1'];
h = 1; % M2

%% use the first function to extract the complexed matrix for the certain
% harmonic in the selected region
[HAR_complex,lon,lat,seafloor_result] = Extract_HRET(lon_bound,lat_bound,h);

%% take the DFF method with HRET dataset 
% The lower band and upper band of selected angle/ propagation direction
angle1 = 180;
angle2 = 360;

[HAR_filter] = DFF_HRET(HAR_complex,angle1,angle2,seafloor_result);

% Filtered amplitude and phase
 Amp_filter = abs(HAR_filter);
 Gph_filter = atan2d(real(HAR_filter),imag(HAR_filter));

%% Plot the figure of the filtered results
color1 = dlmread('colormap_ZeorAtBegin.txt');

figure('visible','off','position',[100 100 1800 900]);
 
% Amplitude
 a1 = axes('position',[.05 .1 .4 .8]);
 m_proj('miller','long',[lon(10) lon(end-10)],'lat',[lat(10) lat(end-10)]); 
 m_pcolor(lon(10:end-10),lat(10:end-10),Amp_filter(10:end-10,10:end-10)'*100); 
  shading interp
 hold on;
 m_gshhs_h('patch',[.8 .8 .8],'edgecolor','k');
 m_grid('linewidth',2,'tickdir','out','fontsize',13);
 m_contour(lon(10:end-10),lat(10:end-10),seafloor_result(10:end-10,10:end-10)',...
  'LevelList',[0],'linecolor',[0 0 0],'linewidth',1.8)  
  hold on
 m_contour(lon(10:end-10),lat(10:end-10),seafloor_result(10:end-10,10:end-10)',...
  'LevelList',[-200 -1000 -2000],'linecolor',[0.6 0.6 0.6],'linewidth',1.5) 
 caxis([0 4]);
 colormap(a1,color1(5:5:end-40,:));
 hold on;
 title([' Amplitude - ' HAR(h,:) ' [ from ' num2str(angle1) ...
    ' ^o to ' num2str(angle2) ' ^o ]'],'fontsize',13);
 cb1 = colorbar(a1,'FontSize',13,'position',[.46 .1 .008 .8],'fontangle','oblique');
 set(get(cb1,'Title'),'string',' cm','fontsize',13,'fontangle','oblique');
 set(a1,'fontsize',13,'linewidth',2);

 % Phase
 a2 = axes('position',[.53 .1 .4 .8]);
 m_proj('miller','long',[lon(10) lon(end-10)],'lat',[lat(10) lat(end-10)]); 
 m_pcolor(lon(10:end-10),lat(10:end-10),Gph_filter(10:end-10,10:end-10)'); 
  shading interp
 hold on;
 m_gshhs_h('patch',[.8 .8 .8],'edgecolor','k');
 m_grid('linewidth',2,'tickdir','out','fontsize',13);
 m_contour(lon(10:end-10),lat(10:end-10),seafloor_result(10:end-10,10:end-10)',...
  'LevelList',[0],'linecolor',[0 0 0],'linewidth',1.8)  
  hold on
 m_contour(lon(10:end-10),lat(10:end-10),seafloor_result(10:end-10,10:end-10)',...
  'LevelList',[-200 -1000 -2000],'linecolor',[0.6 0.6 0.6],'linewidth',1.5) 
 caxis([-180 180]);
%  colormap(a2,color1(5:5:end-40,:));
 colormap(a2,flipud(pink(50)));
 hold on;
 title([' Phase - ' HAR(h,:) ' [ from ' num2str(angle1) ...
    ' ^o to ' num2str(angle2) ' ^o ]'],'fontsize',13);
 cb2 = colorbar(a2,'FontSize',13,'position',[.94 .1 .008 .8],'fontangle','oblique');
 set(get(cb2,'Title'),'string',' deg','fontsize',13,'fontangle','oblique');
 set(a2,'fontsize',13,'linewidth',2);
 
 saveas(gca,[HAR(h,:) '_' num2str(angle1,'%03i') '_' ...
     num2str(angle2,'%03i') 'deg.png'],'png');
 close all

 save([HAR(h,:) '_' num2str(angle1,'%03i') '_' ...
     num2str(angle2,'%03i') 'deg.mat'],'Gph_filter','Amp_filter',...
     'HAR_filter','lon','lat','seafloor_result');