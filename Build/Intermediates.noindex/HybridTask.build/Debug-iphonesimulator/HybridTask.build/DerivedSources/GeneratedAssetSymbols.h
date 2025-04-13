#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "Cart" asset catalog image resource.
static NSString * const ACImageNameCart AC_SWIFT_PRIVATE = @"Cart";

/// The "Fav" asset catalog image resource.
static NSString * const ACImageNameFav AC_SWIFT_PRIVATE = @"Fav";

/// The "RightArrow" asset catalog image resource.
static NSString * const ACImageNameRightArrow AC_SWIFT_PRIVATE = @"RightArrow";

/// The "Star" asset catalog image resource.
static NSString * const ACImageNameStar AC_SWIFT_PRIVATE = @"Star";

/// The "checkmark" asset catalog image resource.
static NSString * const ACImageNameCheckmark AC_SWIFT_PRIVATE = @"checkmark";

/// The "share" asset catalog image resource.
static NSString * const ACImageNameShare AC_SWIFT_PRIVATE = @"share";

#undef AC_SWIFT_PRIVATE
