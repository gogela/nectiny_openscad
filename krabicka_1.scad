rpi_x=58;
rpi_y=23;
$fn=50;

module box_bottom(){
    union(){
        difference(){
            base();
            translate([0,0,2])rpi();
        }
        standoffs();
    }
}

box_bottom();


module rpi(){
    hull(){
        cylinder(r=3.5,h=10);
        translate([rpi_x,0,0])cylinder(r=3.5,h=10);
        translate([0,rpi_y,0])cylinder(r=3.5,h=10);
        translate([rpi_x,rpi_y,0])cylinder(r=3.5,h=10);    
    }
}
    
//rpi();

module base(){
    hull(){
        cylinder(r=5,h=10);
        translate([rpi_x,0,0])cylinder(r=5,h=10);
        translate([0,rpi_y,0])cylinder(r=5,h=10);
        translate([rpi_x,rpi_y,0])cylinder(r=5,h=10);    
    }
}

//base();



module standoffs(){
    difference(){
        union(){
            cylinder(r=3,h=5);
            translate([rpi_x,0,0])cylinder(r=3,h=5);
            translate([0,rpi_y,0])cylinder(r=3,h=5);
            translate([rpi_x,rpi_y,0])cylinder(r=3,h=5);   
        }
        translate([0,0,2])union(){
            cylinder(r=1.5,h=5);
            translate([rpi_x,0,0])cylinder(r=1.5,h=5);
            translate([0,rpi_y,0])cylinder(r=1.5,h=5);
            translate([rpi_x,rpi_y,0])cylinder(r=1.5,h=5);
        }
    }
}
//standoffs();