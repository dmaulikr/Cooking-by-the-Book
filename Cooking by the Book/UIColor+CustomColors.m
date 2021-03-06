//
//  UIColor+CustomColors.m
//  Cooking by the Book
//
//  Created by Jack Smith on 6/21/16.
//  Copyright © 2016 EthanJack. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+(UIColor*)lightColorVersion:(UIColor*)color{
    CGFloat r, g, b, a;
    if ([color getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.75, 1.0)
                               green:MIN(g + 0.75, 1.0)
                                blue:MIN(b + 0.75, 1.0)
                               alpha:a];
    return nil;
    
}

+(UIColor*)primaryColor{
    return [UIColor colorWithRed:65.0f/255.0f green:105.0f/255.0f blue:200.0f/255.0f alpha:1.0f];
}

+(UIColor*)secondaryColor{
    return [UIColor colorWithRed:165.0f/255.0f green:205.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
}

+(UIColor*)customGrayColor{
    return [UIColor colorWithRed:225.0f/255.0f green:225.0f/255.0f blue:225.0f/255.0f alpha:1.0f];
}

+(UIColor*)transparentGrayColor{
    return [UIColor colorWithRed:130.0f/255.0f green:130.0f/255.0f blue:130.0f/255.0f alpha:0.3f];
}

+(UIColor*)forestGreenColor{
    return [UIColor colorWithRed:34.0f/255.0f green:139.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
}
+(UIColor*)brightGreenColor{
    return [UIColor colorFromHexString:@"#17DC23"];
}

+(UIColor*)starColor {
    return [UIColor colorWithRed:225.0f/255.0f green:215.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
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
    return [UIColor colorWithRed:92.0f/255.0f green:47.0f/255.0f blue:161.0f/255.0f alpha:1.0f];
}


@end
