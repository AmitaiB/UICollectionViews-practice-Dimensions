//
//  ABPhotoCollectionViewCell.m
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ABPhotoCollectionViewCell.h"
#import "ABCollectionViewFlowLayout.h"

@implementation ABPhotoCollectionViewCell
{
    UIImageView *imageView;
    ABCollectionViewFlowLayoutMode layoutMode;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
//    Set up our image view
//???: Why not just initWithFrame:frame ?
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];
    
//    This will make the rest of our cell, outside the imageview, transparent against the black background.
    
    self.backgroundColor = [UIColor blackColor];
    
    return self;
}

-(void)prepareForReuse {
    [super prepareForReuse];
    
    [imageView setImage:nil];
}

#pragma mark - === Public Methods ===

-(void)setImage:(UIImage *)image {
    [imageView setImage:image];
    
    [self setImageViewFrame];
}

-(void)setImageViewFrame {
//    Start with the detail image size of the maximum size
    CGSize imageViewSize = self.bounds.size;
    
    if (layoutMode == ABCollectionViewFlowLayoutModeAspectFit) {
            //Determine the size and aspect ratio for the model's image
        CGSize photoSize = imageView.image.size;
        CGFloat aspectRatio = photoSize.width / photoSize.height;
        
        if (aspectRatio < 1) {
//            The image is taller than it is wide, so set height to MAX, and constrain the width to proportionately match.
            imageViewSize = CGSizeMake(CGRectGetWidth(self.bounds) * aspectRatio, CGRectGetHeight(self.bounds));
        }
    }
    
        // Set the size of the imageView ...
        //???: I thought the imageView automatically sizes itself to the image? Or that is only an init feature...(?)
    imageView.bounds = CGRectMake(0, 0, imageViewSize.width, imageViewSize.height);
        // And the center, too.
    imageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}


@end
