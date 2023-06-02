<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단어장 등록</title>

<style>
	.vocalist{
		
	}
</style>
</head>
<body>
	<jsp:include page="../sideBar/sideBar.jsp"/>

	<div class="main-content">
		
		<div class="row">
        	<div class="col-12 col-md-6 col-lg-6">
              	<div style="height:50px;"></div>
				<div class="card">
					<div class="card-header">
						<h2>단어장 등록</h2>
					</div>
					<div class="card-body">
						<form>
							<div class="form-group">
								<label>단어장 이름</label>
								<input type="text" class="form-control">
							</div>
							<div class="form-group">
								<label>단어</label>
								<input type="text" class="form-control">
							</div>
			                <table class="table" id="voca_table">
								<thead>
									<tr>
										<th>단어</th>
										<th>뜻</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<div class="card-footer text-right">
			                      <button class="btn btn-primary">등록</button>
			                </div>
		                </form>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-6">
              	<div style="height:50px;"></div>
				<div class="card">
					<div class="card-header">
						<h2>단어 추가</h2>
					</div>
					<div class="card-body">
						<h5>직접 입력</h5>
						<div class="form-row" id="inject-voca">
							<input type="hidden" value="1" id="voca-index-form"/>
							<div class="form-group col-md-6">
								<label>영어</label>
								<input type="text" class="form-control" id="voca-en-form">
							</div>
							<div class="form-group col-md-6">
								<label>해석</label>
								<input type="text" class="form-control" id="voca-kr-form">
							</div>
						</div>
						<div class="card-footer text-right">
		                      <button class="btn btn-primary" id="inject-voca-btn">추가</button>
		                </div>
		                <h5>단어 검색</h5>
						<div class="form-group">
							<input type="text" class="form-control" id="voca-search-form">
							<div class="card voca-list">
								<div class="row">
									<div class="group col-md-6"> 영어</div>
									<div class="group col-md-6"> 해석</div>
								</div>
								<div class="row">
									<div class="group col-md-6"> 영어</div>
									<div class="group col-md-6"> 해석</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 단어장 등록
		
		// 단어 추가
		$('#inject-voca-btn').click(() => {
			let en = $('#voca-en-form').val();
			let kr = $('#voca-kr-form').val();
			let value = $('#voca_table tbody').html();
				value += '<tr>'
					  +  '<td>'+ en +'</td>'
					  +  '<td>'+ kr +'</td>'
					  +  '</tr>';
					  
			$('#voca_table tbody').html(value);
		});
		
		// 추가된 단어 삭제
		$('#voca_table tbody').on('click','tr',() => {
			
		});
		
		// 단어 검색(ajax)
	
	
	</script>
</body>
</html>