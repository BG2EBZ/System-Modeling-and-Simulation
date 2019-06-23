function y = Intercept_cruise_fcn(xt,yt,xm,ym,Vm,theta_m,theta_t,N)

% global SimTime Vt at N m rou S g alphaTable rad2Deg
% global CyTable CdalphaTable CdMaTable CdTable
% if t==0
%     xt=3000;
%     yt=2500;
%     xm=0;
%     ym=0;
%     Vm=600;
%     theta_m=60*pi/180.0;
%     theta_t=-135*pi/180.0;
% end  
    
    Vt = 100;
    m=100;
    rou=1.0625;
    S=0.8;
    alphaTable=[-20 -10 -5 0 5 10 20 ];
    CyTable=[-0.9950 -0.6950 -0.3950 0.0050 0.4050 0.7050 1.0050];
    CdalphaTable=[-20 -10 0 10 20];
    CdMaTable=[0.5 1 2 3];
    CdTable=[0.002 0.0015 0.0013 0.0015 0.002;
        0.0023 0.0017 0.0014 0.0017 0.0023;
        0.0025 0.0018 0.0015 0.0018 0.0025;
        0.0027 0.0019 0.0016 0.0019 0.0027];
    rad2Deg=180/pi;
    g=9.8;
    at=-10;

    
    Vxm=Vm*cos(theta_m);
    Vym=Vm*sin(theta_m);

    Vxt=Vt*cos(theta_t);
    Vyt=Vt*sin(theta_t);


    r=((xt-xm)^2+(yt-ym)^2)^0.5;
    

    q=atan((yt-ym)/(xt-xm));
    qdot=(-(Vxm-Vxt)*(ym-yt)+(xm-xt)*(Vym-Vyt))/((xm-xt)^2+(ym-yt)^2);
    

    V_ref=((Vxt-Vxm)^2+(Vyt-Vym)^2)^0.5;
    am=N*V_ref*qdot;
    

    %Cy=0.04567-0.002573*alpha-0.0129*Ma+0.000222*alpha^2+0.001108*alpha*Ma+0.004805*Ma^2
    %Cy=0.04334-0.0003524*alpha-0.0129*Ma+0.001108*alpha*Ma+0.004805*Ma^2
    cy_temp=m*am/(0.5*rou*Vm^2*S);
    Ma=Vm/340;
    
    alpha = interp1(CyTable,alphaTable,cy_temp)/rad2Deg;
    
%     alpha=(cy_temp-0.04334+0.0129*Ma-0.004805*Ma^2)/(0.001108*Ma-0.0003524)/rad2Deg;
    
    if abs(alpha)>=20/rad2Deg
        alpha = 20/rad2Deg*sign(alpha);
    end
    

    cx = interp2(CdMaTable,CdalphaTable,CdTable',Ma,alpha*rad2Deg);
    cy = interp1(alphaTable,CyTable,alpha*rad2Deg);
%     cy=0.04334-0.0003524*alpha*rad2Deg-0.0129*Ma+0.001108*alpha*rad2Deg*Ma+0.004805*Ma^2;%气动升力系数
    X=0.5*rou*Vm^2*cx*S;
    Y=0.5*rou*Vm^2*cy*S;
    
    

    Vm_dot=-X/m-g*sin(theta_m);
    theta_m_dot=Y/(m*Vm)-g*cos(theta_m)/Vm;

    theta_t_dot=-g*cos(theta_t)/Vt+at/Vt;

    xt_dot=Vxt;
    yt_dot=Vyt;
    
    xm_dot=Vxm;
    ym_dot=Vym;
    
    data=[xm,ym,xt,yt,r,Vxm,Vym,Vm,Vxt,Vyt,Vt,am,q,qdot,theta_m,theta_t,alpha];
    
%     SimTime=5.849;
    
    if r<5
        Sim=1;

    else
        Sim=0;
    end
    
    y=[xt_dot,yt_dot,xm_dot,ym_dot,Vm_dot,theta_m_dot,theta_t_dot,data,Sim];
    
    
end
    
    