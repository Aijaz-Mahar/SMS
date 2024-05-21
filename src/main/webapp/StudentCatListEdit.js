function edit_row(no)
{alert("asd");
document.getElementById("edstdcat"+no).style.display="none";
 
	
 var catid=document.getElementById("tcid"+no);
 var catname=document.getElementById("tcname"+no);
 
	
 var id_data=catid.innerHTML;
 var name_data=catname.innerHTML;
 
	
 name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
 country.innerHTML="<input type='text' id='country_text"+no+"' value='"+country_data+"'>";
 age.innerHTML="<input type='text' id='age_text"+no+"' value='"+age_data+"'>";
}
