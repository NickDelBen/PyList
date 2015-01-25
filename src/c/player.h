/**
 * A server that allows playing fo online music in c.
 *
 * Created on: January 24, 2015
 * Created by: Nick DelBen
 * 
 * Last Modified: January 24, 2015
 *   - Created
 */

#ifndef _PLAYER_H
#define _PLAYER_H

#include "linked_list/linked_list.h"

//The unique id for an element
typedef id uint32_t;

typedef struct {
  id current_track; //The track currently playing on the player
} player_t;

#endif