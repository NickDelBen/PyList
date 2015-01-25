/**
 * A message to notify a client the track has changed
 *
 * Created on: January 24, 2015
 * Created by: Nick DelBen
 * 
 * Last Modified: January 24, 2015
 *   - Created
 */

#ifndef _TRACK_CHANGE_H
#define _TRACK_CHANGE_H

#include <stdint.h>

#include "../cache/cache_types.h"
#include "playlist_status"

typedef struct {
  id current_track;
  playlist_status cache;
} track_change_t;

#endif