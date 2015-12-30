//Project of the Engduino Case by Jacek Karwowski 2014
//
//This is file containing lid model only, full description in project.scad file

w = 20;
scale(79/621) //scale to milimeters
mirror([1, 0, 0])
union()
{
linear_extrude(height = w+2, convexity = 10)
{
	polygon(points = [[0-w, 0-w], [357, 0-w], [451+w, 94], [321+w, 224], [408+w, 311], [321+w, 398], [464+w, 541], [540+w, 617], [446, 711+w], [357, 621+w], [0-w, 621+w]]); 
} //B


union()
{
	translate([-w, 0, w])
	difference()
	{
		linear_extrude(height = 2*w, convexity = 10)
		{
		
			polygon(points = [[451+w, 94], [321+w, 224], [408+w, 311], [321+w, 398], [464+w, 541], [464+2*w, 541], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+2*w, 94]]); //X1
		}
		
		linear_extrude(height = w, convexity = 10)
		{
			polygon(points = [[451-w, 94+w], [321+w, 224], [408+w, 311], [321+w, 398], [464, 541-w], [464+w, 541-w], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+w, 94+w]]); //X1
		
		}
		
	} //P1
	translate([w, 0, w])
	difference()
	{
	
		linear_extrude(height = 2*w, convexity = 10)
		{
			polygon(points = [[-w, 94], [-w, 541], [-2*w, 541], [-2*w, 94]]); //X2
		}

		linear_extrude(height = w, convexity = 10)
		{
			polygon(points = [[-w, 94+w], [-w, 541-w], [-2*w, 541-w], [-2*w, 94+w]]); //Y2
		}
	} //P2
}
}