

function formatDouble(obj)
{
	var num = new NumberFormat();
	num.setInputDecimal(',');
	num.setSeparators(true, '.', ',');
	num.setPlaces('2', false);
	num.setCurrencyValue('R$');
	num.setCurrency(false);
	num.setCurrencyPosition(num.LEFT_OUTSIDE);
	num.setNegativeFormat(num.LEFT_DASH);
	num.setNegativeRed(false);
	num.setNumber(obj.value);
	obj.value = num.toFormatted();
	
	return true;
}


function disableForm(theform) 
{
	//if (document.all || document.getElementById) 
	//{
		for (i = 0; i < theform.length; i++) 
		{
			var tempobj = theform.elements[i];
			if (tempobj.type.toLowerCase() == "submit")
				tempobj.disabled = true;
		}
	//}
}

function confirmDeleteRecord()
{
	if(!confirm("Você realmente deseja remover o registro?"))
		return false;
	return true;
}






