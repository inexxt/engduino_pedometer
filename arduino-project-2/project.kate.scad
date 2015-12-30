w = 20;

mirror([1, 0, 0])
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


union()
{
	difference()
	{
		linear_extrude(height = 2*w, convexity = 10)
		{
		
			polygon([451+w, 94], [321+w, 224], [408+w, 311], [321+w, 398], [464+w, 541], [464+2*w, 541], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+2*w, 94]); //X1
		}
		
		linear_extrude(height = 2*w, convexity = 10)
		{
			polygon([451, 94+w], [321+w, 224], [408+w, 311], [321+w, 398], [464, 541-w], [464+w, 541-w], [321+2*w, 398], [408+2*w, 311], [321+2*w, 224], [451+w, 94-w]); //Y1
		
		}
		
	}

	difference()
	{
	
		linear_extrude(height = w, convexity = 10)
		{
			polygon([-w, 94], [-w, 541], [-2*w, 541], [-2*w, 94]); //X2
		}
		
		linear_extrude(height = w, convexity = 10)
		{
			polygon([-w, 94+w], [-w, 541-w], [-2*w, 541-w], [-2*w, 94+w]); //Y2
		}
	}
}