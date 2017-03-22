//
//  VIMSearchRefinement.m
//  Vimeo
//
//  Created by Huebner, Rob on 6/18/15.
//  Copyright (c) 2015 Vimeo. All rights reserved.
//

#import "VIMSearchRefinement.h"

@interface VIMSearchRefinement ()

@property (nonatomic, strong, nonnull) NSString *displayName;
@property (nonatomic, strong, nonnull) NSArray *displayValues;

@property (nonatomic, strong, nonnull) NSDictionary *apiParameters;

@property (nonatomic, assign) NSUInteger defaultValue;
@property (nonatomic, assign) VIMSearchRefinementAppearance appearance;

@property (nonatomic, assign) BOOL valueSelected;

@end

@implementation VIMSearchRefinement

#pragma mark - Constant refinement creators

+ (nonnull VIMSearchRefinement *)videoSortRefinement
{
    VIMSearchRefinement *refinement = [VIMSearchRefinement new];
    
    refinement.displayName = NSLocalizedString(@"Sort", nil);
    
    refinement.displayValues = @[NSLocalizedString(@"Relevance", nil),
                                 NSLocalizedString(@"Popularity", nil),
                                 NSLocalizedString(@"Most Recent", nil)];
    
    refinement.apiParameters = @{ @"sort" : @[@"relevant", @"plays", @"date"] };
    
    refinement.defaultValue = 0;
    
    refinement.appearance = VIMSearchRefinementAppearanceSegmented;
    
    return refinement;
}

+ (nonnull VIMSearchRefinement *)videoDateRefinement
{
    VIMSearchRefinement *refinement = [VIMSearchRefinement new];
    
    refinement.displayName = NSLocalizedString(@"Upload Date", nil);
    
    refinement.displayValues = @[NSLocalizedString(@"Anytime", nil),
                                 NSLocalizedString(@"Today", nil),
                                 NSLocalizedString(@"This Week", nil),
                                 NSLocalizedString(@"This Month", nil),
                                 NSLocalizedString(@"This Year", nil)];
    
    refinement.apiParameters = @{ @"filter" : @[@"",
                                                @"upload_date",
                                                @"upload_date",
                                                @"upload_date",
                                                @"upload_date"],
                                  
                                  @"filter_upload_date" : @[@"",
                                                            @"day",
                                                            @"week",
                                                            @"month",
                                                            @"year"]};
    
    refinement.defaultValue = 0;
    
    refinement.appearance = VIMSearchRefinementAppearanceList;
    
    return refinement;
}

+ (nonnull VIMSearchRefinement *)videoLengthRefinement
{
    VIMSearchRefinement *refinement = [VIMSearchRefinement new];
    
    refinement.displayName = NSLocalizedString(@"Length", nil);
    
    refinement.displayValues = @[NSLocalizedString(@"Any", nil),
                                 NSLocalizedString(@"Under 5 min.", nil),
                                 NSLocalizedString(@"Over 5 min.", nil)];

    refinement.apiParameters = @{ @"min_duration" : @[@"", @"", @"300"],
                                  @"max_duration" : @[@"", @"300", @""]};
    
    refinement.defaultValue = 0;
    
    refinement.appearance = VIMSearchRefinementAppearanceSegmented;
    
    return refinement;
}

+ (nonnull VIMSearchRefinement *)userSortRefinement
{
    VIMSearchRefinement *refinement = [VIMSearchRefinement new];
    
    refinement.displayName = NSLocalizedString(@"Sort", nil);
    
    refinement.displayValues = @[NSLocalizedString(@"Relevance", nil),
                                 NSLocalizedString(@"Popularity", nil),
                                 NSLocalizedString(@"Join Date", nil)];
    
    refinement.apiParameters = @{ @"sort" : @[@"relevant", @"followers", @"date"] };
    
    refinement.defaultValue = 0;
    
    refinement.appearance = VIMSearchRefinementAppearanceList;
    
    return refinement;
}

+ (nonnull VIMSearchRefinement *)channelSortRefinement
{
    VIMSearchRefinement *refinement = [VIMSearchRefinement new];
    
    refinement.displayName = NSLocalizedString(@"Sort", nil);
    
    refinement.displayValues = @[NSLocalizedString(@"Relevance", nil),
                                 NSLocalizedString(@"Popularity", nil),
                                 NSLocalizedString(@"Latest", nil)];
    
    refinement.apiParameters = @{ @"sort" : @[@"", @"followers", @"date"] };
    
    refinement.defaultValue = 0;
    
    refinement.appearance = VIMSearchRefinementAppearanceList;
    
    return refinement;
}

#pragma mark -

- (void)setSelectedValue:(NSUInteger)selectedValue
{
    if (_selectedValue != selectedValue)
    {
        _selectedValue = selectedValue;
        
        self.valueSelected = (_selectedValue != self.defaultValue);
    }
}

- (NSUInteger)getSelectedDisplayIndex
{
    if (self.valueSelected && self.selectedValue < [self.displayValues count])
    {
        return self.selectedValue;
    }
    
    return self.defaultValue;
}

- (nullable NSDictionary *)getParameters
{
    if (self.valueSelected && self.selectedValue < [self.displayValues count])
    {
        NSMutableDictionary *parameters = [NSMutableDictionary new];
        
        for (NSString *apiKey in self.apiParameters)
        {
            NSArray *apiParametersForKey = self.apiParameters[apiKey];
            if (self.selectedValue >= [apiParametersForKey count])
            {
                NSAssert(NO, @"malformed apiParameters in VIMSearchRefinement");
                return nil;
            }
            
            NSString *apiValue = [apiParametersForKey objectAtIndex:self.selectedValue];
            if ([apiValue length])
            {
                parameters[apiKey] = apiValue;
            }
        }
        
        return parameters;
    }
    
    return nil;
}

@end
