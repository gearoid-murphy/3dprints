// width of the bowl (in mm)
diameter = 32;
radius = diameter/2;

// height of the main part (in mm)
bodyHeight = 50;

// height of the base and lower rim (in mm)
baseHeight = 1;

// height of the upper rim (in mm)
rimHeight = 1;

// number of polygon sides
sides = 5;

// thickness of the bowl (keep above 1.5 mm)
thickness = 1.5;

// degrees that the bowl shape will twist
bodyTwist = 36;

// factor by which bowl shape will scale out/in
bodyFlare = 1.8;

module polyShape(solid){
    difference(){
        // start with outer shape
        offset( r=5, $fn=48 )
            circle( r=radius, $fn=sides );
        // take away inner shape
        if (solid=="no"){
        offset( r=5-thickness, $fn=48 )
            circle( r=radius, $fn=sides );
        }
    }
}

// base
linear_extrude( height = baseHeight )
    polyShape( solid="yes" );

// body
translate([0,0,baseHeight])
linear_extrude( height = bodyHeight, twist = bodyTwist,
                scale = bodyFlare, slices = 2*bodyHeight )
    polyShape( solid="no" ); // change to yes for solid bowl

// rim
translate([0,0,bodyHeight+baseHeight])
rotate(-bodyTwist)
scale(bodyFlare)
linear_extrude( height = rimHeight )
    polyShape( solid="no" ); // change to yes for solid bowl



