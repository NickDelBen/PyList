/**
 * A message trackign the current status fo a playlist.
 * Useful for keeping track of the cache
 *
 * Created on: January 24, 2015
 * Created by: Nick DelBen
 * 
 * Last Modified: January 24, 2015
 *   - Created
 */

#ifndef _PLAYLIST_STATUS_H
#define _PLAYLIST_STATUS_H

#include <stdint.h>

#include "../cache/cache_types.h"

typedef struct {
  timestamp playing;      //Last time now playing track was switched
  timestamp queued;       //Last time the set of queued tracks was switched
  timestamp contributors; //Last time the list of contributors changed
} cache_status_t;

#endif