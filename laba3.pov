#include "colors.inc"
camera { location <0, 5, 10> look_at <0, 0, 0> angle 45}     // ����������� ������ � ��������� ����������, ������ ������ � ����� ������
light_source { <-100,200,-100> colour White }    //��������� 

background { color rgb <0.12, 0.8, 0.34> }         // ������� ����� ���� � ������� RGB-���������

#declare aboba = function { x*x*x + y*y + 0.5*z - 0.87 }   // ����������� ������� aboba

#declare obabo = function { 2*x*x + y*y*y + z*z - 5 }    // ����������� ������� obabo

#declare kavo = function {pow((x*x+2.25*y*y+z*z-1),3)-pow(x,2)*pow(z,3)}     // ����������� ������� kavo                                              
                                                            
difference {     // ������ �����, � ������� ������������ �������� ����� ���������
 
isosurface {
    function { kavo(x,y,z) } // ����������� ������� ��� �������������� 1
    threshold 0.0     // ��������� ������ ��� �������������� 1
    accuracy 0.01     // ��������� �������� ��� �������������� 1
    contained_by { box { -1.1, 1.1 } }     // �������� ��������������� ������ ��� �������������� 1
    max_gradient 50    // ��������� ������������� ���������
    pigment { Red } 
    rotate <-90,0,0>
}          //�������������� 1
                                                                                                                                                                                                                                
isosurface{  // ������ ����������� �������������� 2
  function{sqrt( x*x + y*y + z*z ) - 0.9 + sin( 12*atan2(x, z) )*0.1} // ����������� ������� ��� �������������� 2
  threshold 0             // ��������� ������ ��� �������������� 2
  accuracy 0.0001   // ��������� �������� ��� �������������� 2
  max_gradient 5 // ��������� ������������� ��������� ��� �������������� 2
  contained_by {box {<-1,-1,-1>, < 1, 1, 1>}}
  texture{ pigment{ color rgb<0,0.9,0.0>}  // ����������� �������� ��� �������������� 2
           finish { phong 1}   //�����������
	  }
  scale 0.85 // ��������� ������������ ��������������� ��� �������������� 2
  rotate <-25, 25, 0>   // ������� �������������� 2
  translate <0, 0.2, 0>       // ���������� �������������� 2
}
}          //�������������� 2

#declare a = 1.0;
#declare b = 8;
#declare c = 0.2;
#declare n = 5;
parametric{
 function { a*(1-0.5*v/pi)*sin(n*v+0.5*pi)*(1-cos(u)) + c*sin(n*v+0.5*pi) }     // ����������� ������� ��� ��������������� ����������� 1
 function { b*0.5*v/pi + a*(1-0.5*v/pi)*sin(u) }         // ����������� ������� ��� ��������������� ����������� 1
 function { a*(1-0.5*v/pi)*cos(n*v+0.5*pi)*(1-cos(u)) + c*cos(n*v+0.5*pi) }
  <0,0>,<2*pi,2*pi>  // ��������� ��������� ���������� ��� ��������������� ����������� 1
  contained_by {box {<-1,-1,-1>*2*pi,<1,b/3,1>*2*pi}}     // �������� ��������������� ������ ��� ��������������� ����������� 1
  max_gradient 8      // ��������� ������������� ��������� ��� ��������������� ����������� 1
  accuracy 0.01         // ��������� �������� ��� ��������������� ����������� 1
  precompute 10 x,y,z  // ��������������� ���������� ��� ��������������� ����������� 1
  texture{ pigment{ color rgb<1,1,1>}         // ����������� �������� ��� ��������������� ����������� 1
           finish { phong 0.5}}   //���������
  scale 0.125
  rotate <0, 0, -30>   
    translate <1, 1, 0>
}

parametric{
 function { a*(1-0.5*v/pi)*sin(n*v+0.5*pi)*(1-cos(u)) + c*sin(n*v+0.5*pi) }
 function { b*0.5*v/pi + a*(1-0.5*v/pi)*sin(u) }
 function { a*(1-0.5*v/pi)*cos(n*v+0.5*pi)*(1-cos(u)) + c*cos(n*v+0.5*pi) }
  <0,0>,<2*pi,2*pi>  // start, end of (u,v)
  contained_by {box {<-1,-1,-1>*2*pi,<1,b/3,1>*2*pi}}
  max_gradient 8
  accuracy 0.01
  precompute 10 x,y,z
  texture{ pigment{ color rgb<1,1,1>}
           finish { phong 0.5}}   // ���������
  scale 0.125
  rotate <0, 0, 30>   
    translate <-1, 1, 0>
}


