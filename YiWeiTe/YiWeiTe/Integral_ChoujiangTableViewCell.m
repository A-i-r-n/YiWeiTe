//
//  Integral_ChoujiangTableViewCell.m
//  
//
//  Created by daiqile on 16/5/19.
//
//

#import "Integral_ChoujiangTableViewCell.h"
#import "ChoujiangCollectionViewCell.h"

@implementation Integral_ChoujiangTableViewCell

- (void)awakeFromNib {
    // Initialization code

    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollEnabled = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"ChoujiangCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth - 1) / 2.0, (ScreenWidth - 1) / 2.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChoujiangCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}


//- (instancetype)initWithFrame:(CGRect)frame {
//    if ((self = [super initWithFrame:frame])) {
//        _layout = [[UICollectionViewFlowLayout alloc] init];
//        _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        _layout.itemSize = CGSizeMake(CGRectGetWidth(self.frame) - 100, 200);
//        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
//        _collectionView.backgroundColor = [UIColor whiteColor];
//        _collectionView.showsHorizontalScrollIndicator = NO;
//        _collectionView.pagingEnabled = YES;
//        
//        [self.contentView addSubview:_collectionView];
//    }
//    return self;
//}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    _collectionView.frame = self.contentView.bounds;
//    [_collectionView registerNib:[UINib nibWithNibName:@"ChoujiangCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//}
//
//- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate {
//    _collectionView.dataSource = dataSourceDelegate;
//    _collectionView.delegate = dataSourceDelegate;
//    [_collectionView reloadData];
//}
//
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
