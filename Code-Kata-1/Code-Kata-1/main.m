//
//  main.m
//  Code-Kata-1
//
//  Created by Tom Williamson on 4/15/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL pal(NSString *text);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //
        //  find sum on digits divisable by 3 or 5
        //
 
        int total=0;
        for (int i=1; i < 1000; i++) {
            if (i % 3 == 0 || i % 5 == 0){
                total += i;
            }
        }
        
        NSLog(@"Sum for numbers: %d", total);
        
        //
        //  find largest palindrome
        //
        
        int large=0;
        int m1=0;
        int m2=0;
        const int max=999;
        
        for (int i=1; i <= max; i++) {
            for (int j = i; j <= max; j++) {
                int product = i*j;
                if (pal([NSString stringWithFormat:@"%d", product])) {
                    if (product > large) {
                        large = product;
                        m1 = i;
                        m2 = j;
                    }
                }
            }
        }
                    
        NSLog(@"Palindrome : %d * %d = %d", m1, m2, large);
        
    }
    
    
    return 0;
                             
}


//
//  see if passed string is a palindrome
//

BOOL pal(NSString *text) {

    if (text.length <= 1)
        return YES;
    
    else if ([text characterAtIndex:0] != [text characterAtIndex:text.length-1])
        return NO;
    
    else
        return(pal([text substringWithRange:NSMakeRange(1, text.length-2)]));
    
}


