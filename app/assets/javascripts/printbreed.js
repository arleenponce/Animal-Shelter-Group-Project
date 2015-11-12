
	function list_breed() {
		var ul = document.getElementById("breed_output");		
		var li = document.createElement("li");
		var input_breed = document.getElementById('breed_name').value;
		var text_breed = document.createTextNode(input_breed);

		// document.getElementById("breed_output").appendTo(input_breed);

		ul.appendChild(li);
		var li_changed = li.appendChild(text_breed);
		li.appendChild(li_changed);
	};