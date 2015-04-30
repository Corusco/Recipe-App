//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Justin Huntington on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipeDetailViewController.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (strong) UITableView *tableView;
@property (strong) RecipesTableViewDataSource *dataSource;
@property (nonatomic, assign) NSInteger recipeIndex;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.title = @"Favorite Recipes";
    self.dataSource = [RecipesTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RARecipeDetailViewController *recipeDetailView = [RARecipeDetailViewController new];
    NSString *recipeName = 
    
    [self.navigationController pushViewController:recipeDetailView animated:YES];
    
    
    
    
}

@end
