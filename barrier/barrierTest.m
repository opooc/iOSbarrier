
//
//  barrierTest.m
//  barrier
//
//  Created by doushuyao on 2018/5/17.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "barrierTest.h"

@interface barrierTest()
{
    dispatch_queue_t concent_queue;
    NSMutableDictionary* dic;
};

@end

@implementation barrierTest
-(id)init{
    if (self = [super init]) {
        concent_queue =  dispatch_queue_create( "concent",  DISPATCH_QUEUE_CONCURRENT);
        NSDictionary* dicC  = @{@"name":@"opooc", @"age":@"18"};
        dic = [[NSMutableDictionary alloc]initWithDictionary:dicC];
    }
    return self;
}
-(id)Obj{
   __block id getobj;
    dispatch_sync(concent_queue, ^{
        getobj = dic;
    });
    return nil;
}

-(void)setObj:(id)newO{
    dispatch_barrier_async(concent_queue, ^{
        [dic setObject:newO forKey:dic];
    });
    
}

@end
