//
//  ViewController.m
//  MIResizableTableViewDemo
//
//  Created by Mario on 17/01/16.
//  Copyright © 2016 Mario. All rights reserved.
//

#import "ViewController.h"
#import "MIResizableTableView.h"

#import "CategoryView.h"
#import "ProductTableViewCell.h"

@interface ViewController () <MIResizableTableViewDataSource, MIResizableTableViewDelegate>

@property (nonatomic, strong) NSArray <NSDictionary *> *productsList;

@property (nonatomic, weak) IBOutlet MIResizableTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView configureWithDelegate:self andDataSource:self];
    [self.tableView registerNib:[ProductTableViewCell cellNib] forCellReuseIdentifier:[ProductTableViewCell cellIdentifier]];
    
    self.productsList = @[
                          @{
                              @"category":@"T-Shirts",
                              @"products":@[
                                      @{
                                          @"title":@"Red t-shirt",
                                          @"description":@"This red t-shirt is really awesome!",
                                          @"price":@"12€"
                                          },
                                      @{
                                          @"title":@"Blue t-shirt",
                                          @"description":@"This blue t-shirt is really cool!",
                                          @"price":@"11.3€"
                                          },
                                      @{
                                          @"title":@"Yellow t-shirt",
                                          @"description":@"This red t-shirt is really fresh!",
                                          @"price":@"10.4€"
                                          },
                                      @{
                                          @"title":@"Black t-shirt",
                                          @"description":@"This black t-shirt is really expensive!",
                                          @"price":@"16€"
                                          },
                                      @{
                                          @"title":@"Cyan t-shirt",
                                          @"description":@"This cyan t-shirt is really wonderful!",
                                          @"price":@"13€"
                                          }
                                      ]
                              },
                          @{
                              @"category":@"Pullover",
                              @"products":@[
                                      @{
                                          @"title":@"Blue pullover",
                                          @"description":@"This blue t-shirt is really fresh!",
                                          @"price":@"23€"
                                          },
                                      @{
                                          @"title":@"Yellow pullover",
                                          @"description":@"This yellow t-shirt is really cool!",
                                          @"price":@"21.7€"
                                          },
                                      @{
                                          @"title":@"Cyan pullover",
                                          @"description":@"This cyan t-shirt is really awesome!",
                                          @"price":@"50€"
                                          }
                                      ]
                              },
                          @{
                              @"category":@"Jeans",
                              @"products":@[
                                      @{
                                          @"title":@"Blue jeans",
                                          @"description":@"This blue jeans is really classy!",
                                          @"price":@"23€"
                                          },
                                      @{
                                          @"title":@"Black jeans",
                                          @"description":@"This black jeans is really skinny!",
                                          @"price":@"21.7€"
                                          }
                                      ]
                              },
                          @{
                              @"category":@"Hats",
                              @"products":@[
                                      @{
                                          @"title":@"Red hat",
                                          @"description":@"This red hat is really classy!",
                                          @"price":@"15€"
                                          },
                                      @{
                                          @"title":@"Yellow hat",
                                          @"description":@"This yellow hat is really expensive!",
                                          @"price":@"50€"
                                          },
                                      @{
                                          @"title":@"Purple hat",
                                          @"description":@"This purple hat is really cool!",
                                          @"price":@"16€"
                                          },
                                      @{
                                          @"title":@"Orange hat",
                                          @"description":@"This orange hat is really fresh!",
                                          @"price":@"17.5€"
                                          },
                                      @{
                                          @"title":@"Blue hat",
                                          @"description":@"This blue hat is really wonderful!",
                                          @"price":@"13€"
                                          },
                                      @{
                                          @"title":@"Brown hat",
                                          @"description":@"This brown hat is really cheap!",
                                          @"price":@"10€"
                                          }
                                      ]
                              }
                          ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MIResizableTableViewDataSource
- (NSInteger)numberOfSectionsInResizableTableView:(MIResizableTableView *)resizableTableView {
    
    return self.productsList.count;
}
- (NSInteger)resizableTableView:(MIResizableTableView *)resizableTableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[self.productsList objectAtIndex:section] objectForKey:@"products"] count];
}

- (UIView *)resizableTableView:(MIResizableTableView *)resizableTableView viewForHeaderInSection:(NSInteger)section {
    
    NSDictionary *categoryDictionary = [self.productsList objectAtIndex:section];
    return [CategoryView getViewWithTitle:[categoryDictionary objectForKey:@"category"] andProductsNumber:[[categoryDictionary objectForKey:@"products"] count]];
    
    
}
- (UITableViewCell *)resizableTableView:(MIResizableTableView *)resizableTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductTableViewCell *cell = [resizableTableView dequeueReusableCellWithIdentifier:[ProductTableViewCell cellIdentifier] forIndexPath:indexPath];
    
    NSDictionary *productDictionary = [[[self.productsList objectAtIndex:indexPath.section] objectForKey:@"products"] objectAtIndex:indexPath.row];
    
    [cell configureWithProductTitle:[productDictionary objectForKey:@"title"] description:[productDictionary objectForKey:@"description"] andPrice:[productDictionary objectForKey:@"price"]];
    
    return cell;
    
}

#pragma mark - MIResizableTableViewDelegate
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (UITableViewRowAnimation)resizableTableViewInsertRowAnimation {
    
    return UITableViewRowAnimationFade;
}
- (UITableViewRowAnimation)resizableTableViewDeleteRowAnimation {
    
    return UITableViewRowAnimationFade;
}

- (BOOL)resizableTableViewSectionShouldExpandSection:(NSInteger)section {
    
    return YES;
}

- (void)resizableTableView:(MIResizableTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *selectedProduct = [[[self.productsList objectAtIndex:indexPath.section] objectForKey:@"products"] objectAtIndex:indexPath.row];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[selectedProduct objectForKey:@"title"] message:[selectedProduct objectForKey:@"description"] preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Buy for %@", [selectedProduct objectForKey:@"price"]] style:UIAlertActionStyleDefault handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:^{
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }];
}

@end
