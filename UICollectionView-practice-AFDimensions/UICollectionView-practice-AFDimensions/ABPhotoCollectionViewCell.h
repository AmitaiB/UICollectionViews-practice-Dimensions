//
//  ABPhotoCollectionViewCell.h
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABPhotoCollectionViewCell : UICollectionViewCell

    //This quasi-synthesizing, but of a *non*-property, is good MVC practices
-(void)setImage:(UIImage *)image;

@end
