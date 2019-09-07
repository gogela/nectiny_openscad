$fn=50;
// dimensions - in mm
rpi_x=58;
rpi_y=23;
rpi_r=3.5;
rpi_pcb_h=1;

//box dimensions
box_th=2;
box_h=15;
top_bott_spilt=0.3;

// size of standoffs
stand_h=3;
stand_r=3;
stand_drill=1.5;

module cylinders(r,h){
    for(c=[[0,0],[rpi_x,0],[0,rpi_y],[rpi_x,rpi_y]])
      translate([c[0],c[1],0])cylinder(r=r,h=h);
    }

module box(thickness=2,h=10,st_h=stand_h,st_r=stand_r,st_drill=stand_drill,drill_through=false, logo=false){
    union(){
        difference(){
            hull()cylinders(r=rpi_r+thickness,h=h); //base
            translate([0,0,thickness])hull()cylinders(r=rpi_r,h=h); //inner part
            if(drill_through)
                cylinders(r=stand_drill,h=st_h+1); //drill (optional)
        }
        translate([0,0,thickness])difference(){ //standoffs
            cylinders(r=st_r,h=st_h);  //body
            cylinders(r=stand_drill,h=st_h+1); //drill
            
        }
        if(logo){
                translate([30+rpi_x/2,25+rpi_y/2,0])
                linear_extrude(height = 2, center = true, convexity = 10)
                scale([0.2,0.2,1])import(file = "raspberrylogo.dxf");
        }
    }
}

//bottom of the box
box(thickness=box_th,h=box_h*(1-top_bott_spilt));
//top of the box
translate([0,0,box_h*2]) mirror([0,0,1])
box(thickness=box_th,h=box_h*top_bott_spilt,st_h=box_h-2*box_th-rpi_pcb_h,drill_through=true,logo=true);


