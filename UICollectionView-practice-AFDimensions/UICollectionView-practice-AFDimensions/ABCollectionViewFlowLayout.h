//
//  ABCollectionViewFlowLayout.h
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCollectionViewLayoutAttributes.h"

#define kMaxItemDimension   140
#define kMaxItemSize        CGSizeMake(kMaxItemDimension, kMaxItemDimension)

@protocol ABCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@optional

-(ABCollectionViewFlowLayoutMode)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout layoutModeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ABCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) ABCollectionViewFlowLayoutMode layoutMode;

@end
