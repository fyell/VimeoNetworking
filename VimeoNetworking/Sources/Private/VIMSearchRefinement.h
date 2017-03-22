//
//  VIMSearchRefinement.h
//  Vimeo
//
//  Created by Huebner, Rob on 6/18/15.
//  Copyright (c) 2015 Vimeo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VIMSearchRefinementAppearance) {
    VIMSearchRefinementAppearanceSegmented,
    VIMSearchRefinementAppearanceList
};

@interface VIMSearchRefinement : NSObject

@property (nonatomic, assign, readonly) VIMSearchRefinementAppearance appearance;

@property (nonatomic, strong, readonly, nonnull) NSString *displayName;
@property (nonatomic, strong, readonly, nonnull) NSArray *displayValues;
@property (nonatomic, assign, readonly) NSUInteger defaultValue;

@property (nonatomic, assign, readonly) BOOL valueSelected;
@property (nonatomic, assign) NSUInteger selectedValue;

#pragma mark - Constant refinement creators

+ (nonnull VIMSearchRefinement *)videoSortRefinement;
+ (nonnull VIMSearchRefinement *)videoDateRefinement;
+ (nonnull VIMSearchRefinement *)videoLengthRefinement;

+ (nonnull VIMSearchRefinement *)userSortRefinement;

+ (nonnull VIMSearchRefinement *)channelSortRefinement;

#pragma mark -

- (NSUInteger)getSelectedDisplayIndex;
- (nullable NSDictionary *)getParameters;

@end
