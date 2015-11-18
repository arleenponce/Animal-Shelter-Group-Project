	var counter = 1;
	var new_id = "breed_" + counter;

	function list_breed() {
		if (counter === 4) {
			document.getElementById("breed_btn").disabled = true;
		}

		var div = document.getElementById("breed_output");		
		var input = document.createElement("input");
		input.className = "addtl_breeds"
		input.name = new_id
		input.type = "text"
		input.id = new_id

		var input_breed = document.getElementById('breed_name').value;
		var text_breed = document.createTextNode(input_breed);

		div.appendChild(input);
		var input_changed = input.appendChild(text_breed);
		input.appendChild(input_changed);

		var br = document.createElement("br");
		div.appendChild(br);

		counter++;
		new_id = "breed_" + counter;
	};