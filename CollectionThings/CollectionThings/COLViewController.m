//
//  COLViewController.m
//  CollectionThings
//
//  Created by guoruizhou on 10/16/13.
//  Copyright (c) 2013 guoruizhou. All rights reserved.
//
#define UIColorHex(rgbHex) [UIColor colorWithRed:((float)((rgbHex & 0xFF0000) >> 16))/255.0 green:((float)((rgbHex & 0xFF00) >> 8))/255.0 blue:((float)(rgbHex & 0xFF))/255.0 alpha:1.0]
#import "COLViewController.h"

@interface COLViewController ()<UICollectionViewDataSource>
@property UICollectionView *collectionView;
@end

@implementation COLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];;
        [flow setMinimumLineSpacing:10];
        flow.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
        flow.itemSize = CGSizeMake(140, 140);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 400) collectionViewLayout:flow];
        //        self.collectionView.collectionViewLayout = flow;
        [self.collectionView setBackgroundColor:[UIColor whiteColor]];
        self.collectionView.dataSource = self;
        //        self.collectionView.delegate = self;
        
        [self.view addSubview:self.collectionView];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"tile"];
        // Custom initialization
    }
    return self;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return [self.classList count];
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tile" forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 140, 140)];
//    }
    UIView *tile = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 140, 140)];
    [tile setBackgroundColor:UIColorHex(0x4da3f3)];
//    cell.frame = tile.frame;
    [cell addSubview:tile];
//    [cell setBackgroundColor:UIColorHex(0x4da3f3)];
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
