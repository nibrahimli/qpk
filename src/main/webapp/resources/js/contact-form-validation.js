/**
 * Validation of form in contact page 
 */
$('#contactInfo').validate({
	 	ignore: ".ignore",
		rules: {
            name: {
                minlength: 3,
                maxlength: 15,
                required: true
            },
            email: {
                email: true
            },
            subject: {
            	minlength: 5,
                maxlength: 100                
            },
            telephon: {
            	required :true,
                minlength: 10,
                maxlength: 15,
                number : true
            },
            message: {
            	required :true,
            	minlength: 10,
                maxlength: 500                
            },
            hiddenRecaptcha:{
            	required: function(element){
            		var value = $('input[name="hiddenRecaptcha"]').val();            		
            		if(value == '') return true;
            		else			return false;            		
            	}
            }
        },
        messages : {
        	name: { 
        		required : "Adınızı daxil edin",
        		minlength : "Ən azı 3 simvol daxil edin",
        		maxlength : "Simvolların sayı 15-dən az olmalıdır",
        	},
        	email:{
        		email: "Daxil etdiyiniz e-mail ad@domain.com formatda olmalıdır"
        	},
        	subject: {
        		minlength : "Ən azı 5 simvol daxil edin",
        		maxlength : "Simvolların sayı 100-dən az olmalıdır",
        	},
        	telephon: {
        		required : "Telefon nömrənizi daxil edin",
        		minlength : "Ən azı 10 simvol daxil edin",
        		maxlength : "Simvolların sayı 15-dən az olmalıdır",
        		number : "Telefon nömrənizi daxil edin"
        	},
        	message:{
        		required : "Mesajınızı daxil edin",
        		minlength : "Ən azı 10 simvol daxil edin",
        		maxlength : "Simvolların sayı 500-dən az olmalıdır"        		
        	},
        	hiddenRecaptcha:{
            	required: "reCAPTCHAni təsdiqləyin"
            }
        },
        highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        }
    });

	