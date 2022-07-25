const imgDiv = document.querySelector('.profile-pic-div');
const img = document.querySelector('#photo');
const file = document.querySelector('#file');
const upload = document.querySelector('#upload');

//if user hover on profile
imgDiv.addEventListener('mouseenter', function () {
	upload.style.display = "block"
});
//if hover out
imgDiv.addEventListener('mouseleave', function(){
	upload.style.display = "none";
});

//image function if mag pili ta ug image para e ipload
file.addEventListener('change', function(){

	const choosedFile = this.files[0];
	if (choosedFile) {
		const reader = new FileReader();
		reader.addEventListener('load', function
		(){
			img.setAttribute('src',reader.result);
		});

		reader.readAsDataURL(choosedFile);
	}

});

