//
//  ViewController.m
//  stringsdict-test
//
//  Created by Borys on 4/21/17.
//  Copyright © 2017 borowis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *_test_label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __test_label.text = [NSString stringWithFormat:NSLocalizedString(@"geese.landed.ct", nil), 1, 2, 1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
