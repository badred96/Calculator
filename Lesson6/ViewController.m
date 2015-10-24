//
//  ViewController.m
//  Lesson6
//
//  Created by Azat Almeev on 09.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    NSString *stack;
    NSInteger result;
    int optype;
}
@end

@implementation ViewController

@synthesize conLabel1,conLabel2,conLabel3,conLabel4,conLabel5;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = 0;
    stack = @"";
    [conLabel2 setText:@""];
}

- (IBAction)returnHere:(UIStoryboardSegue *)sender {
    SecondViewController *svc = sender.sourceViewController;
    NSInteger count = [svc.consoleLabel.text longLongValue];
    self.items++;
    if (self.items>2) {
        stack = [NSString stringWithFormat:@"%s", "Error"];
        [conLabel1 setText:stack];
        [conLabel2 setText:@""];
        [conLabel3 setText:@""];
        [conLabel4 setText:@""];
        [conLabel5 setText:@""];
        result=0;
        count=0;
        self.items=0;
    } else if (self.items==2) {
        stack = [NSString stringWithFormat:@"%ld", count];
        [conLabel3 setText:stack];
        [conLabel4 setText:@"="];
        if ([conLabel2.text isEqual:@"+"]) {
            stack = [NSString stringWithFormat:@"%ld", count+result];
        } else if ([conLabel2.text isEqual:@"-"]) {
            stack = [NSString stringWithFormat:@"%ld", result-count];
        } else if ([conLabel2.text isEqual:@"*"]) {
            stack = [NSString stringWithFormat:@"%ld", count*result];
        }   else if ([conLabel2.text isEqual:@"/"]) {
            if (count==0) {
                stack = [NSString stringWithFormat:@"%s", "infinity"];
            } else {
            stack = [NSString stringWithFormat:@"%ld", result/count];
            }
        } else {
            stack = [NSString stringWithFormat:@"%s", "Error"];
            [conLabel1 setText:stack];
            [conLabel2 setText:@""];
            [conLabel3 setText:@""];
            [conLabel4 setText:@""];
            [conLabel5 setText:@""];
            result=0;
            count=0;
            self.items=0;
            stack=@"";
        }
        [conLabel5 setText:stack];
    } else if (self.items==1) {
        stack = [NSString stringWithFormat:@"%ld", count];
        [conLabel1 setText:stack];
        result=count;
    }
}


-(void)logic:(int)type{
        if(type == 1){ // addition
            [conLabel2 setText:@"+"];
        }else if(type == 2){ // subtraction
            [conLabel2 setText:@"-"];
        }else if(type == 3){ // multiply
            [conLabel2 setText:@"*"];
        }else if(type == 4){ // division
            [conLabel2 setText:@"/"];
        } else if (type==5) { // clear
            [conLabel1 setText:@""];
            [conLabel2 setText:@""];
            [conLabel3 setText:@""];
            [conLabel4 setText:@""];
            [conLabel5 setText:@""];
        }
}

- (IBAction)addition:(id)sender {
    [self logic:1];
}
- (IBAction)subtraction:(id)sender {
    [self logic:2];
}
- (IBAction)multiply:(id)sender {
    [self logic:3];
}
- (IBAction)division:(id)sender {
    [self logic:4];
}
- (IBAction)clear:(id)sender {
    [self logic:5];
}

@end
