<?php 
function integerToRoman($integer){
	// Convert the integer into an integer (just to make sure)
	$integer = intval($integer);
	$result = '';

	// Create a lookup array that contains all of the Roman numerals.
	$lookup = array('M' => 1000,
	'CM' => 900,
	'D' => 500,
	'CD' => 400,
	'C' => 100,
	'XC' => 90,
	'L' => 50,
	'XL' => 40,
	'X' => 10,
	'IX' => 9,
	'V' => 5,
	'IV' => 4,
	'I' => 1);

	foreach($lookup as $roman => $value){
	// Determine the number of matches
	$matches = intval($integer/$value);

	// Add the same number of characters to the string
	$result .= str_repeat($roman,$matches);

	// Set the integer to be the remainder of the integer and the value
	$integer = $integer % $value;
	}

	// The Roman numeral should be built, return it
	return $result;
}
function porcentaje($total, $cantidad){
	$porcentaje = ($cantidad*100)/$total;
	if($porcentaje == 0){
		return 0;
	}else{
		return number_format($porcentaje,1,",",".");
	}	
}
function meses($mes){
    switch ($mes) {      
        case '01':
          # code...
          return 'ENERO';
          break;
        case '02':
          # code...
          return 'FEB';
          break;
        case '03':
          # code...
          return 'MARZO';
          break;
        case '04':
          # code...
          return 'ABRIL';
          break;
        case '05':
          # code...
          return 'MAY';
          break;
        case '06':
          # code...
          return 'JUN';
          break;
        case '07':
          # code...
          return 'JUL';
          break;
        case '08':
          # code...
          return 'AGOS';
          break;
        case '09':
          # code...
          return 'SEPT';
          break;
        case '10':
          # code...
          return 'OCT';
          break;
        case '11':
          # code...
          return 'NOV';
          break;
        case '12':
          # code...
          return 'DIC';
          break;                 
      default:
        # code...
        break;
    }
  }

?>