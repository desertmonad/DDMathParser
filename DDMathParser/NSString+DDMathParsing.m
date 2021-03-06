//
//  NSString+DDMathParsing.m
//  DDMathParser
//
//  Created by Dave DeLong on 11/21/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "NSString+DDMathParsing.h"
#import "DDExpression.h"

@implementation NSString (DDMathParsing)

- (NSNumber *) numberByEvaluatingString {
	return [self numberByEvaluatingStringWithSubstitutions:nil];
}

- (NSNumber *) numberByEvaluatingStringWithSubstitutions:(NSDictionary *)substitutions {
	NSNumber * returnValue = nil;
	@try {
		DDExpression * e = [DDExpression expressionFromString:self];
		returnValue = [e evaluateWithSubstitutions:substitutions evaluator:nil];
	}
	@catch (NSException * e) {
		NSLog(@"caught exception: %@", e);
	}
	return returnValue;
}

@end
