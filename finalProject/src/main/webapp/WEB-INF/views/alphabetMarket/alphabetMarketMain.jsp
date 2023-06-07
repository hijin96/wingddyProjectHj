<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alphabet Market</title>
<style>
	#selling{
		text-align: right !important;
	}

	.boardDetail:hover{
		cursor: pointer;
	}

	.colorCH{
		background-color: #e9e9e9 !important;
	}

	.title{
		color: #6777ef !important;
		font-weight:bolder !important;
	}

	.writeInfo{
		font-size: smaller !important;
		font-weight :bold !important;
	}
</style>


</head>
<body>
<div id="app">
	
	<jsp:include page="../sideBar/sideBar.jsp" />
	    <div class="main-content">
	     
	    <section class="section">
	        <div class="section-header">
	     		<h1>Alphabet Market</h1>
	        </div>
	
	        <div class="section-body">
	            <div style="text-align: center;" id="filterButton">
					
	            </div>
				<div class="form-check" id="selling">
					<input class="form-check-input" type="checkbox" id="sellingCheck">
					<label class="form-check-label" for="defaultCheck1">
					  거래완료 안보기 
					</label>
				</div>
	             
	            <br><br>
	
	            <div>
	                <div class="row" id="contentRow">
						
	                </div>
	            </div>
	
		        
	            
	        </div>
	    </section>
	    
	</div>

</div>







<script>
	
	var alphaValue = '';
	
	
	$(function(){

		if('${cookie.blinding.value}' == 'Y'){
			$("#sellingCheck").prop("checked", true);
		}
		
		selectFilterList();

		createButton();
		
		

		$(document).on('click', '.clickFilter', function(){

			if(alphaValue != this.value){
				alphaValue = this.value;
				selectFilterList();
				//console.log(alphaValue);
			}
			else{
				alphaValue = '';
				createButton();
				//console.log('버튼생성');
				selectFilterList();
			}
		});

		$(document).on('click', '#sellingCheck', function(){

			selectFilterList();
		
		});


		$(document).on('click', '.boardDetail', function(){

			console.log('클릭123');

			window.location.href="detail.aph?bno="+ $(this).find('input[type="hidden"]').val();	

		});

	})



	function createButton(){
		var alphabetArr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

		
		let value = '';
		for(let i in alphabetArr){
			value += '<input type="button" value="'+ alphabetArr[i] +'" class="btn btn-primary btn-lg clickFilter">'

			if(alphabetArr[i] === 'M'){
				value +='<br>'
			}
		}

		$('#filterButton').html(value);
	}

	function selectFilterList(){

		//console.log('리스트가져오기!!!');
		
		var ajaxAlphabet;
		var ajaxSelling;

		if (alphaValue !== '') {
			ajaxAlphabet = alphaValue;
		}
		
		if ($('#sellingCheck').is(':checked')) {
			ajaxSelling = 'Y';
		}
		


		$.ajax({
			url : 'list.aph',
			data  : {
				classNo : '${sessionScope.classroom.classNo}',
				alphabet : ajaxAlphabet,
				sellingStatus : ajaxSelling
			},
			success : function(list){	
				
				let value = '';
				
				for(let i in list){

					if(list[i].sellingStatus == 'Y'){
						value  += '<div class="col-12 col-md-4 col-lg-4 boardDetail">'
								+ '<article class="article article-style-c">'
								+ '<div class="article-header">'
								+ '<p style="text-align: center; font-size: 150px; margin-top: 100px;">' + list[i].alphabet + '</p>'
								+ '</div><hr><div class="article-details">'
								+ '<div class="article-category writeInfo">' + list[i].writer
								+ '<div class="bullet writeInfo"></div>'+ list[i].createDate +'</div>'
								+ '<div class="article-user"><div class="article-user-details"><div class="user-detail-name title">' + list[i].title
								+ '<input type="hidden" value="' + list[i].marketBno + '" name="bno"></div></div></div></div></article></div>'
					}
					else{
						value  += '<div class="col-12 col-md-4 col-lg-4 boardDetail">'
								+ '<article class="article article-style-c colorCH">'
								+ '<div class="article-header">'
								+ '<p style="text-align: center; font-size: 150px; margin-top: 100px;">' + list[i].alphabet + '</p>'
								+ '</div><hr><div class="article-details colorCH">'
								+ '<div class="article-category writeInfo">' + list[i].writer
								+ '<div class="bullet writeInfo"></div>'+ list[i].createDate +'</div>'
								+ '<div class="article-user"><div class="article-user-details"><div class="user-detail-name title">' + list[i].title
								+ '<input type="hidden" value="' + list[i].marketBno + '" name="bno"></div></div></div></div></article></div>'
					}
					
				
				}		
				
				$('#contentRow').html(value);
						
			},
			error : function(){
				console.log('error!!!!!!')
			}
		})
	}
	


</script>






</body>
</html>