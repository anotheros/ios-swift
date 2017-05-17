//
//  LYIMOHRTools.h
//  LYTechnologyIMO
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 Beijing Ling iridium Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYIMOHRTools : NSObject

/*
 * 获取当前日期字符串 格式为:YYYY-MM-dd
 */
+ (NSString *)getCurrentDate;


/*
 * 判断输入的电话号码是否正确格式手机号或者座机
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/*
 * 判断输入的电话号码是否正确格式手机号或者座机
 */
+ (BOOL)isTelNumber:(NSString *)mobileNum;

/*
 * 截取日期格式字符串
 */
+ (NSString *)subStringFromDateString:(NSString *)dateString;

/*
 *验证邮箱e-mail
 */
+ (BOOL)verifyEmailAddress:(NSString *)emailString;

/*
 *验证邮编
 */
+ (BOOL) isValidZipcode:(NSString*)value;

/*
 *验证网址
 */
+ (BOOL)isUrlWithString:(NSString *)urlStr;

/*
 *校验银行卡
 */
+ (BOOL)checkCardNo:(NSString*)cardNo;

/*
 *校验身份证
 */
+ (BOOL)checkIdentityCardNo:(NSString*)cardNo;

/*
 *校验护照
 */
+ (BOOL) isValidPassport:(NSString*)value;

@end
