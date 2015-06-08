//
//  ViewController.m
//  VRoundRectDemo
//
//  Created by Vols on 15/6/8.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"
#import "VRoundView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VRoundView *roundView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)sliderChange:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    self.roundView.curvature = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
