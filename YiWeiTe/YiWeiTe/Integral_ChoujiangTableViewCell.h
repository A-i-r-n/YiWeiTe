//
//  Integral_ChoujiangTableViewCell.h
//  
//
//  Created by daiqile on 16/5/19.
//
//

#import <UIKit/UIKit.h>

@interface Integral_ChoujiangTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
//@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@end
