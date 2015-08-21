//
//  ViewController.m
//  VChatView
//
//  Created by Vols on 15/8/21.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"
#import "VChatView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VChatView *chatView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)ValueChange:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    self.chatView.curvature = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
