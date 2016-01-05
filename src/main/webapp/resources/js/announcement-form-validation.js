/**
 * Validation of form in contact page 
 */
$('#announcementInfo').validate({	 	
		rules: {
			roomNumber: {
                number: true
            },
            floor: {
            	number: true            	
            },
            surface: {
            	number: true                
            },
            title: {
            	required :true,
                minlength: 3,
                maxlength: 100                
            },
            summary: {
            	required :true,
            	minlength: 5,
                maxlength: 300                
            },
            description: {
            	required :true,
            	minlength: 5,
                maxlength: 500                
            }
        },
        messages : {
        	roomNumber : "Please enter a number",
        	floor : "Please enter a number",
        	surface : "Please enter a number",
        	title: { 
        		required : "Please enter a title",
        		minlength : "Please enter at least 3 characters",
        		maxlength : "Please enter max 100 characters"
        	},
        	summary:{
        		required : "Please enter a summary",
        		minlength : "Please enter at least 5 characters",
        		maxlength : "Please enter max 300 characters"        		
        	},
        	description:{
        		required : "Please enter a description",
        		minlength : "Please enter at least 5 characters",
        		maxlength : "Please enter max 500 characters"        		
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

	