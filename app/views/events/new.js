$(function(){
  $('#city').change(function(){

    cityId = $(this).val();

    if(cityId){
      $.ajax({
        method: 'POST',
        url: '/getjson',
        dataType: 'json',
        data: { 'city_id': cityId },
        success: function(data){
          var items = [];

          $.each(data, function(key, val){

            items.push('<option id="' + key + '">' + val + '</option>');

          });

          $('#venue').html(items.join(''));

        },

        statusCode: {
          404: function() {
            alert("There was a problem");
          }
        }
      });
    }else{
      $('#venue').html('<option>Select City First</option>')
    }

  });

});
