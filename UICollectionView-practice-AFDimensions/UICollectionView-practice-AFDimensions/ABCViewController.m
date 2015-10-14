//
//  ABCViewController.m
//  UICollectionView-practice-AFDimensions
//
//  Created by Amitai Blickstein on 10/13/15.
//  Copyright © 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ABCViewController.h"

//Views
#import "ABCollectionViewFlowLayout.h"
#import "ABPhotoCollectionViewCell.h"

//Models
#import "ABPhotoModel.h"


@interface ABCViewController (Private)

    //Private method to set up the model. Treat this like a stub (what's a stub???)
    //pay no attention to this method.
-(void)setupModel;

@end

@implementation ABCViewController {
        //Array of model objects
    NSArray *photoModelArray;
    
    UISegmentedControl *aspectChangeSegmentedControl;
    
    ABCollectionViewFlowLayout *photoCollectionViewLayout;
}

static NSString * const cellReuseIdentifier = @"CellReuseID";

-(void)loadView {
        //Create our view
    
        // Instantiate custom flow layout.
    photoCollectionViewLayout = [ABCollectionViewFlowLayout new];
    
        // Create a new collectionView + customFLayout, set delegate and data source.
    UICollectionView *photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:photoCollectionViewLayout];
    photoCollectionView.dataSource        = self;
    photoCollectionView.delegate          = self;
    

    
    photoModelArray = [NSArray array];
    
    
    // Register cell classes
    [photoCollectionView registerClass:[ABPhotoCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    
        //Set up the collection view to cover the whole screen.
    photoCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    photoCollectionView.allowsSelection = NO;
    photoCollectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
        // Finally, set our collectionView (since we are a collection view controller, this also sets self.view)
    self.collectionView = photoCollectionView;
    
        // Set up our model
    [self setupModel];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    aspectChangeSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Aspect Fit", @"Aspect Fill" ]];
    aspectChangeSegmentedControl.selectedSegmentIndex = 0;
    [aspectChangeSegmentedControl addTarget:self action:@selector(aspectChangeSegmentedControlDidChangeValue:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = aspectChangeSegmentedControl;
}

#pragma mark - Helper methods

-(ABPhotoModel *)photoModelForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item >= [photoModelArray count]) return nil;
    
    return photoModelArray[indexPath.item];
}

    //Configures a cell for a given indexPath
-(void)configureCell:(ABPhotoCollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
        //set the image for the cell
    [cell setImage:[[self photoModelForIndexPath:indexPath] image]];
}

#pragma mark - === UICollectionViewDataSource ===

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        // The # of photos
    return photoModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ABPhotoCollectionViewCell *cell = (ABPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - === UI Interaction ===
    //???: Why is this not firing??
 -(void)aspectChangeSegmentedControlDidChangeValue:(id)sender {
         //We need to explicitly tell the collection view layout that we want the change *animated*.
     [UIView animateWithDuration:0.5f animations:^{
             //This just swaps the two values
         
         if (photoCollectionViewLayout.layoutMode == ABCollectionViewFlowLayoutModeAspectFill)
         {
             photoCollectionViewLayout.layoutMode = ABCollectionViewFlowLayoutModeAspectFit;
         }
         else
         {
             photoCollectionViewLayout.layoutMode = ABCollectionViewFlowLayoutModeAspectFill;
         }
     }];
 }
 
@end










@implementation ABCViewController (Private)

-(void)setupModel
{
    photoModelArray = @[
                        [ABPhotoModel photoModelWithName:@"Purple Flower" image:[UIImage imageNamed:@"0.jpg"]],
                        [ABPhotoModel photoModelWithName:@"WWDC Hypertable" image:[UIImage imageNamed:@"1.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Purple Flower II" image:[UIImage imageNamed:@"2.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Castle" image:[UIImage imageNamed:@"3.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Skyward Look" image:[UIImage imageNamed:@"4.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Kakabeka Falls" image:[UIImage imageNamed:@"5.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Puppy" image:[UIImage imageNamed:@"6.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Thunder Bay Sunset" image:[UIImage imageNamed:@"7.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Sunflower I" image:[UIImage imageNamed:@"8.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Sunflower II" image:[UIImage imageNamed:@"9.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Sunflower I" image:[UIImage imageNamed:@"10.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Squirrel" image:[UIImage imageNamed:@"11.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Montréal Subway" image:[UIImage imageNamed:@"12.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Geometrically Intriguing Flower" image:[UIImage imageNamed:@"13.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Grand Lake" image:[UIImage imageNamed:@"17.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Spadina Subway Station" image:[UIImage imageNamed:@"15.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Staircase to Grey" image:[UIImage imageNamed:@"14.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Saint John River" image:[UIImage imageNamed:@"16.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Purple Bokeh Flower" image:[UIImage imageNamed:@"18.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Puppy II" image:[UIImage imageNamed:@"19.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Plant" image:[UIImage imageNamed:@"21.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Peggy's Cove I" image:[UIImage imageNamed:@"21.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Peggy's Cove II" image:[UIImage imageNamed:@"22.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Sneaky Cat" image:[UIImage imageNamed:@"23.jpg"]],
                        [ABPhotoModel photoModelWithName:@"King Street West" image:[UIImage imageNamed:@"24.jpg"]],
                        [ABPhotoModel photoModelWithName:@"TTC Streetcar" image:[UIImage imageNamed:@"25.jpg"]],
                        [ABPhotoModel photoModelWithName:@"UofT at Night" image:[UIImage imageNamed:@"26.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Mushroom" image:[UIImage imageNamed:@"27.jpg"]],
                        [ABPhotoModel photoModelWithName:@"Montréal Subway Selective Colour" image:[UIImage imageNamed:@"28.jpg"]],
                        [ABPhotoModel photoModelWithName:@"On Air" image:[UIImage imageNamed:@"29.jpg"]]];
}

@end

