//
//  ViewController.m
//  SimpleDropdown
//
//  Created by 329 Mac on 2/16/16.
//  Copyright © 2016 cwah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *arrayTableData;
    BOOL isDropdownOpen;
}

@property (weak, nonatomic) IBOutlet UITableView *tableviewDropdown;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isDropdownOpen = 0;
    
    arrayTableData = @[@"Siva", @"Kumar", @"Cwah", @"Cumaar"];
    
    _tableviewDropdown.hidden = YES;
    
    _tableviewDropdown.delegate = self;
    _tableviewDropdown.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDropdown:(id)sender {
    
    if (isDropdownOpen) {
        _tableviewDropdown.hidden = NO;
        
        [UIView animateWithDuration:2.0f
                              delay:1.5f
                            options: UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             _tableviewDropdown.hidden = YES;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                         }];
        isDropdownOpen = 0;
        

    } else {
        _tableviewDropdown.hidden = YES;
        
        [UIView animateWithDuration:2.0f
                              delay:1.5f
                            options: UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             _tableviewDropdown.hidden = NO;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                         }];
        isDropdownOpen = 1;

    }
    

    
}

#pragma mark - Tableview delegate method
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayTableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [arrayTableData objectAtIndex:indexPath.row];
    
    return cell;
}
@end
