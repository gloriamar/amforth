\ Author: 
\ Gloria Martorella <gloria.martorella@unipa.it>
\ DICGIM - University of Palermo - Italy
\ Viale delle Scienze - Ed. 6, 90128 Palermo, Italy

\ Date: 2014
\ License: General Public License (GPL) Version2 from 1991.

\ A simple file to work with Iris leds. 
\ marker.frt and bitnames.frt required.
\ *Usage: green led on* 

marker _led_

$1 constant yellow
$2 constant green
$4 constant red

: led-on ( pin port -- ) 
      low ;

: led-off ( pin port -- )
      high ;
 
: led ( pin -- pin port xt-on xt-off )
      PORTA ['] led-on ['] led-off ;

: led-init ( -- )
      green PORTA pin_output 
      yellow PORTA pin_output 
      red PORTA pin_output 
      $FF PORTA !
;

: on ( pin port xt-on xt-off -- ) 
      drop execute ;

: off ( pin port xt-on xt-off -- ) 
      nip execute ;

: blink ( pin port xt-on xt-off -- )
      >R >R over over R> 
      execute 20 ms R> execute ; 
 