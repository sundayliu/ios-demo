//
//  PSDrawings.h
//  PaperStackDemo
//
//  Created by Lorenzo Manfredi on 28/05/11.
//  Copyright 2011 Mutado. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PSPagesViewPageOrientationUnknow,
	PSPagesViewPageOrientationPortrait,
	PSPagesViewPageOrientationLandscape
	
} PSPagesViewPageOrientation;

typedef enum {
	PSDrawingsPixelFormat_Automatic = 0,
	//! 32-bit texture: RGBA8888
	PSDrawingsPixelFormat_RGBA8888,
	//! 16-bit texture without Alpha channel
	PSDrawingsPixelFormat_RGB565,
	//! 8-bit textures used as masks
	PSDrawingsPixelFormat_A8,
	//! 16-bit textures: RGBA4444
	PSDrawingsPixelFormat_RGBA4444,
	//! 16-bit textures: RGB5A1
	PSDrawingsPixelFormat_RGB5A1,	
    
	//! Default texture format: RGBA8888
	PSDrawingsPixelFormat_Default = PSDrawingsPixelFormat_RGBA8888
	
} PSDrawingsPixelFormat;


CGMutablePathRef PSCreatePagePath( CGRect rect, CGFloat padding, CGFloat span );

CGMutablePathRef PSCreatePageSquarePath( CGRect rect, CGFloat padding, CGFloat span );

CGMutablePathRef PSCreateRoundedBoxPath( CGRect rect, CGFloat radius );


unsigned int PSNextPOT( unsigned int x );

CGPoint PSVector( CGPoint firstPoint, CGPoint secondPoint );

CGFloat PSDistance( CGPoint firstPoint, CGPoint secondPoint );

CGFloat PSAngle( CGPoint firstPoint, CGPoint secondPoint );

CGFloat PSQuad( CGFloat ft, CGFloat f0, CGFloat f1 );

CGFloat PSLinear( CGFloat ft, CGFloat f0, CGFloat f1 );

CGFloat PSPower( CGFloat ft, CGFloat f0, CGFloat f1, CGFloat p );

CGPoint PSRotatePointBy( CGPoint point, CGPoint origin, CGFloat angle );

CGAffineTransform PSRectScaleAspectFit( CGRect innerRect, CGRect outerRect );

