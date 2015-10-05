/**
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
(function() {

	'use strict';

	var merrywrap = document.getElementById( 'merrywrap' ),
          box = merrywrap.querySelector( '.giftbox' ),
          step = 1, stepTimes = [1000,1000,2000,2000];
	var gift = document.getElementById( 'gift' );
	function init() {
      	  box.addEventListener( 'click', runAnimation );
	}

	function runAnimation() {
          classie.remove( merrywrap, 'step-2' );
          classie.add( merrywrap, 'step-1' );
          setTimeout(openCover, 2000);
	}

	function openCover( step ) {
          classie.remove( merrywrap, 'step-1' );
          classie.add( merrywrap, 'step-2' );
          setTimeout(showGift, 1000);
	}
        function showGift(){
          classie.remove( gift, 'giftHidden' );
          classie.add( gift, 'giftShown' );
        }
	init();

})();
