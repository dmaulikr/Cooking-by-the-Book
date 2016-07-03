//
//  UIColor+CustomColors.m
//  Cooking by the Book
//
//  Created by Jack Smith on 6/21/16.
//  Copyright © 2016 EthanJack. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+(UIColor*)primaryColor{
    return [UIColor colorWithRed:65.0f/255.0f green:105.0f/255.0f blue:200.0f/255.0f alpha:1.0f];
}

+(UIColor*)secondaryColor{
    return [UIColor colorWithRed:165.0f/255.0f green:205.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
}

+(UIColor*)customGrayColor{
    return [UIColor colorWithRed:225.0f/255.0f green:225.0f/255.0f blue:225.0f/255.0f alpha:1.0f];
}

+(UIColor*)lineColor{
    return [UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:1.0f];
}

+(UIColor*)tagQuickColor{
    return [UIColor colorWithRed:0.0f/255.0f green:34.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
}

+(UIColor*)tagSimpleColor{
    return [UIColor colorWithRed:240.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+(UIColor*)tagVegetarianColor{
    return [UIColor colorWithRed:11.0f/255.0f green:129.0f/255.0f blue:2.0f/255.0f alpha:1.0f];
}

+(UIColor*)tagVeganColor{
    return [UIColor colorWithRed:15.0f/255.0f green:215.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

@end
