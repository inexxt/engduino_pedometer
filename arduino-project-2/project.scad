//Engduino Case by Jacek Karwowski 2014
//
//Designed for pedometer
//
//Two elements on top (P1, P2) are for belt - user has to put Engduino in, close the cover with the lid (file lid.scad) and put his belt inside these two holes, locking Engduino inside (it cannot fall off from the case in any way). Cover is designed to be as simple as possible without losing usability - there are two tight holes, for button, for and for ON/OFF button, they should fit buttons tightly and therefore not lowering possibility of damage from water (i.e. rain or snow). Although LEDs are used to show counter of steps, since Engduino has to be attached to belt and user has to have access to the button, LEDs must be on the other - invisible - side of board, so there are no holes to see them. There's no hole for SD card, as it could increase probability of getting water inside - it is assumed that user will only check his results in home, when he can take Engduino out of cover.
//Project is made with respect to dimensions taken from Engduino datasheet http://www.engduino.org/fileadmin/engduino/images/EngduinoV3.PDF




w = 20; //Single parameter used for generating the case - it determine width of the walls and also dimensions of elements P1 and P2

scale(79/621) //scale to milimeters
mirror([1, 0, 0])
difference()
{
difference()
{
union()
{
	union()
	{
		difference()
		{
			translate([0, 0, 100+w])
			linear_extrude(height = w, convexity = 10)
			{
				polygon(points = [[0-2*w, 0-2*w], [357, 0-2*w], [451+2*w, 94], [321+2*w, 224], [408+2*w, 311], [321+2*w, 398], [464+2*w, 541], [540+2*w, 617], [446, 711+2*w], [357, 621+2*w], [0-2*w, 621+2*w]]); 
			}//C
		
			translate([0, 0, 100+w-1])
			linear_extrude(height = w+2, convexity = 10)
			{
				polygon(points = [[0-w, 0-w], [357, 0-w], [451+w, 94], [321+w, 224], [408+w, 311], [321+w, 398], [464+w, 541], [540+w, 617], [446, 711+w], [357, 621+w], [0-w, 621+w]]); 
			} //B
		}
		difference()
		{

				translate([0,0,-w])
				linear_extrude(height = 100+2*w, convexity = 10)
				{
					polygon(points = [[0-2*w, 0-2*w], [357, 0-2*w], [451+2*w, 94], [321+2*w, 224], [408+2*w, 311], [321+2*w, 398], [464+2*w, 541], [540+2*w, 617], [446, 711+2*w], [357, 621+2*w], [0-2*w, 621+2*w]]); 
				}//C
				linear_extrude(height = 100+w+1, convexity = 10, twist = 0)
				{
					polygon(points = [[0, 0], [357, 0], [451, 94], [321, 224], [408, 311], [321, 398], [464, 541], [540, 617], [446, 711], [357, 621], [0, 621]]);
				}//A
		
			
			
		
		}
	}
	translate([0,0,100+2*w])
	union()
	{
		difference() //P1
		{
			linear_extrude(height = 2*w, convexity = 10)
			{
			
				polygon(points = [[451+w, 94], [321+w, 224], [408+w, 311], [321+w, 398], [464+w, 541], [464+2*w, 541], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+2*w, 94]]); //X1
			}
			
			linear_extrude(height = w, convexity = 10)
			{
				polygon(points = [[451-w, 94+w], [321+w, 224], [408+w, 311], [321+w, 398], [464, 541-w], [464+w, 541-w], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+w, 94+w]]); //X1
			
			}
			
		} 

		difference() //P2
		{
		
			linear_extrude(height = 2*w, convexity = 10)
			{
				polygon(points = [[-w, 94], [-w, 541], [-2*w, 541], [-2*w, 94]]); //X2
			}
			
			linear_extrude(height = w, convexity = 10)
			{
				polygon(points = [[-w, 94+w], [-w, 541-w], [-2*w, 541-w], [-2*w, 94+w]]); //Y2
			}
		} 
	}
}

union()
{
	union() //Button hole
	{
		translate([62, 559, -2*w])
		cylinder(h = 2*w, d = 27);
		
		translate([62, 559, -2*w])
		cylinder(h = 1.3*w, d = 38);
	
	}
	union() //ON/OFF hole
	{
		translate([184, 621, 10])
		scale(1)cube([87, 3*w, 22]);
	}	

}
}
}
