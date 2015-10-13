//
//  ABCollectionViewLayoutAttributes.m
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ABCollectionViewLayoutAttributes.h"

@implementation ABCollectionViewLayoutAttributes

    ///!!!: Grok this!
-(id)copyWithZone:(NSZone *)zone {
    ABCollectionViewLayoutAttributes *attributes = [super copyWithZone:zone];
    
    attributes.layoutMode = self.layoutMode;
    
    return attributes;
}

    //Cleverly done! iOS 7+, needs to be overriden (see docs for details)
-(BOOL)isEqual:(id)object {
    return [super isEqual:object] && (self.layoutMode == [object layoutMode]);
}

@end
