//
//  UIToggleTagButton.m
//  Cooking by the Book
//
//  Created by Jack Smith on 7/2/16.
//  Copyright © 2016 EthanJack. All rights reserved.
//

#import "UIToggleTagButton.h"
#import "UIColor+CustomColors.h"

@implementation UIToggleTagButton


-(id)init{
    return [self initWithFrame:CGRectMake(0, 0, 100, 20) withTagType:quick withTagged:FALSE];
}

-(id)initWithFrame:(CGRect)frame withTagType:(TagType)tagType_ withTagged:(BOOL)tagged_{
    
    self = [super initWithFrame:frame];
    
    if (self){
        self.tagType = tagType_;
        self.tagged = tagged_;
        
        NSString *titleStr = [[NSString alloc]init];
        
        switch(self.tagType){
            case quick:
                titleStr = @"Quick";
                break;
            case simple:
                titleStr = @"Simple";
                break;
            case vegetarian:
                titleStr = @"Vegetarian";
                break;
            case vegan:
                titleStr = @"Vegan";
                break;
            default:
                break;
        }
        
        [self setTitle:titleStr forState:UIControlStateNormal];
        [self addTarget:self action:@selector(buttonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        [[self layer] setBorderWidth:2.0f];
        [self updateColor];
                
    }
    return self;
}

-(void)updateColor{
    UIColor *buttonColor;
    
    if (self.tagged == FALSE){
        buttonColor = [UIColor darkGrayColor];
    }
    else{
        switch(self.tagType){
            case quick:
                buttonColor = [UIColor tagQuickColor];
                break;
            case simple:
                buttonColor = [UIColor tagSimpleColor];
                break;
            case vegetarian:
                buttonColor = [UIColor tagVegetarianColor];
                break;
            case vegan:
                buttonColor = [UIColor tagVeganColor];
                break;
            default:
                break;
        }
    }
    [self setTitleColor:buttonColor forState:UIControlStateNormal];
    [[self layer] setBorderColor:buttonColor.CGColor];
}

-(void)toggleTag{
    if (self.tagged == TRUE){
        self.tagged = FALSE;
    }
    else{
        self.tagged = TRUE;
    }
}

-(void)buttonTouch{
    [self toggleTag];
    [self updateColor];
}


@end