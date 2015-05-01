//
//  RARecipeDetailViewController.m
//  Recipe App
//
//  Created by Justin Huntington on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeDetailViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

static CGFloat margin = 20;

@interface RARecipeDetailViewController ()

@end

@implementation RARecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    static CGFloat topMargin = 20;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat descriptionHeight = [self descriptionHeight:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, descriptionHeight)];
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    
    descriptionLabel.numberOfLines = 0;
    [scrollView addSubview:descriptionLabel];
    
    
    
    CGFloat top = topMargin + descriptionHeight + margin * 2;
    
    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin), 20)];
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont systemFontOfSize:16];
    [scrollView addSubview:ingredientsLabel];
    
    top += 20 + margin;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++)
    {
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin)/4, 20)];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        volume.font = [UIFont systemFontOfSize:16];
        [scrollView addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin)/4, top, (self.view.frame.size.width -2 * margin), 20)];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        type.font = [UIFont systemFontOfSize:16];
        [scrollView addSubview:type];
        
        top += (20 + margin);
    }
    
    top +=  margin;
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin), 20)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont systemFontOfSize:17];
    [scrollView addSubview:directionsTitle];
    
    top += 20 + margin;
    
    for (int i = 0 ; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++)
    {
        CGFloat height = [self directionHeight:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.text = [NSString stringWithFormat:@"%d", i+1];
        count.font = [UIFont systemFontOfSize:16];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        direction.numberOfLines = 0;
        direction.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        
        [scrollView addSubview:direction];
        
        top +=(height + margin);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
    
}



- (CGFloat)descriptionHeight:(NSString *)description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    return bounding.size.height;
}

- (CGFloat)directionHeight:(NSString *)description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    return bounding.size.height;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
