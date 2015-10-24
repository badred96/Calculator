//
//  SecondViewController.m
//  Lesson6
//
//  Created by Azat Almeev on 09.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SecondViewController.h"



@interface SecondViewController (){
    NSString *stack;
    NSInteger result;
    int optype;
}


@end

@implementation SecondViewController

@synthesize consoleLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    stack = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)one:(id)sender {
    [self addnumber:1];
}
- (IBAction)two:(id)sender {
    [self addnumber:2];
}
- (IBAction)three:(id)sender {
    [self addnumber:3];
}
- (IBAction)four:(id)sender {
    [self addnumber:4];
}
- (IBAction)five:(id)sender {
    [self addnumber:5];
}
- (IBAction)six:(id)sender {
    [self addnumber:6];
}
- (IBAction)seven:(id)sender {
    [self addnumber:7];
}
- (IBAction)eight:(id)sender {
    [self addnumber:8];
}
- (IBAction)nine:(id)sender {
    [self addnumber:9];
}
- (IBAction)zero:(id)sender {
    [self addnumber:0];
}
- (IBAction)remove:(id)sender {
    [self addnumber:-1];
}


-(void)addpoint{
    stack = [NSString stringWithFormat:@"%1$@.", stack];
    [consoleLabel setText:stack];
}

-(void)addnumber:(int)number{
    
    if(stack == NULL){
        stack = @"0";
    }
    
    if(number > -1){
        stack = [NSString stringWithFormat:@"%1$@%2$d", stack, number];
        
    }else if([stack length] > 0){
        stack = [stack substringToIndex:[stack length]-1];
    }
    
    if([stack length] <= 0){
        stack = @"";
    }
    
    [consoleLabel setText:stack];
}

@end
