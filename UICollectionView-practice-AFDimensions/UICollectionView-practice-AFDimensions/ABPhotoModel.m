//
//  ABPhotoModel.m
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ABPhotoModel.h"

@implementation ABPhotoModel

+(instancetype)photoModelWithName:(NSString *)name image:(UIImage *)image {
    ABPhotoModel *model = [ABPhotoModel new];
    
    model.name = name;
    model.image = image;
    
    return model;
}

@end
