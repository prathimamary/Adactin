/**
 * 
 */

	function toggleTableRow(id)
		{
          var result_style = document.getElementById(id).style;
          if (result_style.display == 'table-row')
          {
        	  result_style.display = 'none';
          }
          else
          {
        	  result_style.display = 'table-row';
          }
		} 