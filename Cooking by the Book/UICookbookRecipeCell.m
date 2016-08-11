//
//  UICookbookRecipeCell.m
//  Cooking by the Book
//
//  Created by Jack Smith on 6/26/16.
//  Copyright © 2016 EthanJack. All rights reserved.
//

#import "UICookbookRecipeCell.h"
#import "UITagBox.h"

@implementation UICookbookRecipeCell



-(id)init{
    return [self initWithFrame:CGRectMake(0,0,0,0)];
}

-(id)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame withCookbookRecipe:nil];
}

-(id)initWithFrame:(CGRect)frame withCookbookRecipe:(CookbookRecipe*)cookbookRecipe_{
  
    self = [super initWithFrame:frame];
    
    if (self) {
        int objectBreak = 8;
        int totalWidth = frame.size.width;
        int totalHeight = frame.size.height;
        int imageHeight = totalHeight - objectBreak*2;
        int titleHeight = (totalHeight-objectBreak*3)/3;
        int tagWidth = totalHeight;
        
        self.recipe = cookbookRecipe_;
        self.backgroundColor = [UIColor whiteColor];
        
        /* add this back in when images are working
         if (_image != nil){
         _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_image]];
         [_imageView setFrame:CGRectMake(objectBreak, objectBreak, imageHeight, imageHeight)];
         [self addSubview:_imageView];
         }
         */
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageHeight+objectBreak*2, objectBreak, totalWidth - imageHeight - tagWidth - objectBreak, titleHeight)];
        UIFontDescriptor * fontD = [titleLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
        titleLabel.font = [UIFont fontWithDescriptor:fontD size:0];
        titleLabel.text = cookbookRecipe_.title;
        titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:titleLabel];
        
        UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageHeight+objectBreak*2, titleHeight+objectBreak*2, totalWidth - imageHeight - tagWidth - objectBreak*2, totalHeight - titleHeight - objectBreak*3)];
        descLabel.text = cookbookRecipe_.desc;
        descLabel.numberOfLines = 3;
        descLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:descLabel];
        
        UITagBox *tagBox = [[UITagBox alloc]initWithFrame:CGRectMake(totalWidth - tagWidth, 0, tagWidth, totalHeight) withTags:cookbookRecipe_.tagAry];
        [self addSubview:tagBox];
        

        
    }
    
    return self;

}




@end
