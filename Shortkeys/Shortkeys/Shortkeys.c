//
//  Shortkeys.c
//  Shortkeys
//
//  Created by Tadeusz Wyrzykowski on 08.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

#include <mach/mach_types.h>

kern_return_t Shortkeys_start(kmod_info_t * ki, void *d);
kern_return_t Shortkeys_stop(kmod_info_t *ki, void *d);

kern_return_t Shortkeys_start(kmod_info_t * ki, void *d)
{
    return KERN_SUCCESS;
}

kern_return_t Shortkeys_stop(kmod_info_t *ki, void *d)
{
    return KERN_SUCCESS;
}
