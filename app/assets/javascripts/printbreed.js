	var counter = 0;
	var new_id = "breed_" + counter;

	function list_breed() {
		var div = document.getElementById("breed_output");		
		var input = document.createElement("input");
		input.id = "addtl_breeds"
		input.name = new_id
		input.type = "text"

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

	//Rather than this approach, make dynamic "Add Another Breed" button that allows the admin to add another breed field as needed. Also consider adding "Remove" function to each field so no blanks are left. Name must be unique - need var that tracks how many field are being used.