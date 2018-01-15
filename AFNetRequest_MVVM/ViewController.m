//
//  ViewController.m
//  AFNetRequest_MVVM
//
//  Created by Slc on 2018/1/15.
//  Copyright © 2018年 Slc. All rights reserved.
//

#import "ViewController.h"
#import "PPNetworkHelper.h"
#import "MJExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self request];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)request{
    NSDictionary * dataDic =nil;
    [self request:[NSString stringWithFormat:@"%@",@"http://www.sojson.com/open/api/weather/json.shtml?city=北京"] dataDic:dataDic requestType:messageRequest];
}

-(void)request:(NSString *)urlString dataDic:(NSDictionary *)dic requestType:(requestTagType)tagType{
    if ([PPNetworkHelper isNetwork]) {
        [PPNetworkHelper GET:urlString parameters:dic success:^(id responseObject) {
             NSDictionary *dataDic = [responseObject JSONObject];
             NSLog(@"----success%@", dataDic);
        } failure:^(NSError *error) {
            
        }];
    }else{
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
