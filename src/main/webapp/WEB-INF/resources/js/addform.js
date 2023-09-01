function addPrescriptionField(){
	html='<tr id=count>\
				<td><input type="text" name="desc" placeholder="Write here" required></td>\
				<td><input type="text" name="med" placeholder="Write here" required="true"></td>\
				<td><input type="number" name="dose" min="1" placeholder="Write here" required></td>\
				<td><select name="timing" >\
						<option value="Morning">Morning</option>\
						<option value="Evening">Evening</option>\
						<option value="AfterNoon">AfterNoon</option>\
				</select></td>\
			</tr>'
			
			var form = document.getElementById('p');
			form.innerHTML+=html;
}

function removePrescriptionField(){
			var input = document.getElementById('count').remove();
}