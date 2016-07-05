//
//  HttpManager.m
//  YiWeiTe
//
//  Created by daiqile on 16/6/30.
//  Copyright © 2016年 DaiQiLe. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+ (void)sendNetworkingWithUrl:(NSString *)urlString
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://192.168.1.154:3000/api/products" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *array = [responseObject objectForKey:@"data"];
        NSLog(@"----%@",array);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}




@end
