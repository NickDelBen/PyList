/**
 * A message for the playlist server.
 *
 * Created on: January 24, 2015
 * Created by: Nick DelBen
 * 
 * Last Modified: January 24, 2015
 *   - Created
 */

#ifndef _MESSAGE_H
#define _MESSAGE_H

#include <stdint.h>

//The types of message
typedef message_type uint8_t;
//The flag bits for a message
typedef message_flags uint8_t;
//The sequence number of the message
typedef message_sequence uint16_t;

//A message header
typedef struct {
  message_type type;
  message_flags flags;
  message_sequence sequence;
} message_t;

#endif