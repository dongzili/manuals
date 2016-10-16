pro plotcc2d_v

;title1='E-mode Velocity Power Spectrum (Nearest)'
;title2='E-mode Velocity Power Spectrum (Kriging with prior)'
;title3='E-mode Velocity Power Spectrum (Kriging with prior v.s. Nearest)'
thisletter="136B

plotname='1.000cc2d.eps'

xtitle='k!D!9'+string(thisletter)+'!X'
ytitle='k!D//!X'
colortitle='foreground subtracted'

kbin=10
kbincut=6
temp=fltarr(kbin,kbin)
npvps=fltarr(kbincut,kbincut)

pi=3.1415926
box=1200.

kmax=alog10(pi/box*1024)
kmin=alog10(2*pi/box)
dlogk=(kmax-kmin)/kbin
kscale=fltarr(kbin+1)
for i=0,kbin do begin
  kscale(i)=10^(kmin+i*dlogk)
endfor

xrange=[kscale(0),kscale(kbincut)]
yrange=[kscale(0),kscale(kbincut)]

print,'range:',xrange
print,'kbin:',kscale

crange=128
colorbar=intarr(1,crange)
for i=0,crange-1 do begin
  colorbar(0,i)=i+1
endfor

filename='./1.000cc2d_fs.dat'
print,'reading ',filename
openr,31,filename
for i=0,kbin-1 do begin
  readf,31,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10
  temp(0,i)=abs(a1)
  temp(1,i)=abs(a2)
  temp(2,i)=abs(a3)
  temp(3,i)=abs(a4)
  temp(4,i)=abs(a5)
  temp(5,i)=abs(a6)
  temp(6,i)=abs(a7)
  temp(7,i)=abs(a8)
  temp(8,i)=abs(a9)
  temp(9,i)=abs(a10)
endfor
close,31

;temp(*,*)=temp(*,*)^2

npvps(0:kbincut-1,0:kbincut-1)=temp(0:kbincut-1,0:kbincut-1)
maxval=max(npvps)
minval=min(npvps)
colorrange=[minval,maxval]
print,'min,max:',minval,maxval
npvps(*,*)=fix((npvps(*,*)-minval)/(maxval-minval)*crange)
print,'min,max:',min(npvps),max(npvps)

device,set_font='TIMESNEWROMAN',/tt_font
entry_device=!d.name
set_plot,'PS'
print,'plotting:',plotname
device,xsize=12/1.7,ysize=12.,xoffset=0.75,yoffset=0.,/inches
device,filename=plotname
device,color=1,bits_per_pixel=8
device,/ISOLATIN1
!p.font=1

!p.multi=[0,6,1]
!p.charsize=4.0
!p.charthick=3
!p.thick=3
!x.thick=3
!y.thick=3

print,'plot1 main'

xtitle=''
plot,xrange,yrange,$
     position=[0.15,0.5482,0.85,0.96],$
     xtitle=xtitle,ytitle=ytitle,title=colortitle,$
     xrange=xrange,yrange=yrange,$
     /xlog,/ylog,$
     xstyle=1,ystyle=1,$
     xtickformat='ticknull',$
     /nodata
loadct,1
for j=0,kbincut-1 do begin
  for i=0,kbincut-1 do begin
    x=[kscale(i),kscale(i+1),kscale(i+1),kscale(i)]
    y=[kscale(j),kscale(j),kscale(j+1),kscale(j+1)]
    polyfill,x,y,color=255-npvps(i,j)
  endfor
endfor
axis,xaxis=0,xrange=xrange,xstyle=1,/xlog,xtickformat='ticknull'
axis,yaxis=0,yrange=yrange,ystyle=1,/ylog

plot,xrange,yrange,$
     position=[0.15,0.5482,0.85,0.96],$
     xtitle=xtitle,ytitle=ytitle,title=colortitle,$
     xrange=xrange,yrange=yrange,$
     /xlog,/ylog,$
     xstyle=1,ystyle=1,$
     xtickformat='ticknull',$
     /nodata

print,'plot1 finished'

loadct,0
plot,[0,1],colorrange,$
     position=[0.875,0.5482,0.925,0.96],$
     xrange=[0,1],xstyle=4,$
     yrange=[-1,1],ystyle=4,$
     /nodata
loadct,1
tv,255-colorbar,0.875,0.5482,xsize=0.05,ysize=0.4118,/normal
axis,yaxis=1,yrange=colorrange,ystyle=1,ticklen=0.15

print,'colorbar  finished'

thisletter="136B

xtitle='k!D!9'+string(thisletter)+'!X'
ytitle='k!D//!X'
colortitle='reconstructed'

kbin=10
kbincut=6
temp=fltarr(kbin,kbin)
npvps=fltarr(kbincut,kbincut)

pi=3.1415926
box=1200.

kmax=alog10(pi/box*1024)
kmin=alog10(2*pi/box)
dlogk=(kmax-kmin)/kbin
kscale=fltarr(kbin+1)
for i=0,kbin do begin
  kscale(i)=10^(kmin+i*dlogk)
endfor

xrange=[kscale(0),kscale(kbincut)]
yrange=[kscale(0),kscale(kbincut)]

print,'range:',xrange
print,'kbin:',kscale

crange=128
colorbar=intarr(1,crange)
for i=0,crange-1 do begin
  colorbar(0,i)=i+1
endfor

filename='./1.000cc2d_kap.dat'
print,'reading ',filename
openr,31,filename
for i=0,kbin-1 do begin
  readf,31,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10
  temp(0,i)=abs(a1)
  temp(1,i)=abs(a2)
  temp(2,i)=abs(a3)
  temp(3,i)=abs(a4)
  temp(4,i)=abs(a5)
  temp(5,i)=abs(a6)
  temp(6,i)=abs(a7)
  temp(7,i)=abs(a8)
  temp(8,i)=abs(a9)
  temp(9,i)=abs(a10)
endfor
close,31

;temp(*,*)=temp(*,*)^2

npvps(0:kbincut-1,0:kbincut-1)=temp(0:kbincut-1,0:kbincut-1)
;maxval=max(npvps)
maxval=1.0
minval=min(npvps)
colorrange=[minval,maxval]
print,'min,max:',minval,maxval
npvps(*,*)=fix((npvps(*,*)-minval)/(maxval-minval)*crange)
print,'min,max:',min(npvps),max(npvps)

print,'data2 finished'

plot,xrange,yrange,$
     position=[0.15,0.0782,0.85,0.49],$
     xtitle=xtitle,ytitle=ytitle,title=colortitle,$
     xrange=xrange,yrange=yrange,$
     /xlog,/ylog,$
     xstyle=1,ystyle=1,$
     /nodata
loadct,1
for j=0,kbincut-1 do begin
  for i=0,kbincut-1 do begin
    x=[kscale(i),kscale(i+1),kscale(i+1),kscale(i)]
    y=[kscale(j),kscale(j),kscale(j+1),kscale(j+1)]
    polyfill,x,y,color=255-npvps(i,j)
  endfor
endfor
axis,xaxis=0,xrange=xrange,xstyle=1,/xlog
axis,yaxis=0,yrange=yrange,ystyle=1,/ylog

print,'plot2 main finished'

loadct,0
plot,xrange,yrange,$
     position=[0.15,0.0782,0.85,0.49],$
     xtitle=xtitle,ytitle=ytitle,$
     xrange=xrange,yrange=yrange,$
     /xlog,/ylog,$
     xstyle=1,ystyle=1,$
     /nodata

print,'plot2 frame  finished'

loadct,0
plot,[0,1],colorrange,$
     position=[0.875,0.0782,0.925,0.49],$
     xrange=[0,1],xstyle=4,$
     yrange=[-1,1],ystyle=4,$
     /nodata
loadct,1
tv,255-colorbar,0.875,0.0782,xsize=0.05,ysize=0.4118,/normal
axis,yaxis=1,yrange=colorrange,ystyle=1,ticklen=0.15

print,'colorbar  finished'

device,/close_file
set_plot,entry_device


end
