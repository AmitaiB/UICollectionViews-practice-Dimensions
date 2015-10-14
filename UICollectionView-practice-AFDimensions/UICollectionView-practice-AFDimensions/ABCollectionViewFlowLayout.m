//
//  ABCollectionViewFlowLayout.m
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ABCollectionViewFlowLayout.h"

@implementation ABCollectionViewFlowLayout

-(instancetype)init {
    if (!(self = [super init])) return nil;
    
        // Some basic setup. 140x140 + 3x13 ~= 320, which gets us a two-column grid in portrait orientation.
    self.itemSize = kMaxItemSize;
    self.sectionInset = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);
    self.minimumInteritemSpacing = 13.0f;
    self.minimumLineSpacing = 13.0f;
    
    return self;
}

+(Class)layoutAttributesClass {
        //Important for letting UICollectionView know what kind of attributes to use.
    return [ABCollectionViewLayoutAttributes class];
}

#pragma mark - Helper methods

-(void)applyLayoutAttributes:(ABCollectionViewLayoutAttributes *)attributes {
        // Check if representedElementKind is nil (= cell, not header | decoration)
    if (attributes.representedElementKind == nil) {
            //Pass our layout mode onto the layout attributes
        attributes.layoutMode = self.layoutMode;
        
        if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:layoutModeForItemAtIndexPath:)]) {
            attributes.layoutMode = [(id<ABCollectionViewDelegateFlowLayout>)self.collectionView.delegate collectionView:self.collectionView layout:self layoutModeForItemAtIndexPath:attributes.indexPath];
        }
    }
    
}

#pragma mark - Overridden Methods

#pragma mark === Cell Layout ===

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];

    for (ABCollectionViewLayoutAttributes *attributes in attributesArray) {
        [self applyLayoutAttributes:attributes];
    }

    return attributesArray;
}

#pragma mark - Overridden Properties

-(void)setLayoutMode:(ABCollectionViewFlowLayoutMode)layoutMode {
        // Update our backing ivar...
    _layoutMode = layoutMode;
    
        //...then invalidate our layout.
    [self invalidateLayout];
}
@end
