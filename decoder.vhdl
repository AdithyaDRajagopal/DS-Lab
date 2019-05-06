entity decoder is
	port(i2,i1,i0:in bit; o0,o1,o2,o3,o4,o5,o6,o7: out bit); 
end decoder; 
 
architecture xyz of decoder is
begin 
	o0<=(not i2) and (not i1) and (not i0); 
	o1<=(not i2) and (not i1) and i0; 
	o2<=(not i2) and i1 and (not i0); 
	o3<=(not i2) and i1 and i0; 
	o4<=i2 and (not i1) and (not i0); 
	o5<=i2 and (not i1) and i0; 
	o6<=i2 and i1 and (not i0); 
	o7<=i2 and i1 and i0; 
end xyz;
