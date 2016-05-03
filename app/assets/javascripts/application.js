// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require angular
//= require bootstrap




(function(angular) {
'use strict';

angular.module("bcApp", [])
	.controller('infoController', ['$scope', function($scope) {
		$scope.data = {
			print_method_id: "0",
			ink_color_id: "0",
			bleed_id: "1",
			raised_ink_id: "1",
			dimensions_id: "1",
			paper_type_id: "0",
			coating_id: "1",
			quantity_id: "0",
			box_count_id: "0",
			metal_id: "1"
		};
	}]);
})(window.angular);





$(document).ready(function() {

	var selectError = function() {
		$('.select-error').html("<p class='alert-error'>Please make sure all options are selected.</p>");
	};


	$(".back-button").on( "click", function(event) {
		event.preventDefault();
		console.log("reached back"); //get rid of
	  window.history.back();
	});


	$( ".small-btn-search" ).on( "click", function(event) {

		var selectMessage = false;
		
		$(".select-error").empty();
		$('.alert-success').addClass("hide");
		$( "select" ).css( "color", "#3277b3" );
		
		if ( $('select[name=print_method_id]').val() == "0" ) {
			event.preventDefault();
			$( "#print_method_id" ).css( "color", "#ff5c33" );
			selectMessage = true;
		};

		if ( $('select[name=ink_color_id]').val() == "0" ) {
			event.preventDefault();
			$( "#ink_color_id" ).css( "color", "#ff5c33" );
			selectMessage = true;
		};

		if ( $('select[name=quantity_id]').val() == "0" ) {
			event.preventDefault();
			$( "#quantity_id" ).css( "color", "#ff5c33" );
			selectMessage = true;
		};

		if ( $('select[name=box_count_id]').val() == "0" ) {
			event.preventDefault();
			$( "#box_count_id" ).css( "color", "#ff5c33" );
			selectMessage = true;
		};

		if ( $('select[name=paper_type_id]').val() == "0" ) {
			event.preventDefault();
			$( "#paper_type_id" ).css( "color", "#ff5c33" );
			selectMessage = true;
		};

		if ( selectMessage == true ) {
			console.log("Reached conditional.");
			console.log(selectError());
			selectError();
		};

	});

	$('.new-bc-btn').on( "click", function(event) {
		if ( $(".new-bc-price").val() == "Add Price" || $(".new-bc-cost").val() == "Add Cost" ) {
			event.preventDefault();
			$(".price-cost-error").empty();
			$(".price-cost-error").append("<h4 class='error text-center'>Please enter the Price and Cost.</h4>");
		};
	});

	// var replaced = $(".edit-price-table").html().replace(/Cmyk/g,'CMYK');
	// $(".edit-price-table").html(replaced);

});





 